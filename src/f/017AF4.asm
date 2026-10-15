; ---------------------------------------------------------------------------
; FarAcolyte_StateWaitOnScreen - FARACOLYTE first state: invisible until within 120 px (x) and 100 px (y) of the screen centre, then appear
; In:  8(a6) = this
; Out: d0
; Evidence: set as +$64 default state by FarAcolyte_Init; frame $FF (slot $56); centre = g_CameraX + $A0, g_CameraY + $70; then FarAcolyte_StateAppear
; ---------------------------------------------------------------------------
FarAcolyte_StateWaitOnScreen:
	link.w	a6,#$0
	movem.l	d3/d6-d7/a4,-(a7)
	movea.l	$8(a6),a4
	pea.l	($FF).w
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	move.w	g_CameraX(a5),d6
	add.w	#$A0,d6
	move.w	g_CameraY(a5),d7
	add.w	#$70,d7
	ext.l	d6
	move.w	$10(a4),d0
	ext.l	d0
	move.l	d6,d1
	sub.l	d0,d1
	sge.b	d3
	neg.b	d3
	beq.s	loc_017B3E
	ext.l	d6
	move.w	$10(a4),d0
	ext.l	d0
	move.l	d6,d1
	sub.l	d0,d1
	bra.s	loc_017B4C
loc_017B3E:
	ext.l	d6
	move.w	$10(a4),d0
	ext.l	d0
	move.l	d6,d1
	sub.l	d0,d1
	neg.l	d1
loc_017B4C:
	moveq	#$78,d0
	cmp.l	d1,d0
	addq.w	#$8,a7
	ble.s	loc_017BAC
	ext.l	d7
	move.w	$12(a4),d0
	ext.l	d0
	move.l	d7,d1
	sub.l	d0,d1
	sge.b	d3
	neg.b	d3
	beq.s	loc_017B74
	ext.l	d7
	move.w	$12(a4),d0
	ext.l	d0
	move.l	d7,d1
	sub.l	d0,d1
	bra.s	loc_017B82
loc_017B74:
	ext.l	d7
	move.w	$12(a4),d0
	ext.l	d0
	move.l	d7,d1
	sub.l	d0,d1
	neg.l	d1
loc_017B82:
	moveq	#$64,d0
	cmp.l	d1,d0
	ble.s	loc_017BAC
	move.w	g_CameraX(a5),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$B8(a4)
	andi.w	#$BFFF,$6(a4)
	clr.w	$6C(a4)
	lea.l	FarAcolyte_StateAppear(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_017BAC:
	movem.l	-$10(a6),d3/d6-d7/a4
	unlk	a6
	rts
