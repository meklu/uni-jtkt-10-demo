#!/bin/sh

_comp_java() {
	javac "$(_src_bad_java)"
	javac "$(_src_good_java)"
}

_src_bad_java() {
	printf "mod/%s/Bad.java" "$_name"
}

_src_good_java() {
	printf "mod/%s/Good.java" "$_name"
}

_run_bad_java() {
	java -cp "$(dirname "$(_src_bad_java)")" Bad
}

_run_good_java() {
	java -cp "$(dirname "$(_src_good_java)")" Good
}
