; ---------------------------------------------------------------------------
; SwampFly_SpawnRecInView - vtable +$2A: in phase 0 the normal window test; later phases spawn a fly only off screen and only if its record's phase (+$E) is below the current phase
; Evidence: phase -$3C1C (SavageJungle_PalPhaseUpdate); TAS 27889-30595
; ---------------------------------------------------------------------------
SwampFly_SpawnRecInView:
	link.w	a6,#$0
	movem.l	d3/a3-a4,-(a7)
	movea.l	$8(a6),a3
	movea.l	$C(a6),a4
	tst.w	g_JunglePalPhase(a5)
	beq.s	loc_0BFA68
	moveq	#$0,d3
	movea.l	$A(a4),a0
	move.w	$E(a0),d0
	cmp.w	g_JunglePalPhase(a5),d0
	bge.s	loc_0BFA64
	move.w	$6(a4),d0
	cmp.w	g_CameraX(a5),d0
	blt.s	loc_0BFA50
	move.w	g_CameraX(a5),d0
	ext.l	d0
	add.l	#$140,d0
	move.w	$6(a4),d1
	ext.l	d1
	cmp.l	d1,d0
	blt.s	loc_0BFA50
	move.w	$8(a4),d0
	cmp.w	g_CameraY(a5),d0
	blt.s	loc_0BFA50
	move.w	g_CameraY(a5),d0
	ext.l	d0
	add.l	#$C8,d0
	move.w	$8(a4),d1
	ext.l	d1
	cmp.l	d1,d0
	bge.s	loc_0BFA64
loc_0BFA50:
	move.l	d3,-(a7)
	move.l	a4,-(a7)
	move.l	a3,-(a7)
	jsr	$402A(a5)	; -> Actor_SpawnRecInView
	addq.l	#$8,a7
	move.l	(a7)+,d3
	tst.b	d0
	beq.s	loc_0BFA64
	moveq	#$1,d3
loc_0BFA64:
	move.b	d3,d0
	bra.s	loc_0BFA72
loc_0BFA68:
	move.l	a4,-(a7)
	move.l	a3,-(a7)
	jsr	$402A(a5)	; -> Actor_SpawnRecInView
	addq.w	#$8,a7
loc_0BFA72:
	movem.l	-$C(a6),d3/a3-a4
	unlk	a6
	rts
