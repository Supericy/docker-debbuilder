#!/bin/sh

set -e

is_directory_and_not_empty() {
    [ -d $1 -a ! "$(ls -A $1)" ]
}

clean() {
    debian/rules clean
}

deb_build() {
    dpkg-buildpackage -us -uc
}

deb_export() {
    cp $BUILD_DIR/../*.deb $OUTPUT_DIR
}

if is_directory_and_not_empty $SOURCE_DIR; then
    echo "source directory ($SOURCE_DIR) is either not a directory or is empty"
    exit 1
fi

if [ ! -d $SOURCE_DIR/debian ]; then
    echo "source directory must contain debian directory (SOURCE_DIR/debian)"
fi

cp -r $SOURCE_DIR/* $BUILD_DIR
cd $BUILD_DIR

clean
deb_build
deb_export