; ---------------------------------------------------------------------------
; sub_0389B6	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0389B6:
	link.w	a6,#$0
	movem.l	d3/d7,-(a7)
	tst.b	-$38DE(a5)
	beq.s	loc_0389C8
	moveq	#$2,d0
	bra.s	loc_0389CA
loc_0389C8:
	moveq	#$1,d0
loc_0389CA:
	move.w	d0,d7
loc_0389CC:
	move.l	-$35A2(a5),d0
	addq.l	#$1,-$35A2(a5)
	tst.w	-$3C94(a5)
	beq.s	loc_0389E2
	move.w	-$3C94(a5),d0
	subq.w	#$1,-$3C94(a5)
loc_0389E2:
	moveq	#$7,d0
	and.l	-$35A2(a5),d0
	bne.s	loc_038A58
	move.l	-$35A2(a5),d0
	lsr.l	#$3,d0
	moveq	#$7,d1
	and.l	d0,d1
	add.l	d1,d1
	move.w	$389FE(pc,d1.l),d1
	jmp	$389FC(pc,d1.w)
