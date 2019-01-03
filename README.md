# dotfile3
Third generation of dotfiles

## high level
* The best terminal for macOS: [Therm](https://github.com/trufae/Therm)
  * "it make sense to not over-engineer or make it fully configurable with features that <10% of users use"
* The best color scheme for terminal and editor: [gruvbox](https://github.com/morhetz/gruvbox)
* The best unix shell: [zsh](https://github.com/zsh-users/antigen#meta) (thinking I'll go back to fish since zsh plugisn aren't consistent)
* The best package manager for macOS: [Homebrew](brew.sh) (but not for [everything](https://nemethgergely.com/you-might-not-need-homebrew/) nor version management as mentioned next)
* The best version manager for multiple languages and tools: [asdf](https://github.com/asdf-vm/asdf) (blog: https://medium.com/@sidneyliebrand/switching-to-asdf-version-manager-eb6569e4e562)
* The best font: [mononoki](https://madmalik.github.io/mononoki/)
  * Specifially [Mononoki Nerd Font](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Mononoki)
* The best documentation viewer: [Dash](https://kapeli.com/dash)
* The best file search fzf. [fzf](https://github.com/junegunn/fzf) (In terminal and in Neovim)
* Neovim with maintained init.vim: [neovim](https://neovim.io/) (Found SpaceVim to be inconsistent, Oni might be worth a try, Oni2 looks promising but just got started)

## brews
* `brew tap caskroom/fonts`
* `brew cask install therm font-mononoki-nerd-font dash`

* `brew install openssl readline sqlite3 xz zlib` (pre reqs for `asdf plugin-add python`)
* `brew install coreutils gpg` (pre reqs for `asdf plugin-add nodejs`)
* `brew install zsh asdf neovim ripgrep fzf`

## misc commands and symlinks
* When running Mojave or higher (10.14+) you will also [need to install the additional SDK headers](https://developer.apple.com/documentation/xcode_release_notes/xcode_10_release_notes#3035624) (pre reqs for asdf python)
  * sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg -target /
* `bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring` (pre req for `asdf plugin-add nodejs`)
* ln -s ~/dotfiles/.zshrc ~/.zshrc
* `asdf plugin-add python` and desired version, likely 3.x.x `asdf install python 3.7.1`, set it `asdf global python 3.7.1`
* `asdf plugin-add nodejs` and desired version, likely 10.x.x `asdf install nodejs 10.14.2`, set it `asdf global nodejs 10.14.2`
* `asdf plugin-add golang` and desired version, likely 1.x.x `asdf install golang 1.11.4`, set it `asdf global golang 1.11.4`

* `asdf reshim python` will need to be run each time a python pip binary is installed
* `/usr/local/opt/fzf/install` install bindings for fzf
* `tic -x ~/dotfiles/xterm-256color-italic.terminfo` italics in terminal ([@dubistkomisch](https://medium.com/@dubistkomisch/how-to-actually-get-italics-and-true-colour-to-work-in-iterm-tmux-vim-9ebe55ebc2be))

## manual
* In Therm. In profile and color import the gruvbox color theme from this repo or gruvbox themselves. 
  * Also set under profile and text set the font to Mononoki Nerd Font. Your preference of size and boldness

## worthwhile "pay for" or "pay to upgrade"
* Dash

## High level commands to get used to
* [aliases for git](https://github.com/robbyrussell/oh-my-zsh/wiki/Plugin:git)
* [Vim commands (Neovim)](https://vim.rtorr.com/) and [SpaceVim](https://spacevim.org/use-vim-as-ide/)
* zsh basics? fish shell style?
* [How to use fzf](https://github.com/junegunn/fzf#usage)

## pips
* `pip install awscli --upgrade --user` then `asdf reshim python`
* `pip install mdv` then `asdf reshim python` (terminal markdown previewer)
