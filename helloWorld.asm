section .data
	msg db 'Hello, Davas', 0xa ;(String to be printed, where db is )
				   ;(declare bits and msg the name)
	len equ $ - msg		   ;(length of the string)

section .text
	global _start  ;(must be called for linker -> ld)
_start:		       ;(entry point for the linker)
	mov edx, len   ;(moves len to edx, where len is the length of the message)
	mov ecx, msg   ;(moves the actual message into ecx)
	mov ebx, 1     ;(file descriptor stdout)
	mov eax, 4     ;(system call number sys_write)
	int 0x80       ;(call kernel -> syscall)
	
	mov eax, 1     ;(sys_exit)
	int 0x80       ;(call kernel -> syscall)
