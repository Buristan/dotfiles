# I would like to express my gratitude to William B. Zimmerly for his article:
# https://www.ibm.com/developerworks/aix/library/au-gdb.html
# in which he describes examples of macros.
# From there this gdbinit was taken.

set history save
set history expansion
set history size 2048
set disassembly-flavor intel

source ~/.gdb/breakpoints.gdb

define argv
	show args
	end
document argv
	Print program arguments
end

define stack
	info stack
	end
document stack
	Print call stack
end

define frame
	info frame
	info args
	info locals
	end
document frame
	Print stack frame
end

source ~/.gdb/reg.gdb

define func
	info functions
	end
document func
	Print functions in target
end

define var
	info variables
	end
document var
	Print variables (symbols) in target
end

define lib
	info sharedlibrary
	end
document lib
	Print shared libraries linked to target
end

define sig
	info signals
	end
document sig
	Print signal actions for target
end

define thread
	info threads
	end
document thread
	Print threads in target
end

define u
	info udot
	end
document u
	Print kernel 'user' struct for target
end

define dis
	disassemble $arg0
	end
document dis
	Disassemble address
	Usage: dis addr
end

source ~/.gdb/com_dump.gdb
source ~/.gdb/ctx.gdb
