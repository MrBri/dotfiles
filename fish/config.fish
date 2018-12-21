alias git=hub
fish_vi_key_bindings

# nvm use 10    # for use with fast-nvm-fish. SWITCHING TO asdf

set -x GOPATH $HOME/go
set PATH $GOPATH/bin /usr/local/opt/coreutils/libexec/gnubin ~/.local/bin /usr/local/sbin $PATH
# set -x PATH $PATH $GOPATH/bin
# set -gx PATH ~/anaconda3/bin $PATH
# set -gx PATH ~/.local/bin $PATH 	# where anaconda pip installed awscli
# set -x PATH $PATH /usr/local/opt/coreutils/libexec/gnubin
# set -x PATH $PATH /.local/bin

test -x (which aws_completer); and complete --command aws --no-files --arguments '(begin; set --local --export COMP_SHELL fish; set --local --export COMP_LINE (commandline); aws_completer | sed \'s/ $//\'; end)'

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /Users/ty/.config/yarn/global/node_modules/tabtab/.completions/serverless.fish ]; and . /Users/ty/.config/yarn/global/node_modules/tabtab/.completions/serverless.fish
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /Users/ty/.config/yarn/global/node_modules/tabtab/.completions/sls.fish ]; and . /Users/ty/.config/yarn/global/node_modules/tabtab/.completions/sls.fish

source /usr/local/opt/asdf/asdf.fish

# set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
