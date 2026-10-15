; ---------------------------------------------------------------------------
; Tuskette_StateExitWalk - TUSKETTE: walk 100 px off Tusk's platform
; In:  8(a6) = this
; Out: d0
; Evidence: next Tuskette_StateExitDrop
; ---------------------------------------------------------------------------
Tuskette_StateExitWalk:
	link.w	a6,#$0
	movem.l	d3/d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$10(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	$8(a4),d7
	sub.l	d0,d7
	tst.l	d7
	sge.b	d3
	neg.b	d3
	beq.s	loc_05DABE
	move.l	d7,d0
	bra.s	loc_05DAC2
loc_05DABE:
	move.l	d7,d0
	neg.l	d0
loc_05DAC2:
	cmpi.l	#$6400,d0
	ble.s	loc_05DAE4
	clr.w	$1E(a4)
	clr.w	$16(a4)
	clr.w	$6C(a4)
	lea.l	Tuskette_StateExitDrop(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_05DAE4:
	movem.l	-$C(a6),d3/d7/a4
	unlk	a6
	rts
