# vim: set ft=gdb:
define flags
	if (($eflags >> 0xB) & 1 )
		printf "O "
	else
		printf "o "
	end
	if (($eflags >> 0xA) & 1 )
		printf "D "
	else
		printf "d "
	end
	if (($eflags >> 9) & 1 )
		printf "I "
	else
		printf "i "
	end
	if (($eflags >> 8) & 1 )
		printf "T "
	else
		printf "t "
	end
	if (($eflags >> 7) & 1 )
		printf "S "
	else
		printf "s "
	end
	if (($eflags >> 6) & 1 )
		printf "Z "
	else
		printf "z "
	end
	if (($eflags >> 4) & 1 )
		printf "A "
	else
		printf "a "
	end
	if (($eflags >> 2) & 1 )
		printf "P "
	else
		printf "p "
	end
	if ($eflags & 1)
		printf "C "
	else
		printf "c "
	end
	printf "\n"
end
document flags
	Print flags register
end

define eflags
	printf "     OF <%d>  DF <%d>  IF <%d>  TF <%d>",           \
	        (($eflags >> 0xB) & 1 ), (($eflags >> 0xA) & 1 ),   \
	        (($eflags >> 9)   & 1 ), (($eflags >> 8)   & 1 )
	printf "  SF <%d>  ZF <%d>  AF <%d>  PF <%d>  CF <%d>\n",   \
	        (($eflags >> 7) & 1 ), (($eflags >> 6) & 1 ),       \
	        (($eflags >> 4) & 1 ), (($eflags >> 2) & 1 ), ($eflags & 1)
	printf "     ID <%d>  VIP <%d> VIF <%d> AC <%d>",           \
	        (($eflags >> 0x15) & 1 ), (($eflags >> 0x14) & 1 ), \
	        (($eflags >> 0x13) & 1 ), (($eflags >> 0x12) & 1 )
	printf "  VM <%d>  RF <%d>  NT <%d>  IOPL <%d>\n",          \
	        (($eflags >> 0x11) & 1 ), (($eflags >> 0x10) & 1 ), \
	        (($eflags >> 0xE)  & 1 ), (($eflags >> 0xC)  & 3 )
end
document eflags
	Print entire eflags register
end

# TODO right display for x32 systems
define reg
	printf "  rax:%016lX rbx:%016lX   rcx:%016lX",  $rax, $rbx, $rcx
	printf "  rdx:%016lX\n",  $rdx
	
	printf "  rsi:%016lX rdi:%016lX   ", $rsi, $rdi
	
	# Output rsp format
	set_Green
	printf "rsp"
	set_normal
	printf ":"
	set_Green
	printf "%016lX", $rsp
	set_normal
	
	# Output rbp format
	set_Brown
	printf "  rbp"
	set_normal
	printf ":"
	set_Brown
	printf "%016lX", $rbp
	set_normal
	printf "\n"
	
	# Output rip format
	set_Red
	printf "  rip"
	set_normal
	printf ":"
	set_Red
	printf "%016lX", $rip
	set_normal
	
	# not rflags because they don't use
	printf " eflags:%08X\n", $eflags
	
	# printf "     eax:%08X ebx:%08X  ecx:%08X ",  $eax, $ebx, $ecx
	# printf " edx:%08X\n",  $edx
	# printf "     esi:%08X edi:%08X  esp:%08X ",  $esi, $edi, $esp
	# printf " ebp:%08X\n", $ebp
	
	# Output code section
	set_Red
	printf "  cs"
	set_normal
	printf ":"
	set_Red
	printf "%04X", $cs
	set_normal
	
	# Output data section
	set_Cyan
	printf "  ds"
	set_normal
	printf ":"
	set_Cyan
	printf "%04X", $ds
	set_normal
	
	printf "  es:%04X", $es
	
	printf "  fs:%04X", $fs
	printf "  gs:%04X  ", $gs
	
	set_Green
	printf "ss"
	set_normal
	printf ":"
	set_Green
	printf "%04X    ", $ss
	set_normal
	
	flags
end
document reg
	Print CPU registers
end
