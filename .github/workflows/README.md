# Using Workflows with the asdt-template  

This documentation provides
 * Docmentation on existing asdt-template GitHub Workflows (defined in asdt-template/.github/workflows)
 * Details on how to create new work flows

## Contents

  - [Workflow: Clone New ASDT Repository from asdt-template](#clone-new-asdt-repository-from-asdt-template)
  - [Workflow: Copy asdt-template Configuration to Target Repo](#copy-asdt-template-configuration-to-target-repo)

## Clone New ASDT Repository from asdt-template
The **Create New ASDT Repository** workflow (.github/workflows/create-new-asdt-repo.yml) is a "factory" tool designed to spawn new repositories within the `noaa-nwfsc` organization. It handles not just the initial creation from a template, but also the complex migration of permissions, rulesets, and user access that standard GitHub template creation often omits.

### Workflow Trigger
This workflow is triggered manually via the **GitHub Actions tab** using the `workflow_dispatch` event.

#### Inputs
| Input | Description | Required | Default |
| :--- | :--- | :--- | :--- |
| **`repo_name`** | The name of the new repository (e.g., `my-project-repo`). | Yes | N/A |
| **`visibility`** | Visibility of the new repo: `internal`, `private`, or `public`. | Yes | `internal` |

> [!CAUTION]
> **Do not** include the organization name (`noaa-nwfsc`) in the `repo_name` input. The workflow automatically prepends the owner.

---

### Process Logic
The workflow execution is divided into two primary phases: repository provisioning and self-cleanup.

#### Phase 1: Creation & Configuration
The workflow executes the `asdt-create-repo.sh` script, which performs the following steps:
1.  **Verification**: Validates that the `CREATE_FROM_TEMPLATE_APP_PAT` secret is present and that the template repository exists.
2.  **Duplicate Check**: By default, the script will **not** overwrite an existing repository unless the `--force` flag is manually added to the script call.
3.  **Templating**: Creates the new repository using the current repository as the source.
4.  **Security Sync**: Unlike standard GitHub "Use this template" functionality, this script explicitly copies:
   * **Team Configurations**: All teams and their respective permission levels.
   * **Branch Rulesets**: All protection rules and status check requirements.
   * **Collaborators**: Individual user access settings.

#### Phase 2: Factory Workflow Disabling
To prevent the new "child" repository from accidentally running the creation script against itself (or spawning further repos unexpectedly), the workflow:
* Clones the newly created repository.
* Renames `.github/workflows/create-new-asdt-repo.yml` to `.github/workflows/create-new-asdt-repo.yml.disabled`.
* Pushes this change back to the main branch of the new repo.

---

### Technical Requirements
To function correctly, the following environment must be maintained:

#### Required Secrets
* **`CREATE_FROM_TEMPLATE_APP_PAT`**: A Personal Access Token (or GitHub App Token) with `repo` and `admin:org` scopes. This token must be authorized for use with **Single Sign-On (SSO)** if applicable.

#### Script Dependencies
The execution relies on two files located in the repository:
1.  `.github/scripts/asdt-create-repo.sh`: The primary execution logic.
2.  `.github/scripts/shared_functions.sh`: Contains the helper functions for API calls (e.g., `copy_team_config`, `copy_rule_sets`).

---

### Usage Instructions
1.  Navigate to the **Actions** tab of the template repository.
2.  Select **Create New ASDT Repository** from the left-hand sidebar.
3.  Click **Run workflow**.
4.  Enter the name of the new repository and select the desired visibility.
5.  Click **Run workflow** again to start the process.

## Copy asdt-template Configuration to Target Repo
Under development as of 4/2/2026

