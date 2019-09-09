# vim: set ft=gdb:
define ascii_char
	set $_c=*(unsigned char *)($arg0)
	if ( $_c < 0x20 || $_c > 0x7E )
		printf "."
	else
		printf "%c", $_c
	end
end
document ascii_char
	Print the ASCII value of arg0 or '.' if value is unprintable
end

define hex_quad
	printf "%02X %02X %02X %02X  %02X %02X %02X %02X",               \
		*(unsigned char*)($arg0),     *(unsigned char*)($arg0 + 1),  \
		*(unsigned char*)($arg0 + 2), *(unsigned char*)($arg0 + 3),  \
		*(unsigned char*)($arg0 + 4), *(unsigned char*)($arg0 + 5),  \
		*(unsigned char*)($arg0 + 6), *(unsigned char*)($arg0 + 7)
end
document hex_quad
	Print eight hexadecimal bytes starting at arg0
end

define hexdump
	set_Blue
	printf " %016lX : ", $arg0
	set_norm
	hex_quad $arg0
	printf " - "
	hex_quad ($arg0+8)
	printf " "
	
	ascii_char ($arg0)
	ascii_char ($arg0+1)
	ascii_char ($arg0+2)
	ascii_char ($arg0+3)
	ascii_char ($arg0+4)
	ascii_char ($arg0+5)
	ascii_char ($arg0+6)
	ascii_char ($arg0+7)
	ascii_char ($arg0+8)
	ascii_char ($arg0+9)
	ascii_char ($arg0+0xA)
	ascii_char ($arg0+0xB)
	ascii_char ($arg0+0xC)
	ascii_char ($arg0+0xD)
	ascii_char ($arg0+0xE)
	ascii_char ($arg0+0xF)
	
	printf "\n"
end
document hexdump
	Display a 16-byte hex/ASCII dump of arg0
end

define ddump
	# Output data
	printf "["
	set_Cyan
	printf "%04X", $ds
	set_norm
	printf ":"
	set_Cyan
	printf "%016lX", $data_addr
	set_norm
	printf "]"
	set_Cyan
	printf "------------------------"
	printf "-----------------------------------[data]\n"
	set_norm
	
	set $_count=0
	while ($_count < $arg0)
		set $_i=($_count * 0x10)
		hexdump ($data_addr+$_i)
		set $_count++
	end
end
document ddump
	Display $arg0 lines of hexdump for address $data_addr
end

define dd
	if $argc != 1
		help dd
	else
		set $data_addr = $arg0
		ddump 0x10
	end
end
document dd
	Display 16 lines of a hex dump of address starting at ADDR.
	Usage: dd ADDR
end


define datawin
	if ($ARM == 1)
		if ((($r0 >> 0x18) == 0x40) || (($r0 >> 0x18) == 0x08) || (($r0 >> 0x18) == 0xBF))
			set $data_addr = $r0
		else
			if ((($r1 >> 0x18) == 0x40) || (($r1 >> 0x18) == 0x08) || (($r1 >> 0x18) == 0xBF))
				set $data_addr = $r1
			else
				if ((($r2 >> 0x18) == 0x40) || (($r2 >> 0x18) == 0x08) || (($r2 >> 0x18) == 0xBF))
					set $data_addr = $r2
				else
					if ((($r3 >> 0x18) == 0x40) || (($r3 >> 0x18) == 0x08) || (($r3 >> 0x18) == 0xBF))
						set $data_addr = $r3
					else
						set $data_addr = $sp
					end
				end
			end
		end
	else
		if ($MIPS == 1)
			if ((($a0 >> 0x18) == 0x40) || (($a0 >> 0x18) == 0x08) || (($a0 >> 0x18) == 0xBF))
				set $data_addr = $a0
			else
				if ((($a1 >> 0x18) == 0x40) || (($a1 >> 0x18) == 0x08) || (($a1 >> 0x18) == 0xBF))
						set $data_addr = $a1
				else
					if ((($a2 >> 0x18) == 0x40) || (($a2 >> 0x18) == 0x08) || (($a2 >> 0x18) == 0xBF))
						set $data_addr = $a2
					else
						if ((($a3 >> 0x18) == 0x40) || (($a3 >> 0x18) == 0x08) || (($a3 >> 0x18) == 0xBF))
							set $data_addr = $a3
						else
							set $data_addr = $sp
						end
					end
				end
			end
		else
			if ($X86_64 == 1)
				if ((($rsi >> 0x18) == 0x40) || (($rsi >> 0x18) == 0x08) || (($rsi >> 0x18) == 0xBF))
					set $data_addr = $rsi
				else
					if ((($rdi >> 0x18) == 0x40) || (($rdi >> 0x18) == 0x08) || (($rdi >> 0x18) == 0xBF))
						set $data_addr = $rdi
					else
						if ((($rax >> 0x18) == 0x40) || (($rax >> 0x18) == 0x08) || (($rax >> 0x18) == 0xBF))
							set $data_addr = $rax
						else
							set $data_addr = $rsp
						end
					end
				end
			else
				if ($X86 == 1)
					if ((($esi >> 0x18) == 0x40) || (($esi >> 0x18) == 0x08) || (($esi >> 0x18) == 0xBF))
						set $data_addr = $esi
					else
						if ((($edi >> 0x18) == 0x40) || (($edi >> 0x18) == 0x08) || (($edi >> 0x18) == 0xBF))
							set $data_addr = $edi
						else
							if ((($eax >> 0x18) == 0x40) || (($eax >> 0x18) == 0x08) || (($eax >> 0x18) == 0xBF))
								set $data_addr = $eax
							else
								set $data_addr = $esp
							end
						end
					end
				end
			end
		end
	end
	ddump $CONTEXTSIZE_DATA
end
document datawin
	Display esi, edi, eax, or esp in the data window
end
