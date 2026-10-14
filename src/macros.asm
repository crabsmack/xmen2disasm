; Raw, not-yet-explored ROM bytes. Replace with real code/data as it is understood.
incrom macro start,len
	binclude "xmen2.bin",start,len
	endm

; One A5 jump-table entry. `jsr d(a5)` with d = $22 + 8*index lands on the jmp.
; The leading `bra.s *` word is the Mac segment-loader placeholder.
jtentry macro target
	dc.w	$60FE
	jmp	(target).l
	endm
