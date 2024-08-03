#!/usr/bin/env sh

_compile() {
	_c_flags="-g -pedantic -Wall -Wextra -Wshadow -Wsign-conversion -Wunreachable-code"
	_cc="$1"
	_src="$2"
	_exec="${2%.*}.out"
	# https://unix.stackexchange.com/questions/680930/bash-use-rest-of-the-arguments
	shift 2

	# https://stackoverflow.com/questions/13195655/bash-set-x-without-it-being-printed
	(
		set -x
		$_cc $(printf '%s' "$_c_flags") "$@" $_src -o "$_exec"
	)
}

compc() {
	if [ -z "$1" ]; then
		# display usage if no parameters given
		printf "Usage: compcpp <path/file_name>.<c|cpp> [args]"
	else
		_compile gcc "$@" -std=gnu17
	fi
}

compcpp() {
	if [ -z "$1" ]; then
		# display usage if no parameters given
		printf "Usage: compcpp <path/file_name>.<c|cpp> [args]"
	else
		_compile g++ "$@" -std=c++17
	fi
}

_run() {
	_compile_fn=$1
	shift 1

	_exec="${1%.*}.out"
	$_compile_fn "$@"
	(
		set -x
		eval "./$_exec"
	)
	trash "$_exec"
}

runc() {
	_run compc "$@"
}

runcpp() {
	_run compcpp "$@"
}

runasm() {
	_exec="${1%.*}.out"
	(
		set -x
		gcc -g -m32 -no-pie "$1" -o "$_exec"
	)
	(
		set -x
		eval "./$_exec"
	)
}
