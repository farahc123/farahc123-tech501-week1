# Git Bash commands and repo steps in VSCode and GitHub

- [Git Bash commands and repo steps in VSCode and GitHub](#git-bash-commands-and-repo-steps-in-vscode-and-github)
  - [Git](#git)
  - [Git code](#git-code)
    - [Initial steps for adding an existing local repo to Github](#initial-steps-for-adding-an-existing-local-repo-to-github)
  - [VSCode](#vscode)

## Git

- Git is a version control system that exists on your local machine; can be backed up to the cloud for better security and collaboration using GitHub
- three levels of configuration settings:
  - system: applied across an entire machine and to all users and repos on it 
  - global: applied to the OS user invoked
  - local: applied to the  repository it's currently invoked in (this is the default if no level is specified in a command)

## Git code

-   ***git -v*** — prints version of git in use

- ***git init*** — initialises a Git repo from present working directory

-   ***git status*** — prints status of current repo (e.g. changes not tracked)

-   ***git branch -M <new_name>*** — renames or moves current branch, e.g. convention is to rename master branch to main

-   ***code .*** — opens VS code for working directory

-   ***git add .*** — stages everything in the current directory; specify files to avoid staging all

-   ***git commit -m "\<optional message for commit>"*** — commits file with the given commit message

-  ***git log*** — prints the commit history when in a repo
-    ***git push -u origin \<branch name e.g. main>*** — syncs the files and commit history to the previously added remote repo

-   ***git pull origin —*** fetches the most recent changes to a repo and merges them into your local copy, thereby updating it
-   ***git config [specific level, configuration value to be viewed e.g. *user.name* or flag]** — views settings
    -   ***git config [specific configuration value to be viewed e.g. *user.name* or flag]** — views settings
    -   ***git config --list*** — views settings in a list format
    -   ***git config --[level] [setting to be set] [value to  be set]*** — sets given configuration to given value at given level, e.g. ***git config --global user.name "Farah"*** applies user name globally to Farah
-   


### Initial steps for adding an existing local repo to Github

-   ***git remote add origin <link to github repo e.g. <https://github.com/farahc123/tech501-week2.git>>*** — specifies the remote repo (e.g. a github repo, which is the ***origin***) so you can create, view, and delete connections to it

- ***git branch -m master main*** — renames master branch to main

-   ***git push -u origin \<branch name e.g. main>*** — syncs the files and commit history to the previously added remote repo

-   ***git pull origin —*** fetches the most recent changes to a repo and merges them into your local copy, thereby updating it

-   ***ssh-keygen \<optional arguments>*** — generates SSH key pair; note that you need to specify name, optional passcode (and confirm that passcode/lack of again)
    -    ***ssh-keygen -t rsa* -b 4096 -C "email"*** — adds optional algorithm (set using -t and specifying algorithm), optional key size (set using -b and bit size), and optional comment (we're using an email)

## VSCode

-   Make sure to turn autosave on from VS Code File menu

-   First file in a repo should be README.md

-   Use **ctrl-shift-p** to bring up command line in VS code and search for something, e.g. "create table of contents"

-   **Don't do a hard reset of a branch** unless you're okay with losing all of the subsequent versions; look into soft reset

-   To link to a file, **hold shift** while dragging it into VS Code