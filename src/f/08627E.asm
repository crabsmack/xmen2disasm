; ---------------------------------------------------------------------------
; sub_08627E	[jt 622]
; ---------------------------------------------------------------------------
sub_08627E:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.b	$2F(a4),d0
	cmp.w	-$3B10(a5),d0
	beq.s	loc_0862A0
	andi.b	#$DF,$2E(a4)
	move.b	-$3B0F(a5),$2F(a4)
loc_0862A0:
	moveq	#$0,d0
	move.b	$2F(a4),d0
	cmpi.w	#$FF,d0
	beq.s	loc_0862C2
	move.l	a4,-(a7)
	lea.l	$14FA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$1A(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
loc_0862C2:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
