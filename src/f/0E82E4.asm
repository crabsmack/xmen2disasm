; ---------------------------------------------------------------------------
; HoloBolt_Init - HoloBolt: constructor: chain to the parent Init, then set this class's fields (class slot 3, +$12)
; In:  8(a6) = this  $C/$10(a6) = x, y (16.16)  $14(a6) = spawn record or 0
; Out: none
; Evidence: method 3 of class descriptor $0E83AC (name string "HOLOBOLT", parent ACTOR)
; ---------------------------------------------------------------------------
HoloBolt_Init:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$14(a6),-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$271A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	ori.w	#$5082,$6(a4)
	move.w	g_HoloBoltSprDef(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E5A(a5)	; -> Obj_SetSpriteDef
	move.w	g_Player1+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_0E8352
	moveq	#$4,d0
	and.b	g_Player1+$2E(a5),d0
	beq.s	loc_0E834A
	ori.b	#$4,$2E(a4)
	bra.s	loc_0E8398
loc_0E834A:
	andi.b	#$FB,$2E(a4)
	bra.s	loc_0E8398
loc_0E8352:
	move.w	g_Player2+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_0E8382
	moveq	#$4,d0
	and.b	g_Player2+$2E(a5),d0
	beq.s	loc_0E837A
	ori.b	#$4,$2E(a4)
	bra.s	loc_0E8398
loc_0E837A:
	andi.b	#$FB,$2E(a4)
	bra.s	loc_0E8398
loc_0E8382:
	moveq	#$4,d0
	and.b	g_Player1+$2E(a5),d0
	beq.s	loc_0E8392
	ori.b	#$4,$2E(a4)
	bra.s	loc_0E8398
loc_0E8392:
	andi.b	#$FB,$2E(a4)
loc_0E8398:
	lea.l	HoloBolt_StateAppear(pc),a0
	move.l	a0,$64(a4)
	move.l	a0,$5C(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
