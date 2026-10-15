; ---------------------------------------------------------------------------
; Player_SetCharacter - set a player object's character class (vtable) and place it near the other player or the camera
; In:  8(a6) = class vtable, $C(a6) = player object (g_Player1/g_Player2)
; Out: none
; Evidence: position: own x/y if alive (after vtable $52), else partner's, else camera -$348E/-$3490 + ($A0,$6E); if -$38BE: vtable $12 (set position), health +$68 = $700, vtable $3E; +$9D = 0 for g_Player1, 1 for g_Player2
; ---------------------------------------------------------------------------
Player_SetCharacter:
	link.w	a6,#$0
	movem.l	d3/d6-d7/a3-a4,-(a7)
	movea.l	$C(a6),a4
	lea.l	g_Player1(a5),a0
	cmpa.l	a4,a0
	seq.b	d3
	neg.b	d3
	beq.s	loc_005FC2
	lea.l	g_Player2(a5),a0
	move.l	a0,d0
	bra.s	loc_005FC8
loc_005FC2:
	lea.l	g_Player1(a5),a0
	move.l	a0,d0
loc_005FC8:
	movea.l	d0,a3
	move.w	$4(a4),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_005FFC
	move.l	$8(a4),d6
	move.l	$C(a4),d7
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	move.l	$8(a6),(a4)
	addq.w	#$4,a7
	bra.s	loc_006040
loc_005FFC:
	move.l	$8(a6),(a4)
	move.w	$4(a3),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_006022
	move.l	$8(a3),d6
	move.l	$C(a3),d7
	bra.s	loc_006040
loc_006022:
	move.w	-$348E(a5),d0
	ext.l	d0
	add.l	#$A0,d0
	move.l	d0,d6
	lsl.l	#$8,d6
	move.w	-$3490(a5),d0
	ext.l	d0
	moveq	#$6E,d1
	add.l	d1,d0
	move.l	d0,d7
	lsl.l	#$8,d7
loc_006040:
	tst.b	-$38BE(a5)
	beq.s	loc_006092
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d7,-(a7)
	move.l	d6,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	move.w	#$700,$68(a4)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$3E(a0),a1
	jsr	(a1)
	move.w	$4(a3),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	lea.l	$14(a7),a7
	bne.s	loc_006092
	moveq	#$4,d0
	and.b	$2E(a3),d0
	beq.s	loc_006092
	ori.b	#$4,$2E(a4)
loc_006092:
	lea.l	g_Player1(a5),a0
	cmpa.l	a4,a0
	bne.s	loc_0060A0
	clr.b	$9D(a4)
	bra.s	loc_0060A6
loc_0060A0:
	move.b	#$1,$9D(a4)
loc_0060A6:
	movem.l	-$14(a6),d3/d6-d7/a3-a4
	unlk	a6
	rts
