format PE console
include '%fasminc%/win32wxp.inc'
entry Start
section 'i.data' import readable writeable
library kernel32, 'KERNEL32.DLL', \
 msvcrt, 'MSVCRT.DLL'
import kernel32, ExitProcess, 'ExitProcess'
import msvcrt, printf, 'printf'
section '.data' data readable writeable
Hello db 'Yeah000(0)(0)(0)123456789', 0x0D, 0x0A, 0
Number db '%d', 0x0D, 0x0A, 0
section '.text' code readable executable
Start:
 cinvoke printf, Hello
 stdcall GetNumberCount, Hello
 cinvoke printf, Number, eax
 invoke ExitProcess, dword 0
proc GetNumberCount stdcall uses edi, Str1:DWORD
 mov edi,[Str1]
 xor eax, eax
Cycle:
 cmp byte[edi], 0
 jne Counter
 cmp byte[edi],0
 je Exit
Counter:
 cmp byte[edi],'0'
 jae Counter2
 inc edi
 loop Cycle
Counter2:
 cmp byte[edi],'9'
 jbe Counter3
 inc edi
 loop Cycle
Counter3:
 inc eax
 inc edi
 loop Cycle
Exit:
 ret
 endp