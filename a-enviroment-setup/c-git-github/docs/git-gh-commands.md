# Git on the Command Line

**Resources** :

- [git docs](https://git-scm.com/book/en/v2/)

----

## Basic Git Commands

We can use the git version control application directly from the command line. Here are some useful commands to get started.

- `git init` - This command will create a git repository in the current folder
- `git status` - This will give you the current status of your git repository
- `git log` - This will give you the history of your git repository
- `git add .` - Use this command to "stage" all of your current changes so that they are ready to be committed.
- `git commit -m "Your Message"` - This command will take all of the staged changes and create a snapshot of the current state of your repository. Using commits is how we generate a *commit history* for our repository.
- `git pull` - Use this command to grab any changes from your remote repository (e.g.: GitHub.com) and pull them down onto your local repository (the one on your computer).
- `git push` - This command will take whatever commits you have on your computer and push them to the remote repository on GitHub.com.

There are a lot of things to learn when it comes to working with git, but these commands are the day-to-day ones that you will do as you work with version control.

> **TIP:** You should make frequent, small commits when working on your projects.
>
> Work with these commands every day, and they will become a part of you (like the force Luke).

## Remote Repositories

You can use the GitHub CLI to create a remote repository on GitHub.com.

```shell
gh repo create my-first-repository
```

The command above is interactive, so just follow the prompts.

You can **push** your code to GitHub.com by typing the following:

```shell
git push -u origin main
```
Note that the -u means set upstream.
After that, you will only need to type `git push` to push any local changes to the remote repository.

You can **pull** your code from GitHub.com by typing the following:
```shell
git pull upstream main
```

After that, you will only need to type `git pull` to pull any remote changes to the local repository.

Here's some other helpful commands with regard to the remote repository connections for your local repository.

- `git remote -v` - View all the remote repositories
- `git remote remove [remoteName]` - Remove a remote entry
- `git remote add [remoteName] [URL-to-Repository]` - Add a remote repository

