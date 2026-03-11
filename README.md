# 🍻 Homebrew bump formula GitHub Action

An action that wraps `brew bump-formula-pr` to ease the process of updating the formula on new project releases.

Works on Ubuntu and macOS runners.

[![Codacy Badge](https://app.codacy.com/project/badge/Grade/7499e6a3ff474f10a7ccab058eb2a1c0)](https://app.codacy.com/gh/LanikSJ/homebrew-bump-formula/dashboard?utm_source=gh&utm_medium=referral&utm_content=&utm_campaign=Badge_grade)
![GitHub Repo Size](https://img.shields.io/github/repo-size/laniksj/homebrew-bump-formula)
![GitHub Code Size in Bytes](https://img.shields.io/github/languages/code-size/laniksj/homebrew-bump-formula)
![GitHub Last Commit](https://img.shields.io/github/last-commit/laniksj/homebrew-bump-formula)
![GitHub Commit Activity](https://img.shields.io/github/commit-activity/m/laniksj/homebrew-bump-formula)

## 📋 Table of Contents

- [🚀 Usage](#-usage)
  - [📋 Standard Mode](#-standard-mode)
  - [🔍 Livecheck Mode](#-livecheck-mode)
- [💡 Examples](#-examples)
- [🔧 Troubleshooting](#-troubleshooting)
  - [❓ Common Issues](#-common-issues)
    - [🔐 Authentication Errors](#-authentication-errors)
    - [📦 Formula Not Found](#-formula-not-found)
    - [🍴 Fork Creation Issues](#-fork-creation-issues)
    - [🔍 Livecheck Mode Not Working](#-livecheck-mode-not-working)
    - [⚡ Force Option Not Working](#-force-option-not-working)
  - [📋 Error Messages](#-error-messages)
- [🐛 Debugging](#-debugging)
  - [🔧 Enabling Debug Mode](#-enabling-debug-mode)
  - [🎯 Common Debug Scenarios](#-common-debug-scenarios)
    - [📦 Debugging Formula Updates](#-debugging-formula-updates)
    - [🔍 Debugging Livecheck Mode](#-debugging-livecheck-mode)
  - [📊 Debug Output Analysis](#-debug-output-analysis)
  - [🧪 Testing Locally](#-testing-locally)
  - [🔍 Checking Formula Status](#-checking-formula-status)
- [🤝 Contributing](#-contributing)
- [📄 License](#-license)

## 🚀 Usage

One should use the [Personal Access Token](https://github.com/settings/tokens/new?scopes=public_repo,workflow) for
`token` input to this Action, not the default `GITHUB_TOKEN`, because `brew bump-formula-pr` creates a fork of the
formula's tap repository (if needed) and then creates a pull request.

> There are two ways to use this Action.

### 📋 Standard Mode

Use if you want to simply bump the formula, when a new release happens.

Listen for new tags in workflow:

```yaml
on:
  # trigger when release got created (preferred)
  release:
    types: [released]
  # trigger on tag push
  # push:
  #   tags:
  #     - "*"
```

The Action will extract all needed informations by itself, you just need to specify the following step in your workflow:

```yaml
- name: Update Homebrew formula
  uses: LanikSJ/action-homebrew-bump-formula@<REF>
  with:
    # Required, custom GitHub access token with the 'public_repo' and 'workflow' scopes
    token: ${{secrets.TOKEN}}
    # Optional, will commit with this user name
    user_name: name
    # Optional, will commit with this user email
    user_email: email@example.com
    # Optional, will create tap repo fork in organization
    org: ORG
    # Optional, use the origin repository instead of forking
    no_fork: false
    # Optional, defaults to homebrew/core
    tap: USER/REPO
    # Formula name, required
    formula: FORMULA
    # Optional, will be determined automatically
    tag: ${{github.ref}}
    # Optional, will be determined automatically
    revision: ${{github.sha}}
    # Optional, if don't want to check for already open PRs
    force: false # true
```

### 🔍 Livecheck Mode

If `livecheck` input is set to `true`, the Action will run `brew livecheck` to check if any provided formulae are
outdated or if tap contains any outdated formulae and then will run `brew bump-formula-pr` on each of those formulae
with proper arguments to bump them.

Might be a good idea to run this on schedule in your tap repo, so one gets automated PRs updating outdated formulae.

If there are no outdated formulae, the Action will just exit.

```yaml
- name: Update Homebrew formula
  uses: LanikSJ/action-homebrew-bump-formula@<REF>
  with:
    # Required, custom personal GitHub access token with only the 'public_repo' scope enabled
    token: ${{secrets.CUSTOM_PERSONAL_ACCESS_TOKEN}}
    # Optional, will commit with this user name
    user_name: user_name
    # Optional, will commit with this user email
    user_email: email@example.com
    # Optional, will create tap repo fork in organization
    org: ORG
    # Bump all outdated formulae in this tap
    tap: USER/REPO
    # Bump only these formulae if outdated
    formula: FORMULA-1, FORMULA-2, FORMULA-3, ...
    # Optional, if don't want to check for already open PRs
    force: false # true
    # Need to set this input if want to use `brew livecheck`
    livecheck: true
```

If only `tap` input is provided, all formulae in given tap will be checked and bumped if needed.

## 💡 Examples

- <https://github.com/LanikSJ/homebrew-tap/blob/main/.github/workflows/bump-formula.yml>

## 🔧 Troubleshooting

### ❓ Common Issues

#### 🔐 Authentication Errors

If you encounter authentication errors, ensure you're using a Personal Access Token with the correct scopes:

- Required scopes: `public_repo` and `workflow`
- Do not use the default `GITHUB_TOKEN`

#### 📦 Formula Not Found

- Verify the formula name matches exactly what's in the tap
- Check that the tap repository is correct
- Ensure the formula exists in the specified tap

#### 🍴 Fork Creation Issues

- If using `org` parameter, ensure the organization has permission to fork the repository
- Consider using `no_fork: true` to use the origin repository instead

#### 🔍 Livecheck Mode Not Working

- Verify the formula supports livecheck
- Check that the formula's livecheck configuration is valid
- Ensure the tap contains the formula you're trying to bump

#### ⚡ Force Option Not Working

- The `force` option only bypasses open PR checks
- It won't override other validation errors

### 📋 Error Messages

"Could not find formula"

- Check formula name spelling and case
- Verify the tap contains the formula

"Authentication failed"

- Regenerate your Personal Access Token
- Ensure correct scopes are enabled

"No outdated formulae found"

- This is normal for livecheck mode when all formulae are up to date
- Consider running on a schedule to catch updates

## 🐛 Debugging

### 🔧 Enabling Debug Mode

To enable debug output for troubleshooting, add the following to your workflow:

```yaml
env:
  ACTIONS_STEP_DEBUG: true
```

### 🎯 Common Debug Scenarios

#### 📦 Debugging Formula Updates

```yaml
- name: Update Homebrew formula
  uses: LanikSJ/action-homebrew-bump-formula@<REF>
  env:
    ACTIONS_STEP_DEBUG: true
  with:
    token: ${{secrets.TOKEN}}
    formula: YOUR_FORMULA
    tap: USER/REPO
```

#### 🔍 Debugging Livecheck Mode

```yaml
- name: Update Homebrew formula
  uses: LanikSJ/action-homebrew-bump-formula@<REF>
  env:
    ACTIONS_STEP_DEBUG: true
  with:
    token: ${{secrets.TOKEN}}
    livecheck: true
    tap: USER/REPO
```

### 📊 Debug Output Analysis

When debug mode is enabled, you'll see detailed logs including:

- Formula livecheck results
- Version comparison details
- Git operations and PR creation steps
- Error messages with stack traces

### 🧪 Testing Locally

You can test the action locally using the GitHub Actions runner:

```bash
# Install act (GitHub Actions runner)
brew install act

# Run the workflow locally
act -j your-workflow-job-name
```

### 🔍 Checking Formula Status

To manually check if a formula needs updating:

```bash
# Check formula livecheck status
brew livecheck FORMULA_NAME

# Check formula information
brew info FORMULA_NAME
```

## 🤝 Contributing

This project welcomes contributions! Please see the repository guidelines for:

- Reporting bugs or requesting features via
  [GitHub Issues](https://github.com/LanikSJ/action-homebrew-bump-cask/issues)
- Submitting pull requests with improvements or fixes
- Best practices for development and testing

## 📄 License

This project is licensed under the MIT License - see the
[LICENSE](LICENSE) file for details.
