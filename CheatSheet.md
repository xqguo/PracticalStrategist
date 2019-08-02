# CheatSheet

Some references for tools

## SSH

- To use ssh on 443 port, you can add the following in ~/.ssh/config

  ```sshconfig
  Host github.com
    HostName ssh.github.com
    Port 443
    User git
    PreferredAuthentications publickey
  Host gitlab.com
    Hostname altssh.gitlab.com
    User git
    Port 443
    PreferredAuthentications publickey
  ```

- [Copy ssh id](https://www.ssh.com/ssh/copy-id)

  ```bash
  ssh -i ~/.ssh/mykey user@host
  ```
## Git
- Use submoduels to have nested git repositories. [ref](https://www.vogella.com/tutorials/GitSubmodules/article.html)

    ```console
    git clone --recursive [URL to Git repo]
    git submodule update --init
    # if there are nested submodules:
    git submodule update --init --recursive
    # pull all changes in the repo including changes in the submodules
    git pull --recurse-submodules

    # pull all changes for the submodules
    git submodule update --remote
    ```

- Create a clean git history [ref](https://tecadmin.net/delete-commit-history-in-github/)

    ```console
    git checkout --orphan temp_branch
    git add -A
    git commit -am "the first commit"
    git branch -D master
    git branch -m master
    git push -f origin master
    ```

## [Paket](https://fsprojects.github.io/Paket/)
- Use paket to isntall/restore/update packages. [Get started](https://fsprojects.github.io/Paket/getting-started.html). 
- to start from scratch if packages cannot be downloaded or installed properly, you can [clear cache](https://fsprojects.github.io/Paket/paket-clear-cache.html)

```console
.paket\paket.exe clear-cache
```

## PowerShell

- add user path entry and remove duplicates
  adapted from [this post](https://itluke.online/2018/07/16/how-to-remove-duplicates-from-your-path-environment-variable-with-powershell/)

  ```console
  $CurrentPath = [Environment]::GetEnvironmentVariable('Path','User')
  $TargetPath = $CurrentPath+";path1"
  $SplittedPath = $TargetPath -split ';'
  $CleanedPath = $SplittedPath | Sort-Object -Unique
  $NewPath = $CleanedPath -join ';'
  [Environment]::SetEnvironmentVariable('Path', $NewPath,'User')
  ```

## WSL

- add ca cert from windows to wsl's mono

```bash
certmgr -ssl https://nuget.org
certmgr -ssl https://github.com
```

## Unix commands

- [find](http://man7.org/linux/man-pages/man1/find.1.html) files with certain pattern and run cmd on them, e.g. change dos to unix txt format for all .sh .vim and .py files.

```bash
find -iregex '.*\.\(sh\|vim\|py\)$' -exec dos2unix {} \;
```

- [grep](https://www.gnu.org/software/grep/manual/grep.html) filename with contents in current directory and run some cmds on them via [xargs](http://man7.org/linux/man-pages/man1/xargs.1.html).

```bash
grep -rl PATTERN  . | xargs ls -l
```

## [GPG](https://www.gnupg.org/)

- and trust ultimate key

```bash
gpg --allow-secret-key-import --import secret.asc
gpg --edit-key my_id
#Then enter command trust, 5
```

## [Pass](https://www.passwordstore.org/)

- copy pass to clipbard under wsl using clip.exe

```concole
pass some_entry | clip.exe 
```
