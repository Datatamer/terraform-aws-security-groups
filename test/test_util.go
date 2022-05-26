package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

type SecurityGroupTestCase struct {
	testName         string
	tfDir            string
	expectApplyError bool
	vars             map[string]interface{}
}

// validateModuleOutputs validates that the expected outputs from the module are not nil
func validateModuleOutputs(t *testing.T, terraformOptions *terraform.Options) {

	// brings all outputs inside a map
	outputAll := terraform.OutputAll(t, terraformOptions)
	assert.NotNil(t, outputAll)

	testModuleOut := outputAll["module-security-groups"].(map[string]interface{})
	moduleOut := testModuleOut["security-groups"].(map[string]interface{})
	assert.NotNil(t, moduleOut)

	// grabs each output from the module block and asserts it is not nil
	// treats each output as a "list of anything". Each value has to be cast to its type later (string in this case)
	// as we can't cast a list of interface{} to a list of string directly.
	sgs := moduleOut["security_groups"].([]interface{})
	assert.NotNil(t, sgs)

	ids := moduleOut["security_group_ids"].([]interface{})
	assert.NotNil(t, ids)

	i_ids := moduleOut["ingress_security_group_ids"].([]interface{})
	assert.NotNil(t, i_ids)

	e_ids := moduleOut["egress_security_group_ids"].([]interface{})
	assert.NotNil(t, e_ids)
}
