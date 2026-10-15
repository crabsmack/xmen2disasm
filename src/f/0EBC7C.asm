; ---------------------------------------------------------------------------
; CoreShields_FireZap - spawn a COREZAP 16 px left of and above the shields with the given x speed, sound $CD, start the zap lights
; In:  8(a6) = this  $E(a6) = word vx
; Out: d0 = zap or 0
; Evidence: class New via jt $2B12, +$16 = vx, Snd_Play($CD), $FFC6FE = 0 (SentinelsA1_StepZapLights)
; ---------------------------------------------------------------------------
CoreShields_FireZap:
	link.w	a6,#$0
	movem.l	d6-d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	move.l	$8(a3),d6
	add.l	#$FFFFF000,d6
	move.l	$C(a3),d7
	add.l	#$FFFFE600,d7
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d7,-(a7)
	move.l	d6,-(a7)
	lea.l	$2912(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d0,-(a7)
	lea.l	$2912(a5),a0
	movea.l	$2(a0),a0
	movea.l	$E(a0),a1
	jsr	(a1)
	movea.l	d0,a4
	move.l	a4,d0
	lea.l	$14(a7),a7
	beq.s	loc_0EBCE2
	move.w	$E(a6),$16(a4)
	pea.l	($CD).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($CD).w
	jsr	$521A(a5)	; -> Snd_Play
	clr.w	-$3B02(a5)
	addq.w	#$8,a7
loc_0EBCE2:
	move.l	a4,d0
	movem.l	-$10(a6),d6-d7/a3-a4
	unlk	a6
	rts
