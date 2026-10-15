; ---------------------------------------------------------------------------
; sub_098C4E	[jt 790]
; ---------------------------------------------------------------------------
sub_098C4E:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	$4E7A(a5)	; -> sub_1F6530
	move.w	#$FD00,$18(a4)
	move.w	#$3F,$20(a4)
	move.w	#$396,$22(a4)
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_098C80
	move.l	#$FFFFFC6A,d0
	bra.s	loc_098C86
loc_098C80:
	move.l	#$396,d0
loc_098C86:
	move.w	d0,$16(a4)
	addq.w	#$4,a7
	pea.l	($88).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($88).w
	jsr	$521A(a5)	; -> Snd_Play
	lea.l	$43A2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	lea.l	$10(a7),a7
	clr.w	$6C(a4)
	lea.l	sub_098BBE(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
