#!/bin/bash
_BASE_DIR="$( cd -P "$( dirname "$0" )" && pwd )"
_DVD1="${_DVD1:-/data/soft/instcd/cd1.iso}"
_DVD1_DIR="${_DVD1_DIR:-$_BASE_DIR/dvd1}"
_DVD2="${_DVD2:-/data/soft/instcd/cd2.iso}"
_DVD2_DIR="${_DVD2_DIR:-$_BASE_DIR/dvd2}"
_ISO_DIR="${_ISO_DIR:-$_BASE_DIR/cd}"

# include common functions
if [ -z "$_FUNCTIONS_SET" ]; then
	[ -x $_BASE_DIR/functions.sh ] && . $_BASE_DIR/functions.sh
fi