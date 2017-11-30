#!/bin/sh
cd "$(dirname "$0")"

yes "$(printf "c\nn")" | ./run.sh
