# dotfiles2
The next generation of dotfiles

* The best terminal for macOS: [iterm2](https://www.iterm2.com/downloads.html)
* The best unix shell: [Fish](fishshell.com)
* The best editor: [Neovim](neovim)
* The best way to manage packages on macOS: [Homebrew](brew.sh)
* The best Node.js version manager: [fnm](https://github.com/fisherman/fnm)
* The best editor and terminal color scheme: [Oceanic-Next](https://github.com/mhartington/oceanic-next-iterm)

TODO: 
* Automate symlinks
	* ln -s ~/dotfiles/config.fish ~/.config/fish/
	* ln -s ~/dotfiles/init.vim ~/.config/nvim/
* Save text expansion
	* aText or Fish functions or both
* Backup fish/fisherman settings
	* prompt
	* fnm
* Vimplug in .vim instead of .config/nvim?
* "GoInstallBinaries for vim-go, also script 'brew install go'?


Commands to run:
`curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`

Git submodules:
`https://github.com/mhartington/oceanic-next-iterm.git`
