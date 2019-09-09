# vim: set ft=gdb:
define context
	if $SHOW_CONTEXT
		set_Cyan
		printf "____________________________________________"
		printf "____________________________________________\n"
		set_normal
		reg
		# Output rsp
		printf "["
		set_Green
		printf "%04X", $ss
		set_normal
		printf ":"
		set_Green
		printf "%016lX", $rsp
		set_normal
		printf "]"
		set_Green
		printf "------------------------"
		printf "----------------------------------[stack]\n"
		set_normal
		
		hexdump $sp+0x30
		hexdump $sp+0x20
		hexdump $sp+0x10
		hexdump $sp
		
		# Output data segment
		datawin
		
		# Output code
		printf "["
		set_Red
		printf "%04X", $cs
		set_normal
		printf ":"
		set_Red
		printf "%016lX", $rip
		set_normal
		printf "]"
		set_Red
		printf "------------------------"
		printf "-----------------------------------"
		printf "[code]\n"
		
		set_normal
		x /6i $pc
		set_Cyan
		printf "____________________________________________"
		printf "____________________________________________\n"
		set_normal
	end
end
document context
	Print regs, stack, ds:rsi, and disassemble cs:rip
end

define context-on
	set $SHOW_CONTEXT = 1
end
document context-on
	Enable display of context on every program stop
end

define context-off
	set $SHOW_CONTEXT = 0
end
document context-off
	Disable display of context on every program stop
end
