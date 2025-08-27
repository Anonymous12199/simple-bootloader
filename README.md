# bootloader-exploit

## Stage 1 Bootloader

The first stage is a 512-byte boot sector that runs in 16‑bit real mode.
It sets up a stack, records the boot drive, and uses BIOS interrupt
`0x13` with the extended disk read function (`AH=0x42`) to load the next
four sectors from disk into memory at `0x8000`. After a successful read,
execution jumps to that address. If the disk read fails, it prints the
message "Error loading kernel" using BIOS teletype services before
halting.

## Stage 2 Bootloader

The second stage, loaded at `0x8000`, sets the data segment to zero and
prints "Hello World" character by character through BIOS interrupt
`0x10` (`AH=0x0e`). Once the message finishes, it disables interrupts and
halts the CPU.
