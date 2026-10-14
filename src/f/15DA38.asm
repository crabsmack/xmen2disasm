; ---------------------------------------------------------------------------
; sub_15DA38	[jt 2048]
; ---------------------------------------------------------------------------
sub_15DA38:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$C(a6),a3
	jsr	$4DCA(a5)	; -> sub_1F4A1A
	movea.l	d0,a4
	move.l	a4,d0
	beq.s	loc_15DA84
	move.l	a3,(a4)
	move.l	$18(a6),-(a7)
	move.l	$14(a6),-(a7)
	move.l	$10(a6),-(a7)
	move.l	a4,-(a7)
	movea.l	a3,a0
	movea.l	$12(a0),a1
	jsr	(a1)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$3A(a0),a1
	jsr	(a1)
	tst.b	d0
	lea.l	$14(a7),a7
	beq.s	loc_15DA84
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$3E(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
loc_15DA84:
	move.l	a4,d0
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
