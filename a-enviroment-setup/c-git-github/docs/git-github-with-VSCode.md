# Git and Github with VS Code

**Resources** :

- [first time git setup](https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup)
- [git integration with VSCode](https://code.visualstudio.com/docs/editor/versioncontrol#_git-support)
- [git credential manager with multiple users](https://github.com/git-ecosystem/git-credential-manager/blob/main/docs/multiple-users.md)

----

## Setting GitHub Authentication for one GitHub User

Open a terminal and check to see that git and github cli are available.

```script
git –-version
gh –-version
```

If one is missing you have to download the msi and try again until a version shows.

Now config git to always use the user name and email that you used to set up your github account. Note that you only have to do this once.

```script
git config --global user.name "John Doe"
git config --global user.email johndoe@example.com
```
Now to see that the config sticks.

```script
git config -l
```

The -l means list all configs. Press the space bar to see each setting, and `q` to quit.

If you still get errors when trying to pull from or push to github, you will have to get into the Windows Credential Manager and delete the github references. A machine restart will be required.

----

## Setting GitHub Authentication for more than one GitHub User

If you have more than one user registered at github you must do the following to allow you to authenticate and use different accounts. Do not do the previous username and email config settings or else you will always authenticate to only that one github user account.

```script
git config --global  credential.usehttppath true
```

Note that with this now every time you touch github you will be asked to authenticate.

