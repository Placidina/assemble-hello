.PHONY: build

DEST := hello

build:
	@echo Building...
	@nasm -f elf64 -o obj/$(DEST).o src/main.asm
	@ld -nostartfiles -nostdlib -z noexecstack -m elf_x86_64 -s -o build/$(DEST) obj/$(DEST).o
	@strip -x -R .comment -R .note -R .note.ABI-tag -R .note.gnu.build-id -R .gnu.hash --strip-all build/$(DEST)
	@echo Done

clean:
	@echo Cleaning builds...
	@rm -rf build/*
	@echo Cleaning objects...
	@rm -rf obj/*
	@echo Done

run:
	@./build/$(DEST)