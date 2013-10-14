_BASE_DIR="$( cd -P "$( dirname "$0" )" && pwd )"
[ -x $_BASE_DIR/setenv.sh ] && . $_BASE_DIR/setenv.sh

echo -------------------------------------
echo USING _DVD1 : $_DVD1
echo USING _DVD1_DIR : $_DVD1_DIR
echo USING _DVD2 : $_DVD2
echo USING _DVD2_DIR : $_DVD2_DIR
echo USING _ISO_DIR : $_ISO_DIR
echo -------------------------------------

# check DVD1
if [ ! -f $_DVD1 ]; then
	_err "$_DVD1 not found!"
	exit 1
fi
if [ -d $_DVD1_DIR ]; then
	_err "$_DVD1_DIR already exist!"
	exit 1
fi
# check DVD2
if [ ! -f $_DVD2 ]; then
	_err "$_DVD2 not found!"
	exit 1
fi
if [ -d $_DVD2_DIR ]; then
	_err "$_DVD2_DIR already exist!"
	exit 1
fi

if [ -f $_DVD1 -a -f $_DVD2 ]; then
	_mkdir $_DVD1_DIR
	mount -t iso9660 -o loop,ro $_DVD1 $_DVD1_DIR
	_mkdir $_DVD2_DIR
	mount -t iso9660 -o loop,ro $_DVD2 $_DVD2_DIR
fi
_mkdir $_ISO_DIR




