#!/bin/sh
cd "$(dirname "$0")"

for f in inc/* ; do
	. "$f"
done
unset f

_modules="input-jint input-cstr cksum"
set -- $_modules

_help() {
	printf "USAGE:\n"
	printf "\th|help\thelp\n"
	printf "\tx\texit\n"
	printf "\tn\tnext\n"
	printf "\tc\tcompile\n"
	printf "\trb\trun bad\n"
	printf "\trg\trun good\n"
	printf "\tcb\tcat bad\n"
	printf "\tcg\tcat good\n"
}

echo "Type h or help to get help"

while [ "$#" -gt 0 ]; do
	_name="$1" ; shift
	. mod/"$_name"/config.sh
	while [ 1 ]; do
		_xc="0"
		_logn "> "
		read REPLY
		case "$REPLY" in
			h|help)
				_help
				;;
			x)
				echo "Bye!"
				exit 0
				;;
			n)
				break
				;;
			c)
				_comp
				;;
			rb)
				_run_bad
				;;
			rg)
				_run_good
				;;
			cb)
				_cat_bad
				;;
			cg)
				_cat_good
				;;
			*)
				echo "Unknown command!"
				;;
		esac
	done
done
