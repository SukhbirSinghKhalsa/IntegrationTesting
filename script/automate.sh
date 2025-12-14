# Clone repository
git clone https://github.com/SukhbirSinghKhalsa/IntegrationTesting.git

#export your ARM_SUBSCRIPTION_ID of your azure account
ARM_SUBSCRIPTION_ID = ""

# Install terraform
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
gpg --no-default-keyring \
--keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
--fingerprint
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update
sudo apt-get install terraform
terraform version

#navigate to working directory
cd IntegrationTesting/ 

#create folders
mkdir integration_test
mkdir terraform

#create terraform files
cd terraform/
touch main.tf provider.tf variable.tf output.tf


# Install go language
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.25.5.linux-amd64.tar.gz
sudo apt-get install gccgo-5
sudo update-alternatives --set go /usr/bin/go-5
GOROOT_BOOTSTRAP=/usr ./make.bash

#create go file
cd ..
cd integration_test
touch test.go

#example file for terratest
https://terratest.gruntwork.io/examples/

#go commands reference
#check go version       --> go version
#intial the go modules  --> go mod init "<module_name>"
#install dependencies  --> go mod tidy
#install dependencies  --> go get <library_url>
#run test              --> go test