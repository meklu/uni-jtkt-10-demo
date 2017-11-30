#!/bin/sh

_comp() {
	echo "[$_name] Compiling case..."
	_comp_"$_type"
}

_src_bad() {
	_src_bad_"$_type"
}

_src_good() {
	_src_good_"$_type"
}

_cat_bad() {
	pygmentize -l "$_type" "$(_src_bad)"
}

_cat_good() {
	pygmentize -l "$_type" "$(_src_good)"
}

_logn() {
	if [ "$_xc" = "0" ]; then
		echo -en "\033[01;34m";
	else
		echo -en "\033[01;31m";
	fi
	echo -n "[$_name]"
	echo -en "\033[00m"
	echo -n " $@"
}

_log() {
	_logn "$@"
	echo
}

_run() {
	_log "Running the $1 case..."
	_run_"$1"_"$_type"
	_xc="$?"
	_log "Exit code $_xc"
}

_run_bad() {
	_run bad
}

_run_good() {
	_run good
}
