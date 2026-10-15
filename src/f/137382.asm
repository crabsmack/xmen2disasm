; ---------------------------------------------------------------------------
; HornetBullet_Init - HornetBullet: constructor: chain to the parent Init, then set this class's fields (class slot 3, +$12)
; In:  8(a6) = this  $C/$10(a6) = x, y (16.16)  $14(a6) = spawn record or 0
; Out: none
; Evidence: method 3 of class descriptor $137708 (name string "HORNETBULLET", parent ACTOR)
; ---------------------------------------------------------------------------
HornetBullet_Init:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$14(a6),-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$387A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	move.w	g_HornetBulletSprDef(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E5A(a5)	; -> Obj_SetSpriteDef
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$1,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
	move.b	#$1,$70(a4)
	ori.w	#$4082,$6(a4)
	move.w	g_Player1+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_137410
	moveq	#$4,d0
	and.b	g_Player1+$2E(a5),d0
	beq.s	loc_137408
	ori.b	#$4,$2E(a4)
	bra.s	loc_137456
loc_137408:
	andi.b	#$FB,$2E(a4)
	bra.s	loc_137456
loc_137410:
	move.w	g_Player2+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_137440
	moveq	#$4,d0
	and.b	g_Player2+$2E(a5),d0
	beq.s	loc_137438
	ori.b	#$4,$2E(a4)
	bra.s	loc_137456
loc_137438:
	andi.b	#$FB,$2E(a4)
	bra.s	loc_137456
loc_137440:
	moveq	#$4,d0
	and.b	g_Player1+$2E(a5),d0
	beq.s	loc_137450
	ori.b	#$4,$2E(a4)
	bra.s	loc_137456
loc_137450:
	andi.b	#$FB,$2E(a4)
loc_137456:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
