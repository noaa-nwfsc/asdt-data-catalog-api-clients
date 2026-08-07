# Creating a New Repository and Understanding GitHub Governance

This guide describe how to create a fully configured repository from the ASDT template repository using an GitHub template.

Using the workflow, the configuration of new repository will have copied from this repository the following configurations:
	- Teams and team permissions
    - Branch protection rulesets.
    - Individual user access roles.

## Contents

  - [Prerequisites](#prerequisites)
  - [Running a Workflow (GUI)](#running-a-workflow-gui)
  - [Running a Workflow (CLI)](#running-a-workflow-cli)
  - [Core GitHub Concepts](#core-github-concepts)
    - [Rulesets](#rulesets)
    - [Teams and Permissions](#teams-and-permissions)
  - [Additional Infromation](#additional-infromation)

## Prerequisites

- The following permissions are required to view and run GitHub Actions in the `noaa-nwfsc/asdt-template` repository.
- _Note for Admins: The `CREATE_FROM_TEMPLATE_APP_PAT` token/secret must be kept up to date in the template repository's settings for this workflow to function.<br>
  See [Administrative Guide](./Admin.md) for details._


## Running a Workflow (GUI)
 _Important Note: The "Use this template" button does **not** uses the clone workflow, and will not copy all the standard configuration._

1. **Navigate to the Template Workflow**: Open the template repository at `noaa-nwfsc/asdt-template
2. **Trigger the Creation Workflow**
   - **Click on the Actions** tab located near the top of the repository dashboard to open actions dialog page.
   - On the left-hand sidebar under **All workflows**, click on **Create New ASDT Repository**.  
     A popup will appear on the right side of the browser screen.
   - On the right side of the screen, click the **Run workflow** dropdown menu to obtain the configuration form and fill out the form items:
     - **Name for the new repository:** Name of a NEW repository.  
       Do not include the organization name (noaa-nwfsc).
     - **Repository visibility:** Select the desired visibility (`private`, `internal`, or `public`) from the dropdown.
   - Click the green **Run workflow** button.

3. **Wait for Automation to Complete:**
   - An icon will appear for the newly initiated worflow.  
     Click on its icon to watch the progress.
   - The automation will take a few moments to execute.  
	 Behind the scenes, it is:
     - Creating a new repository.
     - Copying all team permissions from the template.
     - Copying all branch protection rulesets.
     - Copying all individual user access roles.
     - Disabling installation specific workflow files from the new repository.

4. **Access New Repository**
   - Upon successfully create and configuring the new repo,the workflow icon will show a green checkmark indicating success
   - Navigate to `https://github.com/noaa-nwfsc/<your-new-repo-name>` to begin working.

## Running a Workflow (CLI)

The GitHub web interface for managing workflows may have problems from time to time.  
It is officially 'bugged' for its caching the old or broken state, and refusing to re-evaluate it upd1ates.  
In cases where the web UI gets permanently stuck like this, it is necessary to bypass the browser and use the CLI.

1. **Install GitHub CLI (if needed)** Visit [GitHub CLI website](https://cli.github.com)
2. **Clone template repository** using:  
   `git clone git@github.com:noaa-nwfsc/asdt-template.git`  
   or  
   `git clone https://github.com/noaa-nwfsc/asdt-template.git`
3. Go to (cd) the directory housing that repository `cd ./asdt-template`
4. **Run the CLI Command:**  
   `gh workflow run create-new-asdt-repo.yml --ref develop -f TARGET_REPO="my-test-repo" -f VISIBILITY="internal" ` 

## Core GitHub Concepts

### Rulesets

Ruleset are used to provide consistent enforce of repository policies across standard ASDT repositories.

- **How they work**:
  - **Scalability**: Unlike traditional branch protection, rulesets can apply to the entire repository or specific patterns (e.g., all `release/` branches) from a single configuration.
  - **Automation-Friendly**: When using the ASDT template repository creation workflow, rulesets are automatically copied to new repositories to enforce organizational standards.
  - **Enforcement**: They typically require specific actions before code can be merged, such as pull request reviews or passing status checks.

- **Access & Changes**:
  - Navigate to repository **Settings**.
  - In the left sidebar, under the "Code and automation" section, click **Rules** and then **Rulesets**.
  - At this point, either:
  - Click on an existing ruleset to edit its requirements.  
    or
  - Click **New ruleset** to establish a new policy.

### Teams and Permissions

To ensure consistent permissions across the ASDT standard repositories access is managed through **Teams** rather than individual user assignments .

- **How they work**:
  - **Access Management**: Permissions (Read, Write, Maintain, Admin) are assigned to GitHub Teams. When the template workflow runs, it maps these teams to the new repository with the correct privilege levels.
  - **Inherited Permissions**: By managing access at the team level, adding or removing a user from a central team automatically updates their access across all repositories associated with that team.
  - **Role Consistency**: The automation ensures that individual user access roles and team-based permissions from the template are mirrored exactly in the new repository.

- **Access & Changes**:
  - Navigate to your repository **Settings**.
  - In the left sidebar, under "Access," click **Collaborators and teams**.
  - **To change permissions**: Locate the team in the list and use the dropdown menu to adjust their role (e.g., changing a team from "Write" to "Maintain").
  - **To add access**: Click the **Add teams** button to search for and invite an existing organization team to the repository.

## Additional Infromation

More information on template administration and implementations see:

- [Administrative Guide: Managing template repository](./Admin.md)
- [WorkFlows/Git Actions: Documentation of workflows defined in .github/workflows](./.github/workflows/README.md)
- [Workflow Scripts : Description of scripts used by workflows and found in .github/scripts](./.github/scripts/README.md)
