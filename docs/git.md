# GIT



If you like using git, and you have multiple machines where you
develop, rsync would be a pain. git could be the solution, as long as
you have ssh access to your machines. You fully control ownership,
sharing can be done with some extra steps, where you will need to set
up a special git account with a noshell access for example.

## Setting up a local/private git repository

Here is a simple example: one user, many machines:


     # on machine 'a', e.g. in the home directory
     a% mkdir -p git/project1.git
     a% cd git/project1.git
     a% git init --bare

     # on machine 'b',   anywhere ('user@' can be omitted if username is the same on a and b)
     b% git clone user@a:git/project1.git
     b% cd project1
     b% vi readme
     b% git add readme
     b% git commit readme
     b% git push


## Setting up a shared git repository

If you want to share such a repository between different users, it's
convenient to do this via a shared git account (short of going
to github or gitlab)
          

Add a new user on SERVER

     sudo adduser git
     su git
     cd
     mkdir .ssh
     chmod 700 .ssh
     touch .ssh/authorized_keys
     chmod 600 .ssh/authorized_keys


Assemble public key files from your users:

     cat /home/USER/.ssh/id_rsa.pub
         (otherwise:  use ssh-keygen to create then)

Add public keys to this file on SERVER

     nano /home/git/.ssh/authorized_keys

Bootstrap an empty repo

     mkdir /home/git/repository
     cd /home/git/repository
     mkdir my_project
     cd my_project
     git init --bare --shared

Clients can now clone and push/pull

     git clone git@SERVER:/home/git/repository/my_project
     git remote -v


## Some References

* http://blog.hasmanythrough.com/2008/12/18/agile-git-and-the-story-branch-pattern
	Agile git and the story branch pattern
* http://whygitisbetterthanx.com
	Why Git is Better than X

* https://thenewstack.io/git-set-up-a-local-repository-accessible-by-lan/
  Git: Set Up a Local Repository Accessible by LAN 
