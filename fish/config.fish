if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting ""

if test -z "$DISPLAY"; and test (tty) = /dev/tty1
	exec startx
end

source ~/.config/fish/conf.d/env.fish
source ~/.config/fish/conf.d/prompt.fish
source ~/.config/fish/conf.d/alias.fish

