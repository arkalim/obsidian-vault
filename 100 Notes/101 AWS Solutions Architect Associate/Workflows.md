---
created: 2022-05-13T23:17:47+05:30
updated: 2022-05-19T23:22:26+05:30
---
[[AWS Solutions Architect Associate (SAA-C02)]]

---
# Workflows

## Step Functions
- Used to build **serverless workflows** to **orchestrate Lambda functions**
- Represent flow as a **JSON state machine**
- Maximum workflow execution time: 1 year
- Features: sequence, parallel, conditions, timeouts, error handling, etc.
- Provides a **visual graph** showing the current state and which path the workflow has taken
	- ![[attachments/Pasted image 20220513231346.png]]
	- 

## Simple Workflow Service (SWF)
- Outdated service (step functions are preferred instead)
- Code runs on EC2 (not serverless)
- **Ensures that a task is never duplicated** (could replace standard SQS queues)
- 1 year max runtime
- **Built-in human intervention step**
- Step Functions are recommended to be used for new applications, except:
    -   If you need external signals to intervene in the processes
    -   If you need child processes that return values to parent processes