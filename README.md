
# Integration Testing with Terraform and Terratest (Go)

This repository demonstrates how to set up **Terraform infrastructure testing** using **Go** and **Terratest**.

## Flow Diagram 
![Terratest Diagram](https://github.com/SukhbirSinghKhalsa/SukhbirSinghKhalsa/blob/main/Terratest.drawio.svg)

---

## Prerequisites

- Ubuntu-based Linux system
- Azure subscription
- `sudo` privileges

---

## Step 1: Clone the Repository

```bash
git clone https://github.com/SukhbirSinghKhalsa/IntegrationTesting.git
cd IntegrationTesting
```

---

## Step 2: Configure Azure Credentials

```bash
export ARM_SUBSCRIPTION_ID=""
```

---

## Step 3: Install Terraform

```bash
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common

wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null

gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update
sudo apt-get install terraform
terraform version
```

---

## Step 4: Create Project Structure

```bash
mkdir integration_test
mkdir terraform
```

### Terraform Files

```bash
cd terraform
touch main.tf provider.tf variable.tf output.tf
cd ..
```

---

## Step 5: Install Go
- Option 1 - Manually Download go binary file from [Go Download Page](https://go.dev/dl/)
  - For linux, download go1.25.5.linux-amd64.tar.gz and store in /tmp
- Option 2 - Download using wget
```bash 
wget https://go.dev/dl/go1.25.5.linux-amd64.tar.gz
```
- Next remove the exisiting go version
```bash
rm -rf /usr/local/go
```
- Extract the file
```bash
tar -C /usr/local -xzf go1.25.5.linux-amd64.tar.gz
```
- Check go is installed properly by checking its version
```bash
go version
```

---

## Step 6: Create Terratest Files

```bash
cd integration_test
touch test.go
```

Terratest examples:
https://terratest.gruntwork.io/examples/

---

## Step 7: Initialize Go Modules

```bash
go mod init "<module_name>"
go mod tidy
go get github.com/gruntwork-io/terratest/modules/terraform
```

---

## Step 8: Run Tests

```bash
go test
```

---

## Useful Go Commands

```bash
go version
go mod init "<module_name>"
go mod tidy
go get <library_url>
go test
```

---

## Summary

This project provides a clean setup for Terraform integration testing using Go and Terratest.

