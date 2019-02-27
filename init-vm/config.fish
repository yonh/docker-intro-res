if test -f /Users/yonh/.autojump/share/autojump/autojump.fish; . /Users/yonh/.autojump/share/autojump/autojump.fish; end

function fish_right_prompt
	printf "%s" (date)
end
function fish_prompt -d "Write out the prompt"
	echo ''
    # printf '%s@%s%s %s %s' (whoami) (hostname | cut -d . -f 1)  (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
    printf '%s%s %s %s' (whoami) (set_color $fish_color_cwd) (pwd) (set_color normal)

	# show git branch
	set -l git_branch (git branch ^/dev/null | sed -n '/\* /s///p')
	if [ $git_branch ]
		printf 'git:(%s%s%s)' (set_color green) $git_branch (set_color normal)  
	end
	echo -e '\n~> '
end

# alias
function 2.; cd ../../; end
function 3.; cd ../../../; end
function 4.; cd ../../../../; end
function ....; 2.; end
function ......; 3.; end
function ........; 4.; end

function gst 
	git status $argv
end
function gdf
	git diff $argv
end
function gdw
	git diff --color-words
end
function gbr
	git branch $argv
end
function ga
	git add $argv
end
function clone
	git clone $argv
end
function branchnew 
	git checkout -b $argv 
end

