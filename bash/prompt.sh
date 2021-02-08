
function set_win_title(){
	if [[ "${SSH_TTY}" ]]; then
		echo -ne "\033]0; ${HOSTNAME}:$(basename $PWD) \007"
	else
		echo -ne "\033]0; $(basename $PWD) \007"
	fi;
}
starship_precmd_user_func="set_win_title"
[[ -x /usr/local/bin/starship ]] && eval "$(starship init bash)"
