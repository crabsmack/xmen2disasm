; ---------------------------------------------------------------------------
; YoyoAcolyte_ThrowYoyo - YOYOACOLYTE slot +$82 (own virtual): throw the yoyo - frame 9, become hittable, set the yoyo's start offset and velocity for throw kind 0 level, 1 high arc, 2 low arc
; In:  8(a6) = this, $C(a6) = word kind
; Out: d0
; Evidence: tools/classes.py YOYOACOLYTE +$82; list $FFEBAE node +$84; yoyo offset +$A0/+$A4 (+/-$28 px, -$40 px), vx +$A8 = +/-$800 with decel +$AC; kind 1: vy -$300, ay $1A; kind 2: vy $200, ay -$11
; ---------------------------------------------------------------------------
YoyoAcolyte_ThrowYoyo:
	link.w	a6,#$0
	movem.l	d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	lea.l	$A0(a3),a4
	moveq	#$10,d7
	and.b	$2E(a3),d7
	moveq	#$0,d0
	move.l	d0,$44(a3)
	moveq	#$9,d0
	move.l	d0,-(a7)
	move.l	a3,-(a7)
	movea.l	(a3),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	pea.l	g_HitListEnemyBody(a5)
	move.l	a3,-(a7)
	jsr	$4062(a5)	; -> HitList_Add
	move.l	d0,$84(a3)
	andi.w	#$FFFD,$6(a3)
	move.w	#$1,$B4(a3)
	clr.w	$10(a4)
	move.w	#$2,$12(a4)
	tst.b	d7
	lea.l	$10(a7),a7
	beq.s	loc_01C5BC
	move.l	#$FFFFB800,(a4)
	move.w	#$F800,$8(a4)
	move.w	#$46,$C(a4)
	bra.s	loc_01C5CE
loc_01C5BC:
	move.l	#$2800,(a4)
	move.w	#$800,$8(a4)
	move.w	#$FFBA,$C(a4)
loc_01C5CE:
	move.l	#$FFFFC000,$4(a4)
	move.w	$E(a6),d0
	beq.s	loc_01C5E4
	subq.w	#$1,d0
	beq.s	loc_01C5EE
	subq.w	#$1,d0
	beq.s	loc_01C5FC
loc_01C5E4:
	clr.w	$A(a4)
	clr.w	$E(a4)
	bra.s	loc_01C608
loc_01C5EE:
	move.w	#$FD00,$A(a4)
	move.w	#$1A,$E(a4)
	bra.s	loc_01C608
loc_01C5FC:
	move.w	#$200,$A(a4)
	move.w	#$FFEF,$E(a4)
loc_01C608:
	movem.l	-$C(a6),d7/a3-a4
	unlk	a6
	rts
