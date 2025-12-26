function fish_prompt
    echo "> "
end

function full_fish_prompt
    function fish_prompt
        # string join '' -- (set_color green) (prompt_pwd --full-length-dirs 2) (set_color normal) '>'
        set_color normal

        set_color brgreen --bold
        echo -n "┬─"

        set_color blue --bold
        echo -n "<"
        set_color normal
        # echo -n (string replace -a / (set_color green)"/"(set_color normal) (pwd))


        set -l path_segments (string split / (prompt_pwd --full-length-dirs=999))

        for i in (seq (count $path_segments))
            if test $i -eq (count $path_segments)
                set_color normal
                set_color brblue # current dir (last segment)
            else
                set_color white --dim # parents
            end

            echo -n $path_segments[$i]

            if test $i -lt (count $path_segments)
                set_color normal
                set_color green
                echo -n "/"
            end
        end

        set_color normal


        set_color blue --bold
        echo -n ">"
        set_color normal

        # set time (command date +%I:%H:%S)

        # TIME MODULE
        set_color red
        echo -n " - " 
        set_color blue --bold
        echo -n "<"
        set_color yellow 
        # echo -n "󰥔"
        set icon \uf017
        set space \u202f
        echo -n $icon$space
        set_color normal
        echo -n (command date +%I:%M:%S)
        set_color blue --bold
        echo -n ">"
        set_color normal


        # GIT MODULE
        set branch (command git rev-parse --abbrev-ref HEAD 2>/dev/null)
        if test -n "$branch"
            # set branch_status (command git diff 2>/dev/null)
            set_color red
            echo -n " - " 
            set_color blue --bold
            echo -n "<"
            set_color yellow 
            echo -n " "

            set_color normal
            set line (git status | sed -n 2p)
            if not command git diff --quiet 2>/dev/null; or string match -q '*tracked files*' "$line"
                set_color red
            else if not string match -q '*up to date*' "$line"; and not string match -q '*working tree clean*' "$line"
                set_color yellow
            else
                set_color green
            end
            echo -n "$branch"

            set_color blue --bold
            echo -n ">"
            set_color normal
        end

        echo

        set_color brgreen --bold
        # echo -n '  '
        # echo -n ' 󱦰 '

        echo -n "╰─> "

        set_color normal
    end
end

function fish_right_prompt
end


clear

# if not set -q SSH_TTY; and not set -q NVIM
if not set -q SSH_TTY; and not set -q NVIM;
    full_fish_prompt
end


