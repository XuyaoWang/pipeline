This file comes from blog [MIPS | 轻量级mips汇编指令转机器指令（Python实现）](https://www.jianshu.com/p/4f2727d20d73).This program has many bug.The instruction
```commandline
bne $1, $0, loop
```
cannot generate corresponding binary machine code.And many instruction is not supported.If using this code,must pay attention to correct output.However,using it to generate common instruction,like addi,lw,sw and so on, is useful.
Python env is Python2.7(such an old code)
