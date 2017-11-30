#!/bin/sh
cd "$(dirname "$0")"

for f in inc/* ; do
	. "$f"
done
unset f

_modules="input-jint input-cstr"
set -- $_modules

_help() {
	echo -e "USAGE:"
	echo -e "\th|help\thelp"
	echo -e "\tx\texit"
	echo -e "\tn\tnext"
	echo -e "\tc\tcompile"
	echo -e "\trb\trun bad"
	echo -e "\trg\trun good"
	echo -e "\tcb\tcat bad"
	echo -e "\tcg\tcat good"
}

echo "Type h or help to get help"

while [ "$#" -gt 0 ]; do
	_name="$1" ; shift
	. mod/"$_name"/config.sh
	while [ 1 ]; do
		_xc="0"
		_logn "> "
		read
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
