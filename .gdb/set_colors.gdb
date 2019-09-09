# vim: set ft=gdb:

# TODO custom set_rsp_color
define set_normal
	echo \033[0m
end
document set_normal
	Set output color to normal
end

define set_Red
	echo \033[1;31m
end
document set_Red
	Set output color to bold red
end

define set_Green
	echo \033[1;32m
end
document set_Green
	Set output color to bold green
end

define set_Brown
	echo \033[1;33m
end
document set_Brown
	Set output color to bold brown
end

define set_Blue
	echo \033[1;34m
end
document set_Blue
	Set output color to bold blue
end

define set_Purple
	echo \033[1;35m
end
document set_Purple
	Set output color to bold purple
end

define set_Cyan
	echo \033[1;36m
end
document set_Cyan
	Set output color to bold cyan
end

define set_Gray
	echo \033[1;37m
end
document set_Gray
	Set output color to bold gray
end
