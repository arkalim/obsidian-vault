---
created: 2022-05-09T20:38:54+05:30
updated: 2022-05-20T17:15:42+05:30
---
[[AWS Solutions Architect Associate (SAA-C02)]]

---
# Simple Notification Service (SNS)
- Used to broadcast messages
- Pub-Sub model (publisher publishes messages to a topic, subscribers listen to the topic)
- Instant message delivery (does not queue messages)
- Subscribers can be:
    -   SQS queues
    -   HTTP / HTTPS endpoints
    -   Lambda functions
    -   Emails (using SNS)
    -   SMS messages
    -   Mobile Notifications

## Encryption
-   In-flight encryption by default using HTTPS API
-   At-rest encryption using KMS keys (optional)
-   Client-side encryption

## Access Management
-   **lAM policies** to regulate access to the SNS API
-   **SNS Access Policies** (resource based policy)
    -   Used for cross-account access to SNS topics
    -   Used for allowing other AWS services to publish to an SNS topic

## FIFO Topics
- Guaranteed ordering of messages in that topic
- Publishing messages to a FIFO topic requires:
    -   **Group ID**: messages will be ordered and grouped for each group ID
    -   **Message deduplication ID**: for deduplication of messages
-   **Can only have SQS FIFO queues as subscribers**
-   **Limited throughput (same as SQS FIFO)** because only SQS FIFO queues can read from FIFO topics
-   **The topic name must end with** `.fifo`

## SNS + [[Simple Queue Service (SQS)|SQS]] Fanout Pattern
-   Fully decoupled, no data loss
-   SQS allows for: data persistence, delayed processing and retries of work
-   Make sure your SQS queue access policy allows for SNS to write
- Diagram
	- ![[attachments/Pasted image 20220509205738.png]]

## Message Filtering
-   JSON policy used to filter messages sent to SNS topic’s subscriptions
-   Each subscriber will have its own filter policy (if a subscriber doesn’t have a filter policy, it receives every message)
- Ex: filter messages sent to each queue by the order status

## SNS + Lambda + DLQ
- Lambda retries each failed message 3 times after which it is **sent to the DLQ by lambda**
	- ![[attachments/Pasted image 20220513220228.png]]