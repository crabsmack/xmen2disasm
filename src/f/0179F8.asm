; ---------------------------------------------------------------------------
; FarAcolyte_StartBolt - FARACOLYTE slot +$76: launch the bolt from its hand (+/-3, -32) towards the orb
; In:  8(a6) = this
; Out: none
; Evidence: bolt x/y +$A4/+$A8, velocity +$AC/+$AE = (orb - bolt) / 16, frame +$B0 = 0, timer +$B2 = 4, flags +$92 |= 4; called by FarAcolyte_StateCast
; ---------------------------------------------------------------------------
FarAcolyte_StartBolt:
	link.w	a6,#$FFFC
	movem.l	d3/a3-a4,-(a7)
	movea.l	$8(a6),a3
	lea.l	$A4(a3),a4
	lea.l	$94(a3),a0
	move.l	a0,-$4(a6)
	moveq	#$10,d0
	and.b	$2E(a3),d0
	seq.b	d3
	neg.b	d3
	beq.s	loc_017A20
	moveq	#$3,d0
	bra.s	loc_017A22
loc_017A20:
	moveq	#-$3,d0
loc_017A22:
	lsl.l	#$8,d0
	add.l	$8(a3),d0
	move.l	d0,(a4)
	move.l	$C(a3),d0
	add.l	#$FFFFE000,d0
	move.l	d0,$4(a4)
	movea.l	-$4(a6),a0
	move.l	(a0),d0
	sub.l	(a4),d0
	asr.l	#$4,d0
	move.w	d0,$8(a4)
	movea.l	-$4(a6),a0
	move.l	$4(a0),d0
	sub.l	$4(a4),d0
	asr.l	#$4,d0
	move.w	d0,$A(a4)
	clr.w	$C(a4)
	move.w	#$4,$E(a4)
	ori.w	#$4,$92(a3)
	movem.l	-$10(a6),d3/a3-a4
	unlk	a6
	rts
