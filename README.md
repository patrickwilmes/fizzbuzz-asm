# Fizz buzzz NASM x64 assembly implementation

This repo contains a basic fizzbuzz implementation written in NASM x64 assembly. Fizzbuzz is calculated
until a fixed number of 20 right now.

The implementation uses the c library's printf for printing the actual number, but uses syscalls for printing
fizz / buzz, for the sake of simplicity.

## Build And Run
_Make sure you have nasm and gcc installed on your system_

```bash
make && ./fizzbuzz
```