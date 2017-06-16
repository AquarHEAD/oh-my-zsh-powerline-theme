# oh-my-zsh-powerline-theme

oh-my-zsh Powerline style Theme (heavily modified by aquarhead)

## Preview

with [Fira Code](https://github.com/tonsky/FiraCode)

![Imgur](http://i.imgur.com/tJXVKmY.png)

## Modifications

1. Changed prompt indicator to `◊`, inspired by [Pollen](http://docs.racket-lang.org/pollen/)
2. Simplified git status indicators
3. Customizable username via `$ZSH_USERNAME`

## Setup

1. Clone the repository
2. Create symlink of `powerline.zsh-theme` in `.oh-my-zsh/themes/`
3. Use it in your `.zshrc` file:

```
ZSH_THEME="powerline"
```

## Tips

To disable virtualenv modifying `PROMPT` upon activation, set the following env var:

```
export VIRTUAL_ENV_DISABLE_PROMPT="true"
```
