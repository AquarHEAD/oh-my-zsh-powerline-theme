oh-my-zsh-powerline-theme
=========================

oh-my-zsh Powerline style Theme (with updates from AquarHEAD)

Update
------

1. add mecurial support
2. change the prompt indicator: '±' for git, '☿' for hg, '' for normal dir on my mac
3. modify some status indicator (but still not very good)
4. allow you to set a custom username via $ZSH_USERNAME in your `~/.zshrc`


Set Up
------

1. Clone the repository.

2. Create un symlink of **powerline.zsh-theme** in **.oh-my-zsh/themes/**.

2. Configure the theme in your **.zshrc** file :

    ```
    ZSH_THEME="powerline"
    ```

Requirements
------------

* Vim Powerline patched font : See [Powerline for vim](https://github.com/Lokaltog/vim-powerline/tree/develop/fontpatcher) for more info.
* Z shell (zsh) : See [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) for more info.
