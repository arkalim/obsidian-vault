---
created: 2022-05-10T23:40:57+05:30
updated: 2022-06-03T09:19:11+05:30
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

> EventBridge is recommended for decoupling applications that reacts to events from third-party **SaaS** applications.

## Schema Registry
-   Defines how the data is structured in the event bus
-   Schema can be versioned