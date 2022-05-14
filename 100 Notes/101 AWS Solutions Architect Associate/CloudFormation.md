---
created: 2022-05-13T22:59:59+05:30
updated: 2022-05-14T17:36:57+05:30
---
[[AWS Solutions Architect Associate (SAA-C02)]]

---
# CloudFormation
- **Infrastructure as Code (IaC)** allows us to write our infrastructure as a config file which can be easily replicated & versioned using Git
- **Declarative** way of outlining your AWS Infrastructure (no need to specify ordering and orchestration)
- Resources within a stack is tagged with an identifier (easy to track cost of each stack)
- Ability to destroy and re-create infrastructure on the fly
- Deleting a stack deletes every single artifact that was created by CloudFormation (clean way of deleting resources)

## CloudFormation Templates
- YAML file that defines a CloudFormation Stack
- **Templates have to be uploaded in S3** and then referenced in CloudFormation
- To update a template, upload a new version of the template
- Template components:
	- **Resources**: AWS resources declared in the template (**mandatory**)
	- Parameters: Dynamic inputs for your template
	- Mappings: Static variables for your template
	- Outputs: References to what has been created (will be returned upon stack creation)
	- Conditionals: List of conditions to perform resource creation
	- Metadata
-   Templates helpers:
    -   References
    -   Functions

> You can associate the `CreationPolicy` attribute with a resource to prevent its status from reaching create complete until CloudFormation receives a specified number of `cfn-signal` or the timeout period is exceeded.

## Stack Sets
-   Create, update, or delete stacks across **multiple accounts and regions** with a single operation
-   When you update a stack set, all associated stack instances are updated throughout all accounts and regions.