package test

import (
	"strings"
	"testing"

	"github.com/gruntwork-io/terratest/modules/aws"
	"github.com/gruntwork-io/terratest/modules/random"
	"github.com/gruntwork-io/terratest/modules/terraform"
	test_structure "github.com/gruntwork-io/terratest/modules/test-structure"
	"github.com/stretchr/testify/require"
)

func initTestCases() []SecurityGroupTestCase {

	return []SecurityGroupTestCase{
		{
			testName:         "Test1",
			expectApplyError: false,
			vars: map[string]interface{}{
				"ingress_ports":       []string{"80", "443"},
				"ingress_cidr_blocks": []string{"0.0.0.0/0"},
				"egress_cidr_blocks":  []string{"0.0.0.0/0"},
				"sg_name_prefix":      "",
				"vpc_id":              "",
			},
		},
	}
}

func TestMinimal(t *testing.T) {
	var vpcId string
	var err error

	// Defines one region for all testCases
	usRegions := []string{"us-east-1", "us-east-2", "us-west-1", "us-west-2"}
	// This function will first check for the Env Var TERRATEST_REGION and return its value if != ""
	awsRegion := aws.GetRandomStableRegion(t, usRegions, nil)
	vpcTfOptions := initVpcTerraformOptions(t, awsRegion)

	// Creates one VPC for all testCases
	test_structure.RunTestStage(t, "create_vpc", func() {
		vpcId, err = createVpcE(t, vpcTfOptions)
		require.NoError(t, err)
	})

	defer test_structure.RunTestStage(t, "destroy_vpc", func() {
		terraform.Destroy(t, vpcTfOptions)
	})

	// Begin testCases
	testCases := initTestCases()
	for _, testCase := range testCases {
		t.Run(testCase.testName, func(t *testing.T) {
			// this creates a tempTestFolder for each testCase
			tempTestFolder := test_structure.CopyTerraformFolderToTemp(t, "..", "test_examples/minimal")

			// this stage will generate a random `awsRegion` and a `uniqueId` to be used in tests.
			test_structure.RunTestStage(t, "pick_new_randoms", func() {
				test_structure.SaveString(t, tempTestFolder, "unique_id", strings.ToLower(random.UniqueId()))
			})

			test_structure.RunTestStage(t, "setup_options", func() {
				uniqueID := test_structure.LoadString(t, tempTestFolder, "unique_id")

				testCase.vars["sg_name_prefix"] = uniqueID
				testCase.vars["vpc_id"] = vpcId

				terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
					TerraformDir: tempTestFolder,
					Vars:         testCase.vars,
					EnvVars: map[string]string{
						"AWS_REGION": awsRegion,
					},
				})

				test_structure.SaveTerraformOptions(t, tempTestFolder, terraformOptions)
			})

			test_structure.RunTestStage(t, "create_sg", func() {
				terraformOptions := test_structure.LoadTerraformOptions(t, tempTestFolder)

				_, err = terraform.InitAndApplyE(t, terraformOptions)

				if testCase.expectApplyError {
					require.Error(t, err)
					// If it failed as expected, we should skip the rest (validate function).
					t.SkipNow()
				}

				require.NoError(t, err)
			})

			defer test_structure.RunTestStage(t, "teardown", func() {
				teraformOptions := test_structure.LoadTerraformOptions(t, tempTestFolder)
				terraform.Destroy(t, teraformOptions)
			})

			test_structure.RunTestStage(t, "validate", func() {
				terraformOptions := test_structure.LoadTerraformOptions(t, tempTestFolder)
				validateModuleOutputs(
					t,
					terraformOptions,
				)
			})
		})
	}
}
