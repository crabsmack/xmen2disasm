; ---------------------------------------------------------------------------
; Tank_Deactivate - TANK slot +$46: kill its live rocket, then the parent Deactivate
; In:  8(a6) = this
; Out: none
; Evidence: +$A2 object -> vtable +$52 Kill, +$A2 = 0; XNPC +$46
; ---------------------------------------------------------------------------
Tank_Deactivate:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.l	$A2(a4)
	beq.s	loc_1419C2
	movea.l	$A2(a4),a0
	move.l	a0,-(a7)
	movea.l	(a0),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	moveq	#$0,d0
	move.l	d0,$A2(a4)
	addq.w	#$4,a7
loc_1419C2:
	move.l	a4,-(a7)
	lea.l	$3C4A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$46(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	movea.l	-$4(a6),a4
	unlk	a6
	rts
