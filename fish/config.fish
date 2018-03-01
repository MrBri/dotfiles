alias git=hub
fish_vi_key_bindings

set -x GOPATH $HOME/go
set -x PATH $PATH $GOPATH/bin
set -gx PATH ~/anaconda3/bin $PATH

test -x (which aws_completer); and complete --command aws --no-files --arguments '(begin; set --local --export COMP_SHELL fish; set --local --export COMP_LINE (commandline); aws_completer | sed \'s/ $//\'; end)'
