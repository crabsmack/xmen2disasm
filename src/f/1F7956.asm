; ---------------------------------------------------------------------------
; sub_1F7956	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1F7956:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$C(a6),a4
	movea.l	$8(a6),a0
	move.b	$42(a0),$42(a4)
	moveq	#$0,d0
	move.b	$3B(a4),d0
	cmpi.w	#$FF,d0
	beq.s	loc_1F7982
	pea.l	sub_1F7956(pc)
	move.l	a4,-(a7)
	jsr	$4E82(a5)	; -> sub_1F669A
	addq.w	#$8,a7
loc_1F7982:
	moveq	#$0,d0
	move.b	$7A(a4),d0
	cmpi.w	#$FF,d0
	beq.s	loc_1F799A
	pea.l	sub_1F7940(pc)
	move.l	a4,-(a7)
	jsr	sub_1F7D5E(pc)
	addq.w	#$8,a7
loc_1F799A:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
