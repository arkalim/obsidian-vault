---
created: 2022-05-12T22:13:38+05:30
updated: 2022-05-12T22:13:38+05:30
---
[[AWS Solutions Architect Associate (SAA-C02)]]

---
# Reachability Analyzer
-   A network diagnostics tool that **troubleshoots network connectivity** between two endpoints in your VPC
-   It builds a model of the network configuration, then checks the reachability based on these configurations (**doesn’t send packets, just tests the configurations**)
-   When the destination is:
    -   Reachable - it produces hop-by-hop details of the virtual network path
    -   Not reachable - it identifies the blocking components (eg. configuration issues In SGs, NACLs, Route Tables, etc.)
-   Use cases:
    -   Troubleshoot connectivity issues
    -   Ensure network configuration is as intended