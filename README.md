# My dotfiles

This directory contain all the dotfiles for my system

## Requirement

Ensure you have the following installed on your system
(These command are for Debian based distro only)
### Git
```
sudo apt install git
```

### stow
```
sudo apt install stow
```

## Installation
Clone this to your home directory
```
$ git clone git@github.com/alcenium/dotfiles.git
$ cd dotfiles
```

Then use GNU stow to create symlinks
(Remember to backup your own dotfiles first just in case)

```
$ stow . -t ~
```