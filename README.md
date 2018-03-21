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
