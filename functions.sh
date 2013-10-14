#!/bin/bash
_FUNCTIONS_SET=1

# get current dir 
function _current_dir_link {
	local SOURCE="${BASH_SOURCE[0]}"
	local DIR=$(dirname "$SOURCE")
	while [ -h "$SOURCE" ]; do 
		SOURCE="$DIR/$(readlink "$SOURCE")";
		DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
	done
	echo "$( cd -P "$( dirname "$SOURCE" )" && pwd )"
}
# get current dir 
function _current_dir {
	echo "$( cd -P "$( dirname "$0" )" && pwd )"
}

# print ok msg
function _ok {
	echo -e "[ \e[0;32m OK  \e[m ] $1"	
}
# print error msg
function _err {
	echo -e "[ \e[0;31mERROR\e[m ] $1"	
}

# mkdir if dir not exist
function _mkdir {
	if [ ! -d "$1" ]; then
		mkdir $1
		_ok "$1 created"
		return 0
	fi
	return 1
}

# check if dir exist
function _check_dir {
	[ $# -eq 0 ] && return 0
	if [ -d $1 ]; then 
		_err "Dir Exist!! Install Abort!"
		return 1
	fi
	return 0
}

# check if service exist
function _check_service {
	[ $# -eq 0 ] && return 0
	if [ -f /etc/init.d/$1 ]; then 
		_err "Service Exist!! Install Abort!"
		return 1
	fi
	return 0
}

# check if port used
function _check_port {
	[ $# -eq 0 ] && return 0
	netstat -ltn | awk '{print $4}' | grep :$1
	if [ $? -eq 0 ]; then
		_err "Port Busy!! Install Abort!"
		return 1
	fi
	return 0	
}
function _check_port_uninstall {
	[ $# -eq 0 ] && return 0
	netstat -ltn | awk '{print $4}' | grep :$1
	if [ $? -eq 0 ]; then
		return 1
	fi
	return 0	
}

# check if given rpms installed
function _check_rpms {
	[ $# -eq 0 ] && return 0
	local errflag=0
	for pkg in $*; do
		rpm -q $pkg >> /dev/null 2>&1
		local returnval=$?
		if [ $returnval -ne 0 ]; then
			errflag=1
			_err "$pkg not installed"
		fi
	done
	unset pkg
	if [ $errflag -eq 0 ]; then
		_ok "All depend rpm installed"
		return 0
	else 
		return 1
	fi
}

# check return val
function _step_check() {
    local ret=$?
    if [ "$ret" != 0 ]; then
    	_err $1
        exit $ret
    fi    
}
