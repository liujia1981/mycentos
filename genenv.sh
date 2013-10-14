_BASE_DIR="$( cd -P "$( dirname "$0" )" && pwd )"
[ -x $_BASE_DIR/functions.sh ] && . $_BASE_DIR/functions.sh

_DVD1=/data/soft/instcd/cd1.iso
_DVD2=/data/soft/instcd/cd2.iso
_DVD1_DIR=$_BASE_DIR/dvd1
_DVD2_DIR=$_BASE_DIR/dvd2
_ISO_DIR=$_BASE_DIR/cd

if [ -f $_DVD1 -a -f $_DVD2 ]; then
	_mkdir $_DVD1_DIR
	_mkdir $_DVD2_DIR
	mount -t iso9660 -o loop,ro $_DVD1 $_DVD1_DIR
	mount -t iso9660 -o loop,ro $_DVD2 $_DVD2_DIR
fi
_mkdir $_ISO_DIR



