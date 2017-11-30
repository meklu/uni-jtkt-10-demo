#!/bin/sh

_comp() {
	_log "Compiling case..."
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
		printf "\033[01;34m";
	else
		printf "\033[01;31m";
	fi
	printf "[$_name]"
	printf "\033[00m"
	printf "%s" " $@"
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
