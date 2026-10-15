; ---------------------------------------------------------------------------
; BanimazaDoor_OutsideActiveWindow - never outside while flag $1000 is set; otherwise outside when its camera-relative x leaves -$40..$180 or y+$40 leaves -$40..$120 (BANIMAZADOOR override of slot +$42)
; In:  8(a6) = this (BANIMAZADOOR object)
; Out: d0 = 1 outside / 0 not
; Evidence: class descriptor BANIMAZADOOR slot +$42 (tools/classes.py); TAS frames 23674-23743 (41 active)
; ---------------------------------------------------------------------------
BanimazaDoor_OutsideActiveWindow:
	link.w	a6,#$0
	movem.l	d3/d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$1000,d0
	and.w	$6(a4),d0
	beq.s	loc_03A6B4
	moveq	#$0,d0
	bra.s	loc_03A70A
loc_03A6B4:
	move.w	$10(a4),d0
	ext.l	d0
	move.w	g_CameraX(a5),d1
	ext.l	d1
	move.l	d0,d7
	sub.l	d1,d7
	moveq	#-$40,d0
	cmp.l	d7,d0
	ble.s	loc_03A6CE
	moveq	#$1,d0
	bra.s	loc_03A70A
loc_03A6CE:
	cmpi.l	#$180,d7
	ble.s	loc_03A6DA
	moveq	#$1,d0
	bra.s	loc_03A70A
loc_03A6DA:
	move.w	$12(a4),d0
	ext.l	d0
	move.w	g_CameraY(a5),d1
	ext.l	d1
	sub.l	d1,d0
	move.l	d0,d7
	moveq	#$40,d0
	add.l	d0,d7
	moveq	#-$40,d1
	cmp.l	d7,d1
	ble.s	loc_03A6F8
	moveq	#$1,d0
	bra.s	loc_03A70A
loc_03A6F8:
	cmpi.l	#$120,d7
	sgt.b	d3
	neg.b	d3
	subq.b	#$1,d3
	subx.b	d3,d3
	addq.b	#$1,d3
	move.b	d3,d0
loc_03A70A:
	movem.l	-$C(a6),d3/d7/a4
	unlk	a6
	rts
