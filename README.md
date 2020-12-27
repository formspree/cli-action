# Formspree CLI GitHub Action
⚡️ Automate your Formspree deployment using the Formspree CLI with GitHub Actions.

## Usage
Create a new file `/.github/workflows/formspree.yml` with the following:

```yaml
name: Formspree Deployment

on:
  push:
    branches:
    - main

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - name: Deploy
      uses: formspree/cli-action@main
      with:
        deployKey: ${{ secrets.FORMSPREE_DEPLOY_KEY }}


```

## Authentication
To use the Formspree CLI, you need to create a [CLI project](https://help.formspree.io/hc/en-us/articles/360053819114-The-Formspree-CLI).

Once you have created a project on the dashboard, you'll receive a deploy key. You'll want to add this to GitHub's secrets.
In your repository, go to **Settings** -> **Secrets** and add your deploy key. GitHub encrypts this token, and it won't be printed in the logs, so even for a public repository it won't be accessible to the world.

We need to include the authentication information in the `with` block of the action. If you've named the secret, `FORMSPREE_DEPLOY_KEY`, it would look like:
```yaml
jobs:
  deploy:
    steps:
      uses: formspree/cli-action@main
      with:
        deployKey: ${{ secrets.FORMSPREE_DEPLOY_KEY }}
```

## FAQ
### Why do I need this?
If you are using the Formspree CLI, use our [quick start guide](https://help.formspree.io/hc/en-us/articles/360053819114-The-Formspree-CLI).
Once you're ready to push your site live, you might want to automatically deploy new forms as you change the project.
Using this action, you can configure your site without ever leaving your terminal.

### My forms aren't showing up on my dashboard
First, look at the GitHub Actions logs and see if there's an error.
If you still can't find anything, [open a ticket](https://formspr.ee/request) with our support team and we'd be happy to look into it.