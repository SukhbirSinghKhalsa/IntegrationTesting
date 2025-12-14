// reference taken from https://terratest.gruntwork.io/examples/
package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestTerraformHelloWorldExample(t *testing.T) {
	// retryable errors in terraform testing.
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../terraform",
	})

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	output := terraform.Output(t, terraformOptions, 'rg_ids = {"rg1" = "/subscriptions/acd9510d-7e29-433d-8504-d10d34dba654/resourceGroups/ssk-inc-sandbox-rg"}')
	assert.Equal(t, 'rg_ids = {"rg1" = "/subscriptions/acd9510d-7e29-433d-8504-d10d34dba654/resourceGroups/ssk-inc-sandbox-rg"}', output)
}
