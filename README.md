# logstash
This cookbook provides the provisioning and configuration for Logstash as one of four components of ELK Stack.

## Installation


## Configuration
There are three parts that requires configuring:
- Inputs (outputs from beats)]
- Filters
- Outputs (inputs for elasticsearch)

## To run the chef provisioing on AWS ec2 (kithcen_could.yml)
This kitchen YAML file (execute with KITCHEN_YML=kitchen_cloud.yml kitchen verify) connects to AWS and creates an EC2 instance to run test. Terminates the instance by running KITCHEN...=... kitchen destroy
