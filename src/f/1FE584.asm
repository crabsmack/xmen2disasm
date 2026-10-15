; ---------------------------------------------------------------------------
; sub_1FE584
; ---------------------------------------------------------------------------
sub_1FE584:
	jsr	Z80_BusAcquire(pc)
	tst.b	-$18AC(a5)
	bne.w	Z80_BusRelease
	moveq	#$10,d0
loc_1FE592:
	jsr	sub_1FE4FE(pc)
	move.l	$8(a6),d0
	jsr	sub_1FE50A(pc)
	jmp	Z80_BusRelease(pc)
