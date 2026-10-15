; ---------------------------------------------------------------------------
; sub_1975E6	[jt 2171]
; ---------------------------------------------------------------------------
sub_1975E6:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_197600
	move.l	#$FFFFF9BC,d0
	bra.s	loc_197606
loc_197600:
	move.l	#$644,d0
loc_197606:
	move.w	d0,$16(a4)
	clr.w	$1E(a4)
	move.w	#$644,$22(a4)
	cmpi.w	#$701,$68(a4)
	blt.s	loc_197640
	pea.l	($8A).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($8A).w
	jsr	$521A(a5)	; -> Snd_Play
	lea.l	$43CA(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	lea.l	$10(a7),a7
	bra.s	loc_197662
loc_197640:
	pea.l	($88).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($88).w
	jsr	$521A(a5)	; -> Snd_Play
	lea.l	$43C2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	lea.l	$10(a7),a7
loc_197662:
	clr.w	$6C(a4)
	lea.l	sub_1974EE(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
