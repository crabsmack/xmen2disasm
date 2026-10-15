; ---------------------------------------------------------------------------
; Beast_StateRollEnd - roll finished: uncurl (frame $83 on the ground, $D in the air)
; In:  8(a6) = player
; Out: d0
; Evidence: Snd_Stop $92; grounded -> Beast_SetFrameKeepCenterX($83), control; airborne and anim done -> Beast_SetFrameKeepCenter($D), +$6E = 6, Beast_StateRollRecover
; ---------------------------------------------------------------------------
Beast_StateRollEnd:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	pea.l	($92).w
	jsr	$5222(a5)	; -> Snd_Stop
	move.w	#$1000,d0
	and.w	$4(a4),d0
	addq.w	#$4,a7
	beq.s	loc_183916
	tst.l	$44(a4)
	bne.s	loc_183902
	moveq	#$D,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	Beast_SetFrameKeepCenter(pc)
	move.w	#$6,$6E(a4)
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	Beast_StateRollRecover(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_183934
loc_183902:
	clr.w	$6C(a4)
	lea.l	Beast_StateRollEnd(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_183934
loc_183916:
	pea.l	($83).w
	move.l	a4,-(a7)
	jsr	Beast_SetFrameKeepCenterX(pc)
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	move.l	a4,-(a7)
	movea.l	$A6(a0),a1
	jsr	(a1)
	lea.l	$C(a7),a7
loc_183934:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
