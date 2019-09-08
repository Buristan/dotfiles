#!/usr/bin/env bash

TARGET_DOUBLET=$(
	grep 'file type' /tmp/gdb_info_arch |
	perl -lne 'print $_ =~ /\s(\S+)\.\z/'
)

OSABI=$(
	grep 'currently ' /tmp/gdb_info_arch |
	perl -lne 'print $_ =~ /currently "([^"]+)"\)\.\z/'
)

GDB_FILE="/tmp/gdb_target_arch.gdb"

case "$TARGET_DOUBLET" in
	*-i386)
		echo "set \$X86 = 1" >> $GDB_FILE;
		;;
	*-x86-64)
		echo "set \$X86_64 = 1" >> $GDB_FILE;
		echo "set \$64BITS = 1" >> $GDB_FILE;
		;;
	*-arm*)
		echo "set \$ARM = 1" >> $GDB_FILE;
		;;
	*-*mips*)
		echo "set \$MIPS = 1" >> $GDB_FILE;
		echo "set \$64BITS = 1" >> $GDB_FILE;
		;;
	mach-o-*)
		if test "$OSABI" == "Darwin64"; then
			echo "set \$X86_64 = 1" >> $GDB_FILE;
			echo "set \$64BITS = 1" >> $GDB_FILE;
		elif test "$OSABI" == "Darwin"; then
			echo "set \$X86 = 1" >> $GDB_FILE;
		fi
		;;
esac
