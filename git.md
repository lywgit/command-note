# git

## Commands

### cloning remote repository

- **clone**:  copy from remote to local (address can be copioed from the repo webpage)
	- `git clone https://...repoaddress/reponame.git`
		- will create a new directory, default to remote repo name
	- `git config remote.origin.url` will show you your current remote address 
	- if you clone some public repo, you probably want to change this by 
		- `git remote set-url origin <your_repo_address>`
		- you might also need to set user.name

### configure remote repository 
 
- at a local position strt
- `git config remote.origin.url` will show you your current remote address 
- use `git remote add origin https://github.com/lywgit/leaning-design-pattern.git`
  	
### working

- **add**: add file to track
	- `git add <fileName>`
- **rm** remove file from tree and index
	- `git rm --cache <fileName>` will unstage the file (remove from index). will not delete the file from your workspace
- **commit**:
	- `git commit -m "initial commit"`
- **push**: from local to remote repository ("origin")
	- `git push origin master` (master is the remote branch name)
- **fetch** check and grab the remote file but does not merge into local
	- `git fetch origin master` (?)   
- **pull**: fetch AND merge the file from remote repository to local repository 
  - `git pull --all`
- **status**: check local status (show which files are not tracked yet ect)
	- `git status`


### branching

- A branch represents an independent line of developement for your repository
	- branches are just pointers to commits

- **branch**: create a branch
	- `git branch <branchName>` 
	- `git branch -r` list all branches
- **checkout**: switch to and work on a branch
	- `git checkout <branchName>`
	- `git checkout -b <branchName>` create a new branch and switch to it 
- **merge**: merge two branches
	-  example: merge 'develop' to 'master', delete it, push master
	- `git checkout master`
	- `git merge develop`
	- `git branch -d develop`  (delete branch locally)
	- `git push origin master`
	- `git push origin --delete develop` (delete remotely)
	
- push changes to a remote branch
	- `git push origin <branchname>`  

- delete a branch
	- local `git branch -d <bracnhname>`
	- remote `git push origin --delete <branchname>`

- switch branch cleanly   
	- When you change something that git is currently tracking (it is indexed), then you need to either commit it or discard it befor you can switch branch. If you do not want to keep these local changes anyway, you can either
	- do a force checkout: `git checkout -f <branchname>`
	- or revert to the status of your last commit `git reset --hard HEAD`
	- In both cases the local changes are discard.



### tags

- Annotated tags are meant for release while lightweight tags are meant for private or temporary object labels.

- display tags
	- `git tag`
- create lightweight tag (just a name pointer to specific commits)
	- `git tag <tagname>` 
		- tagname does not neet \"\" 	
- create annotated tag (a obhect with author, date info and SHA key)
	- `git tag -a <tagname>`  or
	- `git tag -a <tagname> -m "<message>"`
- push a tag to remote (push does not automatically do so)
	- `git push origin <tagname>`  
- checkout a tag
	- `git checkout tags/<tagname>`    Note you will NOT be on any branch
	- `git checkout tags/<tagname> -b <branchname>` will open a branch with that tag at the same time.


參考：

- [The difference between an annotated and unannotated tags](http://stackoverflow.com/questions/11514075/what-is-the-difference-between-an-annotated-and-unannotated-tag)


---

### conflict

You won't be able to commit or pull normally when there's a conflict. Use `git status` to see which files need to be fixed. Edit the conflicted file directly and look for the *conflict-markers*:

~~~
<<<<<<< HEAD
...
=======
...
>>>>>>> branch-name or commit-name
~~~ 



### update and clean up untracked branches (on other machines)

`git fetch --all --prune` ?

### look at object files

`git cat-file -p HEAD`



---

## Problems

### Moving files around

[This answer explian what happens quite clearly](http://stackoverflow.com/a/21082870/4632195)


### Synching a forked repositorty


```sh
# Example: 
# upsteam https://github.com/mmistakes/so-simple-theme/
# my fork https://github.com/lywgit/so-simple-theme/

# Configuring a remote for a fork
git remote -v
git remote add upstream https://github.com/mmistakes/so-simple-theme.git

# Synching a forked Repository
git fetch upstream
git checkout master
git merge upstream/master
```

reference:

1. [Configuring a remote for a fork](https://help.github.com/articles/configuring-a-remote-for-a-fork/)
2. [Syncing a fork](https://help.github.com/articles/syncing-a-fork/)

---

## Introduction to Git (Udemy course)

### resources:

- [git.wiki.kernel.org](https://git.wiki.kernel.org/index.php/Main_Page)
- [git-scm.com](https://git-scm.com/)
- [git-cheatsheet](http://ndpsoftware.com/git-cheatsheet.html)
- [git cheat-sheet](https://services.github.com/kit/downloads/github-git-cheat-sheet.pdf)



- git remote add origin https://...repo.git
	- this is like setting origin as a synonym of the remote path
- git push origin master 
	- origin is the remote branch, and master tells which branch to push to
