# vim: set ft=gdb:
define context
	printf "____________________________________________"
	printf "____________________________________________\n"
	reg
	printf "[%04X:%016lX]------------------------", $ss, $rsp
	printf "----------------------------------[stack]\n"
	hexdump $sp+0x30
	hexdump $sp+0x20
	hexdump $sp+0x10
	hexdump $sp
	datawin
	printf "[%04X:%016lX]------------------------", $cs, $rip
	printf "-----------------------------------[code]\n"
	x /6i $pc
	printf "____________________________________________"
	printf "____________________________________________\n"
end
document context
	Print regs, stack, ds:esi, and disassemble cs:eip
end

define context-on
set $SHOW_CONTEXT = 1
end
document context-on
	Enable display of context on every program stop
end

define context-off
set $SHOW_CONTEXT = 1
end
document context-on
	Disable display of context on every program stop
end
