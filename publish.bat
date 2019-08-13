@echo off
git config --global user.email "guoxiaoq@gmail.com"
git config --global user.name "Xiaoqiang Guo"
ECHO GIT STATUS
git status
ECHO GIT STATUS
git status
ECHO GIT commit
git add -A
git commit -m "update"
ECHO GIT PUSH
git push origin
ECHO GIT STATUS
git status