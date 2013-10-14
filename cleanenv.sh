_BASE_DIR="$( cd -P "$( dirname "$0" )" && pwd )"
[ -x $_BASE_DIR/setenv.sh ] && . $_BASE_DIR/setenv.sh

echo -------------------------------------
echo USING _DVD1 : $_DVD1
echo USING _DVD1_DIR : $_DVD1_DIR
echo USING _DVD2 : $_DVD2
echo USING _DVD2_DIR : $_DVD2_DIR
echo USING _ISO_DIR : $_ISO_DIR
echo -------------------------------------

umount $_DVD1_DIR
rmdir $_DVD1_DIR
umount $_DVD2_DIR
rmdir $_DVD2_DIR
