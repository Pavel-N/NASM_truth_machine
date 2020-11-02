build:
	@nasm -f elf truth_machine.asm
	@ld -m elf_i386 truth_machine.o -o truth_machine
	@rm truth_machine.o
	./truth_machine

