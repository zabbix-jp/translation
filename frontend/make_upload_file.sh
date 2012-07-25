#!/bin/sh

TMPDIR="/tmp"
MSGFMT="/usr/bin/msgfmt"

usage()
{
    echo "usage: $0 infile outfile"
    exit 2
}

err()
{
    echo "ERROR: $*"
    exit 1
}

[ "$#" != "2" ] && usage

if [ ! -x $MSGFMT ]; then
    MSGFMT=$(which msgfmt)
    [ "$?" != "0" ] && err "cannot find msgfmt command."
fi

INFILE=$1
OUTFILE=$2

grep -v "msgstr\[1\]" $INFILE > $OUTFILE
$MSGFMT -c --statistics $OUTFILE
