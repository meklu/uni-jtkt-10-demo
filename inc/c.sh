#!/bin/sh

_comp_c() {
	# add .o to ignore these in an easier fashion in git
	cc "$(_src_bad_c)" -o "$(_stem_bad_c)".o
	cc "$(_src_good_c)" -o "$(_stem_good_c)".o
}

_stem_bad_c() {
	printf "mod/%s/bad" "$_name"
}

_stem_good_c() {
	printf "mod/%s/good" "$_name"
}

_src_bad_c() {
	printf "%s.c" "$(_stem_bad_c)"
}

_src_good_c() {
	printf "%s.c" "$(_stem_good_c)"
}

_run_bad_c() {
	./"$(_stem_bad_c)".o
}

_run_good_c() {
	./"$(_stem_good_c)".o
}
