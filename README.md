# oh-my-zsh-powerline-theme

oh-my-zsh Powerline style Theme (with updates from AquarHEAD)

## Preview

![Imgur](http://i.imgur.com/BKhXxNM.png)

## Update

1. Change the prompt indicator: `±` for git, `` for normal dir on my mac

2. Simplified git status indicator

3. Customize username via `$ZSH_USERNAME`


## Set Up

1. Clone the repository.

2. Create symlink of `powerline.zsh-theme` in `.oh-my-zsh/themes/`.

2. Configure the theme in your `.zshrc` file :

```
ZSH_THEME="powerline"
```

## Tips

To disable virtualenv modifying `PROMPT` upon activation, set the following env var:

```
export VIRTUAL_ENV_DISABLE_PROMPT="true"
```

## Requirements

* Vim Powerline patched font : See [Powerline for vim](https://github.com/Lokaltog/vim-powerline/tree/develop/fontpatcher) for more info.
* Z shell (zsh) : See [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) for more info.
