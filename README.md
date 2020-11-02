# Truth machine written in NASM
This repo contains my own implementation of [truth machine](https://esolangs.org/wiki/Truth-machine) writen in [NASM](https://nasm.us).

## Whats a Truth Machine?
It is simple program, devised by [Keymaker](https://esolangs.org/wiki/User:Keymaker). 
Thanks to its simplicity [truth machine](https://esolangs.org/wiki/Truth-machine) is ussually quite easy to implement in most languages, even in [esoteric](https://esolangs.org/wiki/Main_Page) ones.

Implementing it will mainly test these capabilities of a language:
* input
* output
* decision
* repetition
* termination

### How Does It Work?
* Ask user for input.
* If input is zero:
  * Output 0
  * Exit program
* If input is one:
  * Output 1 infinitely

## How to Run It?
Repo already includes an ELF 32-bit LSB executable which runs on linux. You can assemble it again using included makefile or link the compiled object file.
