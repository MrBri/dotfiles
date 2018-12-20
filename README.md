# dotfile3
Third generation of dotfiles

## high level
* The best terminal for macOS: [Therm](https://github.com/trufae/Therm)
  * "it make sense to not over-engineer or make it fully configurable with features that <10% of users use"
* The best color scheme for terminal and editor: [gruvbox](https://github.com/morhetz/gruvbox)
* The best unix shell: [zsh]
* The best editor: [SpaceVim]
* The best package manager for macOS: [Homebrew]
* The best version manager for multiple languages and tools: [asdf](https://github.com/asdf-vm/asdf) (blog: https://medium.com/@sidneyliebrand/switching-to-asdf-version-manager-eb6569e4e562)
* The best font: [mononoki](https://madmalik.github.io/mononoki/)
  * Specifially [Mononoki Nerd Font](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Mononoki)
* The best documentation viewer: [Dash](https://kapeli.com/dash)

## brews
brew tap caskroom/fonts
brew install caskroom/cask/therm
brew cask install font-mononoki-nerd-font
brew cask install dash

brew install zsh
brew install asdf
brew install neovim
brew install openssl readline sqlite3 xz zlib (pre reqs for `asdf plugin-add python`)
brew install coreutils gpg (pre reqs for `asdf plugin-add nodejs`)

## misc commands and symlinks
* When running Mojave or higher (10.14+) you will also [need to install the additional SDK headers](https://developer.apple.com/documentation/xcode_release_notes/xcode_10_release_notes#3035624) (pre reqs for asdf python)
  * sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg -target /
* `bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring` (pre req for `asdf plugin-add nodejs`)
* ln -s ~/dotfiles/.zshrc ~/.zshrc
* `asdf plugin-add python` and desired version, likely 3.x.x `asdf install python 3.7.1`, set it `asdf global python 3.7.1`
* `asdf plugin-add nodejs` and desired version, likely 10.x.x `asdf install nodejs 10.14.2`, set it `asdf global nodejs 10.14.2`
* `asdf plugin-add golang` and desired version, likely 1.x.x `asdf install golang 1.11.4`, set it `asdf global golang 1.11.4`

## manual
* In Therm. In profile and color import the gruvbox color theme from this repo or gruvbox themselves. 
  * Also set under profile and text set the font to Mononoki Nerd Font. You preference of size and boldness

## worthwhile "pay for" or "pay to upgrade"
* Dash

## High level commands to get used to
* [aliases for git](https://github.com/robbyrussell/oh-my-zsh/wiki/Plugin:git)
* [Vim commands (Neovim)](https://vim.rtorr.com/) and [SpaceVim](https://spacevim.org/use-vim-as-ide/)
* zsh basics? fish shell style?


# dotfiles2
The next generation of dotfiles

* The best terminal for macOS: [iterm2](https://www.iterm2.com/downloads.html)
* The best unix shell: [Fish](fishshell.com)
* The best editor: [Neovim](neovim)
* The best way to manage packages on macOS: [Homebrew](brew.sh)
* The best Node.js version manager: [nvm](https://github.com/creationix/nvm#important-notes)
* The best editor and terminal color scheme: [Oceanic-Next](https://github.com/mhartington/oceanic-next-iterm)

Commands to run:
`curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`

TODO: 
* Automate symlinks
	* ln -s ~/dotfiles/fish/config.fish ~/.config/fish/
	* ln -s ~/dotfiles/fish/completions/terraform.fish ~/.config/fish/completions/
	* ln -s ~/dotfiles/init.vim ~/.config/nvim/
* Save text expansion
	* source ~/dotfiles/fish/abbr.txt to add abbreviations to fish
* Vimplug in .vim instead of .config/nvim?
* "GoInstallBinaries for vim-go, also script 'brew install go'?

Git submodules:
`https://github.com/mhartington/oceanic-next-iterm.git`
