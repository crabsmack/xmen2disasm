; ---------------------------------------------------------------------------
; sub_1FE528
; ---------------------------------------------------------------------------
sub_1FE528:
	jsr	Z80_BusAcquire(pc)
	move.l	$8(a6),d0
	jsr	sub_1FE50A(pc)
	asr.l	#$8,d0
	jsr	sub_1FE50A(pc)
	asr.l	#$8,d0
	jsr	sub_1FE50A(pc)
	jmp	Z80_BusRelease(pc)
