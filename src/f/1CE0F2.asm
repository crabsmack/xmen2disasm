; ---------------------------------------------------------------------------
; Magneto_AirAttack - MAGNETO slot +$C2: B in the air: shoot forward, diagonally up (Up) or down (Down)
; In:  8(a6) = player
; Out: none
; Evidence: +$BC = Up 6/3, Down 8/1, else 7/2 (right/left facing); Magneto_StartAirShot
; ---------------------------------------------------------------------------
Magneto_AirAttack:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1CE112
	move.w	g_PadMaskUp(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1CE11A
loc_1CE112:
	move.w	g_PadMaskUp(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1CE11A:
	beq.s	loc_1CE134
	moveq	#$10,d0
	and.b	$2E(a4),d0
	bne.s	loc_1CE12C
	move.w	#$6,$BC(a4)
	bra.s	loc_1CE180
loc_1CE12C:
	move.w	#$3,$BC(a4)
	bra.s	loc_1CE180
loc_1CE134:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1CE148
	move.w	g_PadMaskDown(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1CE150
loc_1CE148:
	move.w	g_PadMaskDown(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1CE150:
	beq.s	loc_1CE16A
	moveq	#$10,d0
	and.b	$2E(a4),d0
	bne.s	loc_1CE162
	move.w	#$8,$BC(a4)
	bra.s	loc_1CE180
loc_1CE162:
	move.w	#$1,$BC(a4)
	bra.s	loc_1CE180
loc_1CE16A:
	moveq	#$10,d0
	and.b	$2E(a4),d0
	bne.s	loc_1CE17A
	move.w	#$7,$BC(a4)
	bra.s	loc_1CE180
loc_1CE17A:
	move.w	#$2,$BC(a4)
loc_1CE180:
	lea.l	Magneto_StartAirShot(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	Magneto_StartAirShot(pc)
	addq.w	#$4,a7
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
