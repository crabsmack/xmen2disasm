; ---------------------------------------------------------------------------
; sub_1FE5C6
; ---------------------------------------------------------------------------
sub_1FE5C6:
	jsr	Z80_BusAcquire(pc)
	tst.b	-$18AC(a5)
	bne.w	Z80_BusRelease
	moveq	#$C,d0
	jsr	sub_1FE4FE(pc)
	jmp	Z80_BusRelease(pc)
