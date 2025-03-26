# My dotfiles 

It's that time. I've lived long enough without dotfiles. Not a huge fan of mega customizations, but I do like to have a few things set up the way I like them.

```bash
chsh -s $(which zsh)
git clone https://github.com/laacz/dotfiles.git ~/.dotfiles && ~/.dotfiles/install.sh 
```

Could have made it private, but then cloning onto boxes without a github token
would be a pain.

## Small note on *Powerline* fonts

Regarding fonts. On *Mac* (*iTerm2* and more recently *Ghostty*) any [*powerline* patched font](https://github.com/powerline/fonts) worked, on *Windows* inside *Windows Terminal*, only [*Nerd* fonts](https://www.nerdfonts.com/) worked (my choice is *FiraCode NFM*).

It is advertised that *Cascadia (Code|Mono) PL* now comes with embedded *Powerline* symbols, but I could not get it to work for all glyphs.
