
_direnv_hook() {
  local previous_exit_status=$?;
  eval "$(direnv export bash)";
  return $previous_exit_status;
};
if [[ -x /usr/bin/direnv ]]; then
	if ! [[ "$PROMPT_COMMAND" =~ _direnv_hook ]]; then
	  PROMPT_COMMAND="_direnv_hook;$PROMPT_COMMAND";
	fi
fi


