# vim: set ft=gdb:
define setup-detect-target
	set $ARM = 0
	set $X86 = 0
	set $X86_64 = 0
	set $MIPS = 0
	
	set $64BITS = 0
	
	set logging file /tmp/gdb_info_arch
	set logging overwrite on
	set logging redirect on
	set logging on
	set pagination off
	info target
	set logging overwrite off
	show osabi
	set pagination on
	set logging off
	set logging redirect off
	
	shell ~/.gdb/detect-arch.sh
	source /tmp/gdb_target_arch.gdb
	shell rm -f /tmp/gdb_info_arch /tmp/gdb_target_arch.gdb
end
document setup-detect-target
	Sets up various globals used throughout the GDB macros to provide
	architecture-specific support.
end
