#!/bin/sh -e

cd openssl
INSTALL_DIR="$1"
PATH=$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/linux-x86_64/bin:$PATH
echo "----- Build openssl (`git describe --tags`) -----"

echo "++ Build openssl armeabi-v7a ++"
./Configure android-arm -D__ANDROID_API__=21 --prefix="$INSTALL_DIR/armeabi-v7a"
make clean
make -j4
make install

echo "++ Build openssl arm64-v8a ++"
./Configure android-arm64 -D__ANDROID_API__=21 --prefix="$INSTALL_DIR/arm64-v8a"
make clean
make -j4
make install

echo "++ Build openssl x86 ++"
./Configure android-x86 -D__ANDROID_API__=21 --prefix="$INSTALL_DIR/x86"
make clean
make -j4
make install

echo "++ Build openssl x86_64 ++"
./Configure android-x86_64 -D__ANDROID_API__=21 --prefix="$INSTALL_DIR/x86_64"
make clean
make -j4
make install

cd ..