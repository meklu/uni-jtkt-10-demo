#!/bin/sh

# NOP
_comp_php() {
	return
}

_src_bad_php() {
	printf "mod/%s/bad.php" "$_name"
}

_src_good_php() {
	printf "mod/%s/good.php" "$_name"
}

_run_bad_php() {
	php -f "$(_src_bad_php)"
}

_run_good_php() {
	php -f "$(_src_good_php)"
}
