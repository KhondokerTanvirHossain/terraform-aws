# Advanced Terraform with AWS

## Table of Contents

1. [Introduction](#introduction)
2. [Setup and Configuration](#setup-and-configuration)
3. [Modules](#modules)
4. [State Management](#state-management)
5. [Provisioners](#provisioners)
6. [Workspaces](#workspaces)
7. [Best Practices](#best-practices)
8. [Troubleshooting](#troubleshooting)
9. [References](#references)

## Introduction

This readme.md delves into the relationship between Terraform and AWS, focusing on best practices for developing secure, scalable, and manageable Terraform configurations for AWS.

Major topics include:

* Building a solid Terraform backend in AWS
* Reviewing security best practices for Terraform
* Deploying multi-region architectures with Terraform in AWS

### Prerequisites

1. Terraform Knowledge:

    * Understanding of providers, configurations, states, resources, data sources, variables, outputs, and HCL syntax (blocks, loops, conditionals).

2. AWS Knowledge:

    * Familiarity with EC2, VPC, IAM, Load Balancing, S3, DynamoDB, AWS developer tools (CodeBuild, CodePipeline, CodeCommit), and RDS.

## Setup and Configuration

### Installing Terraform

Steps to install Terraform on AWS Cloud shell.

1. Open AWS cloud shell
    * Log in to your AWS Management Console.
    * Click on the Cloud Shell icon in the top-right or bottom-left  navigation bar (a terminal icon) or search for "Cloud Shell" in the search bar and select it.

    ![alt text](image.png)

2. Install terraform with tfenv:

    ```bash
    git clone --depth=1 https://github.com/tfutils/tfenv.git ~/.tfenv
    
    echo 'export PATH="$HOME/.tfenv/bin:$PATH"' >> ~/.bash_profile
    
    source ~/.bash_profile

    tfenv install 1.6.2

    tfenv use 1.6.2

    terraform --version
    ```

Detail of tfenv is [here](https://github.com/tfutils/tfenv).

![alt text](image-1.png)

### AWS Provider in Terraform Registry

#### Introduction to AWS Provider

The AWS Provider is a crucial component in Terraform that allows Terraform to interact with AWS services. It acts as a wrapper around Terraform, helping manage the lifecycle of AWS resources. This provider is publicly available in the Official Terraform Registry.

**Key Concepts**

1. Provider:

    * Directly matches the resource in AWS with the one defined in Terraform.

2. Module:

    * A group of multiple resources in one Terraform block for convenience.

#### Navigating the Terraform AWS Registry

[**AWS Provider Documentation**](https://registry.terraform.io/providers/hashicorp/aws/latest).

The official AWS Provider documentation is available in the Terraform Registry. It includes detailed information on how to use the provider and manage various AWS services.

1. Example: EC2 Instance:

    * To create an EC2 instance, you can find the aws_instance resource in the documentation. It provides examples and detailed descriptions of all possible arguments and configurations.

2. Modules:

* The registry also includes top downloaded AWS modules, such as the VPC module. Modules compact multiple resources like NAT gateways, subnets, and route tables into a single piece of code for easier management.

#### Using the AWS Provider

To use the AWS Provider, add the following to your Terraform configuration:

```bash
provider "aws" {
  region = "us-west-2"
}
```

Example: Creating an EC2 Instance Resource

```bash
resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  tags = {
    Name = "example-instance"
  }
}
```

Detail can be found [here](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance)

Example: Using a VPC Module

```bash
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.10.0"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-west-2a", "us-west-2b", "us-west-2c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  single_nat_gateway = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}
```

Detail can be found [here](https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest)

### AWS Credentials

How to configure AWS credentials for Terraform.

### Backend Configuration

Configuring remote backends for storing Terraform state.

## Modules

### Creating Modules

How to create reusable Terraform modules.

### Using Modules

How to use existing modules in your Terraform configuration.

### Module Registry

Using the Terraform Module Registry to find and use modules.

## State Management

### Remote State

Configuring remote state storage.

### State Locking

Understanding state locking and how to manage it.

### State Commands

Common state commands (`terraform state list`, `terraform state show`, etc.).

## Provisioners

### Using Provisioners

How to use provisioners to execute scripts on remote resources.

### Common Provisioners

Examples of common provisioners like `local-exec` and `remote-exec`.

## Workspaces

### Creating Workspaces

How to create and switch between workspaces.

### Workspace Commands

Common workspace commands (`terraform workspace list`, `terraform workspace select`, etc.).

## Best Practices

### Code Organization

Best practices for organizing your Terraform code.

### Version Control

Using version control with Terraform.

### Security

Security best practices for managing AWS resources with Terraform.

## Troubleshooting

### Common Errors

List of common errors and how to resolve them.

### Debugging

Tips for debugging Terraform configurations.

## References

- [Terraform Documentation](https://www.terraform.io/docs)
* [AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
* [Terraform Module Registry](https://registry.terraform.io/)
