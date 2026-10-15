; ---------------------------------------------------------------------------
; Magneto_SpawnBomb - special: create the flux bomb in the aim direction (strong above 7 health); fizzle sound if it cannot spawn
; In:  8(a6) = player
; Out: d0
; Evidence: Magneto_SpawnFluxBomb(x, y, +$BC, player, crouch, health > $700) -> +$BE; none -> sound $83, control; else bomb +$FE = 1 (held), follow-through anim, state Magneto_StateHoldBomb
; ---------------------------------------------------------------------------
Magneto_SpawnBomb:
	link.w	a6,#$0
	movem.l	d3/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$1000,d0
	and.w	$4(a4),d0
	beq.s	loc_1CE852
	clr.w	$6C(a4)
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	loc_1CE8F8
loc_1CE852:
	cmpi.w	#$701,$68(a4)
	sge.b	d3
	neg.b	d3
	ext.w	d3
	ext.l	d3
	move.l	d3,-(a7)
	move.w	$10(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.w	$BC(a4),d1
	ext.l	d1
	move.l	d1,-(a7)
	move.l	$C(a4),-(a7)
	move.l	$8(a4),-(a7)
	jsr	$3E52(a5)	; -> Magneto_SpawnFluxBomb
	move.l	d0,$BE(a4)
	lea.l	$18(a7),a7
	bne.s	loc_1CE8B2
	pea.l	($83).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($83).w
	jsr	$521A(a5)	; -> Snd_Play
	addq.w	#$8,a7
	clr.w	$6C(a4)
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_1CE8F8
loc_1CE8B2:
	movea.l	$BE(a4),a0
	move.b	#$1,$FE(a0)
	tst.w	$10(a4)
	beq.s	loc_1CE8CC
	lea.l	$46D2(a5),a0
	movea.l	$2(a0),a3
	bra.s	loc_1CE8DC
loc_1CE8CC:
	move.w	$BC(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	$3E42(a5)	; -> Magneto_ShotEndAnim
	movea.l	d0,a3
	addq.w	#$4,a7
loc_1CE8DC:
	move.l	a3,-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	Magneto_StateHoldBomb(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_1CE8F8:
	movem.l	-$C(a6),d3/a3-a4
	unlk	a6
	rts
