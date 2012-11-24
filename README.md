oh-my-zsh-powerline-theme
=========================

oh-my-zsh Powerline style Theme (with updates from AquarHEAD)

Preview
------

![Preview](http://share.aquarhead.me/zsh-powerline.png)

Update
------

1. Add mecurial support

2. Change the prompt indicator: `±` for git, `☿` for hg, `` for normal dir on my mac

3. Modify some status indicator (but still not very good)

4. Allow you to set a custom username via `$ZSH_USERNAME` in your `~/.zshrc`


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
