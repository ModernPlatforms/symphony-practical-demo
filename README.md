# Practical Bicep Testing with Microsoft Symphony Example

This repo demonstrates automated validation and deployment of a small Azure stack using [Microsoft Symphony](https://github.com/microsoft/symphony) with Bicep and Pester.

## Structure

```text . 
├── bicep/
│
├── main.bicep
│ └── main.bicepparam
├── tests/
│ └── Test-AppInfra.ps1
├── .github/
│ └── workflows/
│ ├── workflow.pr.bicep.yml
│ └── workflow.ci.bicep.yml
```

yaml
Copy
Edit

- **bicep/**: Bicep template and parameters
- **tests/**: Pester tests for infrastructure validation
- **.github/workflows/**: GitHub Actions workflows for CI/CD with Symphony


## Usage

1. Clone the repo and set up Symphony as per [Microsoft's Getting Started guide](https://github.com/microsoft/symphony/blob/main/docs/GETTING_STARTED.md).
2. Update the resource group and Azure subscription as required.
3. Use the provided workflows for PR validation and CI deployment.

---
