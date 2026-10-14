; ---------------------------------------------------------------------------
; sub_1FB178	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1FB178:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$C(a6),a4
	move.w	-$CA8(a5),d0
	ext.l	d0
	lsl.l	#$8,d0
	add.l	d0,$8(a4)
	move.w	-$CAA(a5),d0
	ext.l	d0
	lsl.l	#$8,d0
	add.l	d0,$C(a4)
	move.l	a4,-(a7)
	jsr	$4DD2(a5)	; -> sub_1F4A40
	moveq	#$0,d0
	move.b	$3B(a4),d0
	cmpi.w	#$FF,d0
	addq.w	#$4,a7
	beq.s	loc_1FB1BA
	pea.l	sub_1FB178(pc)
	move.l	a4,-(a7)
	jsr	$4E82(a5)	; -> sub_1F669A
	addq.w	#$8,a7
loc_1FB1BA:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
