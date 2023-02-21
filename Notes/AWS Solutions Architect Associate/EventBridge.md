---
created: 2022-05-10T14:10:57-04:00
updated: 2023-02-19T10:03:13-05:00
---
[[AWS Solutions Architect Associate (SAA-C02)]]

---
# EventBridge
- Extension of [[CloudWatch#Events]]
-   Event buses types:
    -   **Default event bus**: events from AWS services are sent to this
    -   **Partner event bus**: receive events from external SaaS applications
    -   **Custom Event bus**: for your own applications
-   Event Rules: how to process the events
-   **Event buses support cross-account access**
-   **Cron Jobs**: when creating an EB rule, we can select “Schedule” instead of event pattern to trigger an event based on a cron expression.
- Can archive events (all or based on a filter) sent to an event bus to replay later

> EventBridge is recommended for decoupling applications that reacts to events from third-party **SaaS** applications.

## Schema Registry
-   Defines how the data is structured in the event bus
-   Schema can be versioned

## Event Bus Policy
- Manage permissions for an event bus
- Useful to allow or deny events from another AWS account or region
![[attachments/Pasted image 20230219100242.png]]