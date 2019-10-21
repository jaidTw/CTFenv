source /root/pwndbg/gdbinit.py

# context-code-lines: number of additional lines to print in the code context
# default: 10
set context-code-lines 8

# context-sections: which context sections are displayed (controls order)
# default: regs disasm code stack backtrace
set context-sections regs disasm stack
