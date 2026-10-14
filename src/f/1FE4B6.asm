; ---------------------------------------------------------------------------
; sub_1FE4B6
; ---------------------------------------------------------------------------
sub_1FE4B6:
	movea.l	(a7)+,a0
	link.w	a6,#$0
	movem.l	d1/a1,-(a7)
	move.w	sr,-(a7)
	move.l	a0,-(a7)
	lea.l	($A00036).l,a0
	lea.l	($A01B40).l,a1
	ori.w	#$700,sr
	move.w	#$100,($A11100).l
loc_1FE4DC:
	btst	#$0,($A11100).l
	bne.s	loc_1FE4DC
	move.b	(a0),d1
	ext.w	d1
	rts
loc_1FE4EC:
	move.w	#$0,($A11100).l
	move.w	(a7)+,sr
	movem.l	(a7)+,d1/a1
	unlk	a6
	rts
