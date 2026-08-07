# ASDT Template Workflow Scripts (.github/scripts) Documentation
This documentation covers  ``bash`` shell scripts used with the asdt-template to clone and configure ASDT repositories These scripts are designed for dual-use: running locally via a ``bash`` shell or as the engine for GitHub Actions workflows.

---

This combined technical documentation provides a comprehensive overview of the ASDT repository management system, incorporating workflow logic, script capabilities, and direct CLI help outputs.

---

## ASDT Repository Management Documentation

This system automates the lifecycle of GitHub repositories within the `noaa-nwfsc` organization, ensuring consistent security, permissions, and file structures.

### 1. Create New ASDT Repository
The **Create New ASDT Repository** workflow (`create-new-asdt-repo.yml`) is a factory tool used to spawn new repositories from a template.

#### Workflow Logic
* **Trigger**: Manual execution via `workflow_dispatch`.
* **Inputs**: Requires `repo_name` and `visibility` (internal, private, or public).
* **Security**: Uses the `CREATE_FROM_TEMPLATE_APP_PAT` secret for organization-level operations.
* **Self-Cleanup**: Automatically renames the factory workflow to `.disabled` in the new repository to prevent accidental recursion.

#### Script: `asdt-create-repo.sh`
This script handles the heavy lifting of repository creation and permission syncing.

**CLI Help Output:**
```text
Usage: asdt-create-repo.sh  --target <TARGET_REPO> \
	 [--credential TOKEN] [--source <TEMPLATE_REPO>]
  Update setting for repo <TARGET_REPO> from <TEMPLATE_REPO> repository.
  All rules, groups and users are copied over.
   -h|--help returns this message
   -q|--quiet Suppresses output
   -v|--verbose Increase output. Multiple -v's increases output. 
   -t|--target TARGET_REPO: Name of repo with setting to be 
            synced.
            Can be set with environment variable TARGET_REPO
   -s|--source|--template TEMPLATE_REPO: Override of github 
            repository used as template. The default is noaa-nwfsc/asdt-template.
            Can be set with environment variable TEMPLATE_REPO
   -f|--force By default the script will not overwrite existing 
            repositories.  If this flag is set, it will.
    --visiblity: The visibility level of the created repo."
                  Must be internal,private, or public. "
				  Can be set with environment variable  VISIBILITY
                  Default: internalF"
   -c|credentials TOKEN: The github token to use in authenticating.
              If not set, script uses environment varable GH_TOKEN.
              Token must be configured to use SSO.
```
*(Source:)*

---

### 2. Config Existing ASDT Repository
The **Config Existing ASDT Repository** workflow (supported by `asdt-config-repo.sh`) is designed to refresh settings on repositories that already exist.

#### Script: `asdt-config-repo.sh`
This script synchronizes permissions and propagates standard configuration files from the template to a target repository.

**CLI Help Output:**
```text
Usage: asdt-config-repo.sh  --target <TARGET_REPO> \
	 [--credential TOKEN] [--source <TEMPLATE_REPO>]
  Update setting for repo <TARGET_REPO> from <TEMPLATE_REPO> repository.
  All rules, groups and users are copied over.
   -h|--help returns this message
   -q|--quiet Suppresses output 
   -v|--verbose Increase output. Multiple -v's increases output.
   -t|--target TARGET_REPO: Name of repo with setting to be 
            synced.
            Can be set with environment variable TARGET_REPO
   -s|--source|--template TEMPLATE_REPO: Override of github 
            repository used as template. The default is noaa-nwfsc/asdt-template.
            Can be set with environment variable TEMPLATE_REPO
   -c|credentials TOKEN: The github token to use in authenticating.
              If not set, script uses environment varable GH_TOKEN.
              Token must be for a user with admin privs and 
              Token must be configured to use SSO.
```
*(Source:)*

**Standardized Files Synchronized:**
* `git_tools/*`
* `.github/*` (Workflows and settings)
* `.gitleaks.toml` (Security scanning)
* `LICENSE`
* `NOAA-NWFSC_Repo_Conventions/*`

---

### 3. Technical Requirements & Dependencies
* **Shared Functions**: Both scripts strictly require `shared_functions.sh` to be present in the script directory.
* **SSO Authorization**: All tokens used (via `-c` or `GH_TOKEN`) must be authorized for Single Sign-On (SSO) within the organization.
* **Sync Scope**: Both scripts explicitly copy Team Configurations, Branch Rulesets, and Collaborators from the source template.

Does this technical reference cover everything you need for the documentation, or should I expand on the specific branch rules being copied?

 
