; Vector table
Vectors:
	dc.l	$00FFC518	;  0 initial SSP
	dc.l	EntryPoint	;  1 reset
	dc.l	JumpTable	;  2 bus error
	dc.l	JumpTable	;  3 address error
	dc.l	JumpTable	;  4 illegal
	dc.l	JumpTable	;  5
	dc.l	JumpTable	;  6
	dc.l	JumpTable	;  7
	dc.l	JumpTable	;  8
	dc.l	JumpTable	;  9
	dc.l	JumpTable	; 10
	dc.l	JumpTable	; 11
	dc.l	JumpTable	; 12
	dc.l	JumpTable	; 13
	dc.l	JumpTable	; 14
	dc.l	JumpTable	; 15
	dc.l	JumpTable	; 16
	dc.l	JumpTable	; 17
	dc.l	JumpTable	; 18
	dc.l	JumpTable	; 19
	dc.l	JumpTable	; 20
	dc.l	JumpTable	; 21
	dc.l	JumpTable	; 22
	dc.l	JumpTable	; 23
	dc.l	JumpTable	; 24 spurious
	dc.l	JumpTable	; 25
	dc.l	JumpTable	; 26
	dc.l	JumpTable	; 27
	dc.l	Irq_HBlankVector	; 28 IRQ4 / H-int
	dc.l	JumpTable	; 29
	dc.l	Irq_VBlankVector	; 30 IRQ6 / V-int
	dc.l	JumpTable	; 31
	dc.l	JumpTable	; 32
	dc.l	JumpTable	; 33
	dc.l	JumpTable	; 34
	dc.l	JumpTable	; 35
	dc.l	JumpTable	; 36
	dc.l	JumpTable	; 37
	dc.l	JumpTable	; 38
	dc.l	JumpTable	; 39
	dc.l	JumpTable	; 40
	dc.l	JumpTable	; 41
	dc.l	JumpTable	; 42
	dc.l	JumpTable	; 43
	dc.l	JumpTable	; 44
	dc.l	JumpTable	; 45
	dc.l	JumpTable	; 46
	dc.l	JumpTable	; 47
	dc.l	$00000000	; 48
	dc.l	$00000000	; 49
	dc.l	$00000000	; 50
	dc.l	$00000000	; 51
	dc.l	$00000000	; 52
	dc.l	$00000000	; 53
	dc.l	$00000000	; 54
	dc.l	$00000000	; 55
	dc.l	$00000000	; 56
	dc.l	$00000000	; 57
	dc.l	$00000000	; 58
	dc.l	$00000000	; 59
	dc.l	$00000000	; 60
	dc.l	$00000000	; 61
	dc.l	$00000000	; 62
	dc.l	$00000000	; 63

; ROM header
Header:
	dc.b	"SEGA GENESIS    "	; system type
	dc.b	"(C)SEGA 1994.DEC"	; copyright
	dc.b	"X-MEN 2                                         "	; domestic name
	dc.b	"X-MEN 2                                         "	; overseas name
	dc.b	"GM MK-1550 -00"	; serial / version
	dc.w	$A1A3	; checksum
	dc.b	"J               "	; I/O support
	dc.l	$00000000,$001FFFFF	; ROM start/end
	dc.l	$00FF0000,$00FFFFFF	; RAM start/end
	dc.b	"            "	; SRAM info
	dc.b	"            "	; modem info
	dc.b	"                                        "	; notes
	dc.b	"JEU             "	; regions

; $200: A5-world application parameters; $210-$21C are the interrupt hook
; pointers read by the vector stubs (`movea.l $214.w,a0 / jsr (a0)`).
A5Params:
	dc.l	sub_005458	; $200
	dc.l	$001FFED4	; $204
	dc.l	$00FFC518	; $208
	dc.l	$00000000	; $20C
	dc.l	Irq_VBlank	; $210
	dc.l	Irq_HBlank	; $214
	dc.l	$00000000	; $218
	dc.l	sub_005466	; $21C
