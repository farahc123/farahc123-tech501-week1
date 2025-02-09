# Git Bash commands and repo steps in VSCode and GitHub

- [Git Bash commands and repo steps in VSCode and GitHub](#git-bash-commands-and-repo-steps-in-vscode-and-github)
- [Git](#git)
  - [Git code](#git-code)
    - [Git user code](#git-user-code)
    - [Workflow for creating a new local repo and syncing it to a new Github repo](#workflow-for-creating-a-new-local-repo-and-syncing-it-to-a-new-github-repo)
    - [Workflow for pushing an existing repository to GitHub](#workflow-for-pushing-an-existing-repository-to-github)
  - [VSCode notes](#vscode-notes)

# Git

- Git is a **version control system** that exists on your local machine; can be backed up to the cloud for better security and collaboration using **GitHub**
- Three levels of configuration settings:
  - **System**: applied across an entire machine and to all users and repos on it 
  - **Global**: applied to the current/invoked OS user 
  - **Local**: applied to the current repository (this is the default if no level is specified in a command)

## Git code

-   `git -v` — prints version of git in use

- `git init` — initialises a Git repo from present working directory

-   `git status` — prints status of current repo (e.g. *changes not tracked*)

-   `git branch -M <new_name>` — renames or moves current branch, e.g. convention is to rename master branch to main

-   `code .` — opens VS code for working directory

-   `git add .` — stages everything in the current directory; specify files to avoid staging all like `git add hello.py`

-   `git commit -m "<optional message for commit>"` — commits file with the given commit message

-  `git log` — prints the commit history when in a repo
-    `git push -u origin <branch name e.g. main>` — when first setting up a Git-GitHub link, this syncs the files and commit history to the just-added remote repo
-    `git push` — pushes commits to GitHub
-   `git pull origin` — fetches the most recent changes to a remote repo and merges them into your local copy, thereby updating it
-   `.gitignore` **file** — this is a file that contains information on what you don't want Git to ever stage or commit; you can tell it to ignore specific files, entire directories, or use pattern-matching to ignore files matching certain criteria, e.g. using a wildcard to tell it to ignore all `\*.log` files
-   `git diff` — shows the changes between your untracked and staged files
    -   `git diff --staged` — shows the changes between your staged and committed files
-   `git restore --staged [filename]` — removes file from staging area so it won't be committed 
-   `ssh-keygen \<optional arguments>` — generates SSH key pair; navigate to .ssh folder to run command; note that you need to specify name, optional passcode (and confirm that passcode/lack of again)
    -    `ssh-keygen -t rsa* -b 4096 -C "email"` — adds algorithm (set using -t and specifying algorithm), key size (set using -b and bit size), and optional comment (we're using an email)


### Git user code

-  `git config [global/local, configuration value to be viewed e.g. *user.name* or flag]` — views settings
    -   `git config [specific configuration value to be viewed e.g. *user.name* or flag]` — views settings
    -   `git config --list` — views settings in a list format
    -   `git config --[level] [setting to be set] [value to  be set]` — sets given configuration to given value at given level, e.g. `git config --global user.name "the value in quotes"` applies user name globally to given value

### Workflow for creating a new local repo and syncing it to a new Github repo

-   `git init` — initialises the repo
-   `git commit -m "first commit"` 
- `git branch -M main` — renames current branch (always master by default) to *main*
-   `git remote add origin <link to github repo e.g. <https://github.com/farahc123/tech501-week2.git>>` — specifies the remote repo (e.g. a github repo, which is the *origin*) so you can create, view, and delete connections to it
-   ` git push -u origin <branch name e.g. main>` — does the first sync of the files and commit history to the previously added remote repo


### Workflow for pushing an existing repository to GitHub

-   `git remote add origin <link to github repo e.g. <https://github.com/farahc123/tech501-week2.git>>` — specifies the remote repo (e.g. a github repo, which is the *origin*) so you can create, view, and delete connections to it
-   ` git push -u origin <branch name e.g. main>` — does the first sync of the files and commit history to the previously added remote repo
-   ` git push -u origin <branch name e.g. main>` — does the first sync of the files and commit history to the previously added remote repo

## VSCode notes

-   Make sure to turn autosave on from VS Code File menu

-   First file in a repo should be README.md

-   Use **ctrl-shift-p** to bring up command line in VS code and search for something, e.g. "create table of contents"

-   **Don't do a hard reset of a branch** unless you're okay with losing all of the subsequent versions; look into soft reset