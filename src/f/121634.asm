; ---------------------------------------------------------------------------
; sub_121634	[link-after-rts]
; ---------------------------------------------------------------------------
sub_121634:
	link.w	a6,#$0
	tst.w	-$1A92(a5)
	beq.s	loc_12165E
	moveq	#$10,d0
	move.l	d0,-(a7)
	subq.w	#$1,-$1A92(a5)
	move.w	-$1A92(a5),d1
	ext.l	d1
	movea.l	-$1A90(a5),a0
	asl.l	#$4,d1
	pea.l	(a0,d1.l)
	move.l	$8(a6),-(a7)
	jsr	$4DAA(a5)	; -> Mem_Copy
loc_12165E:
	unlk	a6
	rts
