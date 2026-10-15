; ---------------------------------------------------------------------------
; Debris_SetBounceLimit - set how many floor bounces a debris piece survives
; In:  8(a6) = pool  $E(a6) = word bounces (min 1)
; Out: none
; Evidence: pool +$A = (n-1)*3 (each bounce adds 3 to a piece's +$11); callers Debris_CreatePool (4), BroodBoss_Init (jt 1895)
; ---------------------------------------------------------------------------
Debris_SetBounceLimit:
	link.w	a6,#$0
	movem.l	d3/d7,-(a7)
	move.w	$E(a6),d7
	cmpi.w	#$1,d7
	slt.b	d3
	neg.b	d3
	beq.s	loc_13F4B2
	moveq	#$1,d0
	bra.s	loc_13F4B4
loc_13F4B2:
	move.w	d7,d0
loc_13F4B4:
	move.w	d0,d7
	ext.l	d7
	move.l	d7,d0
	subq.l	#$1,d0
	move.l	d0,d1
	add.l	d0,d0
	add.l	d1,d0
	movea.l	$8(a6),a0
	move.b	d0,$A(a0)
	movem.l	-$8(a6),d3/d7
	unlk	a6
	rts
