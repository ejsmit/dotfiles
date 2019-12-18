
# `s` with no arguments opens the current directory in Sublime Text, otherwise
# opens the given location
function s() {
	if [ $# -eq 0 ]; then
		subl .;
	else
		subl "$@";
	fi;
}

# `a` with no arguments opens the current directory in Atom, otherwise opens the
# given location
function a() {
	if [ $# -eq 0 ]; then
		atom .;
	else
		atom "$@";
	fi;
}

# `c` with no arguments opens the current directory in VS Code, otherwise opens the
# given location
function c() {
	if [ $# -eq 0 ]; then
		code .;
	else
		code "$@";
	fi;
}
