; ---------------------------------------------------------------------------
; sub_1FE5DC
; ---------------------------------------------------------------------------
sub_1FE5DC:
	jsr	Z80_BusAcquire(pc)
	tst.b	-$18AC(a5)
	bne.w	Z80_BusRelease
	moveq	#$D,d0
	jsr	sub_1FE4FE(pc)
	jmp	Z80_BusRelease(pc)
