; ---------------------------------------------------------------------------
; FarAcolyte_OutsideActiveWindow - vtable +$42: a FARACOLYTE is outside the active window
; In:  8(a6) = this (FARACOLYTE object)
; Out: none
; Evidence: class descriptor FARACOLYTE slot +$42 (tools/classes.py); TAS frames 10708-12963 (463 active)
; ---------------------------------------------------------------------------
FarAcolyte_OutsideActiveWindow:
	link.w	a6,#$FFF6
	movem.l	d3-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$8(a4),d6
	asr.l	#$8,d6
	move.l	$C(a4),d7
	asr.l	#$8,d7
	moveq	#$5,d0
	and.w	$92(a4),d0
	bne.s	loc_0173C8
	move.l	a4,-(a7)
	lea.l	$33A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$42(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.w	loc_0174FC
loc_0173C8:
	move.w	$92(a4),d0
	btst	#$0,d0
	beq.s	loc_0173E8
	move.l	$94(a4),d0
	asr.l	#$8,d0
	move.w	d0,-$6(a6)
	move.l	$98(a4),d0
	asr.l	#$8,d0
	move.w	d0,-$4(a6)
	bra.s	loc_0173F0
loc_0173E8:
	move.w	d6,-$6(a6)
	move.w	d7,-$4(a6)
loc_0173F0:
	moveq	#$4,d0
	and.w	$92(a4),d0
	beq.s	loc_01740E
	move.l	$A4(a4),d0
	asr.l	#$8,d0
	move.w	d0,-$A(a6)
	move.l	$A8(a4),d0
	asr.l	#$8,d0
	move.w	d0,-$8(a6)
	bra.s	loc_017416
loc_01740E:
	move.w	d6,-$A(a6)
	move.w	d7,-$8(a6)
loc_017416:
	move.w	-$A(a6),d0
	cmp.w	-$6(a6),d0
	slt.b	d3
	neg.b	d3
	beq.s	loc_01742A
	move.w	-$A(a6),d0
	bra.s	loc_01742E
loc_01742A:
	move.w	-$6(a6),d0
loc_01742E:
	move.w	d0,d4
	cmp.w	d4,d6
	sgt.b	d3
	neg.b	d3
	beq.s	loc_01743C
	move.w	d4,d0
	bra.s	loc_01743E
loc_01743C:
	move.w	d6,d0
loc_01743E:
	move.w	d0,d4
	move.w	-$A(a6),d0
	cmp.w	-$6(a6),d0
	sgt.b	d3
	neg.b	d3
	beq.s	loc_017454
	move.w	-$A(a6),d0
	bra.s	loc_017458
loc_017454:
	move.w	-$6(a6),d0
loc_017458:
	move.w	d0,d5
	cmp.w	d5,d6
	slt.b	d3
	neg.b	d3
	beq.s	loc_017466
	move.w	d5,d0
	bra.s	loc_017468
loc_017466:
	move.w	d6,d0
loc_017468:
	move.w	d0,d5
	move.w	-$8(a6),d0
	cmp.w	-$4(a6),d0
	slt.b	d3
	neg.b	d3
	beq.s	loc_01747E
	move.w	-$8(a6),d0
	bra.s	loc_017482
loc_01747E:
	move.w	-$4(a6),d0
loc_017482:
	move.w	d0,-$2(a6)
	cmp.w	-$2(a6),d7
	sgt.b	d3
	neg.b	d3
	beq.s	loc_017496
	move.w	-$2(a6),d0
	bra.s	loc_017498
loc_017496:
	move.w	d7,d0
loc_017498:
	move.w	d0,-$2(a6)
	move.w	-$8(a6),d0
	cmp.w	-$4(a6),d0
	sgt.b	d3
	neg.b	d3
	beq.s	loc_0174B0
	move.w	-$8(a6),d0
	bra.s	loc_0174B4
loc_0174B0:
	move.w	-$4(a6),d0
loc_0174B4:
	move.w	d0,d6
	cmp.w	d6,d7
	slt.b	d3
	neg.b	d3
	beq.s	loc_0174C2
	move.w	d6,d0
	bra.s	loc_0174C4
loc_0174C2:
	move.w	d7,d0
loc_0174C4:
	move.w	d0,d6
	sub.w	g_CameraX(a5),d4
	sub.w	g_CameraX(a5),d5
	move.w	g_CameraY(a5),d0
	sub.w	d0,-$2(a6)
	sub.w	g_CameraY(a5),d6
	cmp.w	-$35C2(a5),d4
	bgt.s	loc_0174FA
	cmp.w	-$35C0(a5),d5
	blt.s	loc_0174FA
	move.w	-$2(a6),d0
	cmp.w	-$35C6(a5),d0
	bgt.s	loc_0174FA
	cmp.w	-$35C4(a5),d6
	blt.s	loc_0174FA
	moveq	#$0,d0
	bra.s	loc_0174FC
loc_0174FA:
	moveq	#$1,d0
loc_0174FC:
	movem.l	-$22(a6),d3-d7/a4
	unlk	a6
	rts
