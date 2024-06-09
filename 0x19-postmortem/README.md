##0x19. Postmortem

![](https://t3.ftcdn.net/jpg/04/92/09/72/240_F_492097246_yagE8x9Uk8M9IekPy7GBuE0x1Uoa7esD.jpg)

## Postmortem: E-commerce Payment Gateway Outage (2024-06-08)

**Issue Summary:**
![](https://www.cienotes.com/wp-content/uploads/2019/07/summaryblackboard.jpg)

* Duration: From 1:15 PM(18:15) to 2:45 PM (19:45 ) on June 8th, 2024 (total duration: 1 and a half hours).
* Impact: Our e-commerce payment gateway experienced a critical outage, preventing users from completing transactions on our website. This affected 100% of users attempting to checkout during the outage window.

Timeline:

* 1:13 PM: Monitoring alert triggers, indicating a significant drop in successful payment processing.
* 1:15 PM: On-call engineer investigates the alert and confirms a complete outage of the payment gateway service.
* 1:15 PM - 1:45 PM: Initial investigation focuses on the payment gateway itself, suspecting a service overload or internal issue. Engineers attempt to restart specific services within the gateway.
* 1:45 PM  - 2:15 PM: The investigation expands to include the network infrastructure connecting to the payment gateway. Logs reveal a sudden spike in database connection errors originating from the gateway server.
* 2:15 PM: The incident is escalated to the Infrastructure Operations team.
* 2:15 PM - 2:30 PM: Infrastructure Operations team identifies a failing disk on the database server serving the payment gateway.
* 2:30 PM - 2:40 PM: The failing disk is taken offline, and the database is successfully migrated to a healthy secondary server.
* 2:40 PM: Payment processing resumes normal operation.
* 2:45 PM: All systems confirmed operational.

##Root Cause and Resolution:
![](https://blog.systemsengineering.com/hs-fs/hubfs/blog-files/Root%20Cause.jpg?width=600&name=Root%20Cause.jpg)

The root cause of the outage was a failing disk on the database server specifically serving the e-commerce payment gateway. This disk failure caused a high volume of connection errors, preventing the gateway from successfully communicating with the database and processing transactions.

Resolution involved bringing the failing disk offline and migrating the database to a healthy secondary server. This restored communication between the gateway and the database, allowing transactions to resume normally.

##Corrective and Preventative Measures:

* Improved Monitoring: Implement more granular monitoring on the database server health, including disk health metrics. This will provide earlier warnings of potential disk failures.
* Redundancy Review: Review the current redundancy configuration for the database server serving the payment gateway. Consider implementing a RAID configuration or a more robust failover mechanism for the database.
* Scheduled Maintenance:  Schedule regular preventative maintenance for database servers, including disk health checks and potential replacements when nearing end-of-life.
* Incident Response Training: Conduct regular training sessions for engineers on incident response procedures, focusing on effective troubleshooting techniques and communication protocols during outages.


This postmortem provides a high-level overview of the recent payment gateway outage. By implementing the corrective and preventative measures outlined above, we aim to significantly reduce the risk of similar incidents in the future, ensuring a more reliable and resilient e-commerce platform.
