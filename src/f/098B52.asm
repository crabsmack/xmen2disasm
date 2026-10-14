; ---------------------------------------------------------------------------
; sub_098B52	[jt 789]
; ---------------------------------------------------------------------------
sub_098B52:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$14(a6),-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$1942(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	lea.l	$4442(a5),a0
	move.l	$2(a0),$30(a4)
	lea.l	$1A0A(a5),a0
	move.l	$2(a0),$A8(a4)
	lea.l	$43D2(a5),a0
	move.l	$2(a0),$AC(a4)
	movea.l	$A8(a4),a0
	movea.l	a0,a1
	adda.w	$8(a1),a0
	move.l	a0,-(a7)
	pea.l	$96(a4)
	jsr	$3ED2(a5)	; -> sub_15A6DE
	moveq	#$1,d0
	move.l	d0,-(a7)
	jsr	sub_099C36(pc)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
