CPaT Schoolwork
===============
#### [Official Site][cpat-blog] —  [Moodle][cpat-moodle]

***

## A Single Place for Everything CPaT
If you're anything like me, keeping updated on everything CPaT is quickly becoming a hassle. 
It feels like juggling crabs.

So, I made this for myself to keep assigned schoolwork, lectures, documents, updates, and even my personal work **in one place.** But after talking to a few classmates, I realized it might be helpful to everyone. Cheers.

***NOTE:*** *A lot of this README will feel like a tutorial. It's meant for a class with students of varying experience and knowledge.*

## How to use this Repo
You *could* just bookmark this page and refer back to it for updates. That's cool, whatever. 

But really? It was made for you to fork. 

Fork this repo to your account and you'll still get updates on due assignments. Handouts for labs or seminar will automatically download too. AND you can use it as your own, personal place to store files. Homework, seminar papers, labs. Write it all in your favorite editor and use git to access it from anywhere. It's all here.

### If you can already git
Fork it, and clone your fork. Add this repo as the remote upstream:

```bash
git remote add upstream git@github.com:pipecork/cpat-spring2013.git
```

Now, whenever you want to sync, you can just pull fetch/merge the upstream with pull:

```bash
git checkout master
git pull upstream master
```

Make sure to pull frequently, at the very least once a week. You can also run ```update.sh``` with the ```--merge/-m``` flag to save yourself the typing, and get any messages from me.

Now, every once and a while you might run into merge conflicts. Especially if you're making personal commits in persistent files, like using TODO.md as a checklist. But if you're even barely familiar with resolving merge conflicts then you'll be fine. It's just some school assignments.

If you REALLY don't want to deal with merging or anything, then you can use [**update.sh**](#updatesh) and it'll cradle you into easy-ville. Just make sure to read the [section below](#updatesh).

### If you don't even know what git is
That's cool! But you should really learn. I'll try to walk you through this process as best I can, but if you're stuck see the section [**Learning Git**](#learning-git) below for more info. Or [ask me](#contact).

1. First [create](https://github.com/signup/free) or login to a GitHub account. 

2. [Fork](https://help.github.com/articles/fork-a-repo) this repo. This makes a copy to your personal GitHub account. Keep the name or change it, it's up to you.

3. Clone the repo. You can either download the latest version of git for your operating system (google it), or do this on ada.
 * Make sure your [keys](https://github.com/settings/ssh) are properly set up on your local machine, else it'll deny you.
 * If you're on ada (or some other linux machine) you'd run: ```git clone git@github.com:<username>/<repo-name>.git ```
  * Replace ```<username>``` with your GitHub username, and ```<repo-name>``` with whatever you named your repo.

4. Run the update script. See [update.sh](#updatesh) below for more details.
 * Enter ```./update.sh``` into the shell.
 * Do this frequently (at least once a week) to not miss anything.

5. That should do it!

#### Learning Git
Git is a robust version control system (VCS) created by Linus Torvalds, and it is *very* cool. If you want to learn here's a few places to get started:

* [A series of labs to get you started](http://gitimmersion.com/)
* [A visual guide of basic usage](http://marklodato.github.io/visual-git-guide/index-en.html)
* [GitHub's own interactive tutorial](http://try.github.io/)
* [Pro Git on git's official website](http://git-scm.com/book)

Git can be intimidating at first, and it takes a while to truly become good at it. But the sooner you start, the better. It's the backbone of GitHub, necessary to participate in advanced CS research, and there are few things that make you employable like an active GitHub account.

### "But I can't put my schoolwork in a public repo!"
Understandable. While I think it'd be rad to publish your homework with an MIT License, sometimes you just don't want your horribly written seminar paper on the web. You got some options:

* Make your repo private. Use your .edu email to [sign up for educational account](https://github.com/edu). GitHub will give you 5 private repos for free if you're a student.

* [Bitbucket](https://bitbucket.org/) will give you private hosted repos for free.

* Host your own remote on ada (or any other server):
 1. Clone your fork to your account on ada. We'll assume it's at **~/my-cpat-work**. 
 2. ```cd``` into **~/my-cpat-work** and enter ```git remote rm origin``` to remove it's connection to your GitHub repo. Delete the GitHub repo.
 3. Now you can clone it locally while on ada (```git clone ~/my-cpat-work```) or elsewhere over ssh (```git clone <username>@ada.evergreen.edu:my-cpat-work```).
 4. See [here](http://git-scm.com/book/en/Git-on-the-Server-The-Protocols) for more info.

* Don't use a remote at all. Clone your fork and enter ```git remote rm origin```. Delete your repo from GitHub.
 * While git will still save your commit history and files, you'll be without backups if this repo goes splat.

## update.sh
If you're a wimp who doesn't want to learn git (are you *really* that much of a wimp?) there's a bash script that will do the book-keeping for you. One disadvantage is that the TODO.md within each class folder gets overwritten each time (if you keep a TODO, name it something other than 'TODO.md' or keep it in the root directory). Another disadvantage is that you're a wimp who won't learn how to use git. 

### Usage
On the command line of a linux or (maybe) Mac computer, run
```
./update.sh
```

It will tell what's getting overwritten (if anything) and ask you to confirm. You can run it with ```--force``` or ```-f``` to bypass the confirmation stage.

If you're on a Windows, sorry.

## Collaborate
You want to help out? **Great.** The class information here is updated by hand, and takes a bit of work. The pages seem to be updated at random, so it's difficult to keep this constantly up-to-date.

If you think something's missing, wrong, or done poorly you can:

* **Recommended:** Fork this repo (if you haven't already), make your changes in a branch, and [submit a pull request](https://help.github.com/articles/using-pull-requests).
* Email changes or suggestions to davmax04@evergreen.edu
* Comment on the latest commit of the file 
* I go by **pipecork** on freenode and idle in #tesc-blueteam

Although most changes will probably be simple, I'm recommending the pull request method only because you're probably new at git and should get comfortable doing it. Using pull requests is essential in contributing to open-source projects on the web, and it'll also show up as activity on your GitHub account. Which is always good.

## Contact
* Email: davmax04@evergreen.edu
* **pipecork** on freenode
* I'm in your class. Say hi.

## DISCLAIMER

```
The software, information, and other documents are presented "as is" 
and is to be used at your own risk. If anything here doesn't work the 
way you think it should: tough. 
Do not trust this as an ultimate authority for the class. Always 
double check the official documents given by the professors. If you 
forget to write a seminar paper or do a lab because it wasn't here, 
that's on you. If you lose credit because you were trusting us to help 
you out: tough. 
I and anyone else involved reserve the right to do the absolute 
minimum provided by law, up to and including nothing. If you don't 
like this disclaimer: tough, because this is basically the same 
disclaimer that comes with all software. 

But we can still be friends if you want.
```


<!--- Link Directory -->
[cpat-blog]: http://blogs.evergreen.edu/cpat
[cpat-moodle]: https://moodle.evergreen.edu/course/view.php?id=3105
