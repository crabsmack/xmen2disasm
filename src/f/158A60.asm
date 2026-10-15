; ---------------------------------------------------------------------------
; FluxBomb_Update - FLUXBOMB slot +$4A: step the particle phase (twice in two-player mode), then the parent Update
; In:  8(a6) = bomb
; Out: none
; Evidence: +$100 == 1 -> FluxBomb_StepImplode, 3 -> FluxBomb_StepBurst; RTHETAOBJECT +$4A
; ---------------------------------------------------------------------------
FluxBomb_Update:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.b	g_TwoPlayerStep(a5),d0
	move.w	d0,d7
	addq.w	#$1,d7
	bra.s	loc_158A98
loc_158A78:
	move.b	$100(a4),d0
	subq.b	#$1,d0
	beq.s	loc_158A86
	subq.b	#$2,d0
	beq.s	loc_158A90
	bra.s	loc_158A98
loc_158A86:
	move.l	a4,-(a7)
	jsr	FluxBomb_StepImplode(pc)
	addq.w	#$4,a7
	bra.s	loc_158A98
loc_158A90:
	move.l	a4,-(a7)
	jsr	FluxBomb_StepBurst(pc)
	addq.w	#$4,a7
loc_158A98:
	move.w	d7,d0
	subq.w	#$1,d7
	tst.w	d0
	bne.s	loc_158A78
	move.l	a4,-(a7)
	lea.l	$3E62(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$4A(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
