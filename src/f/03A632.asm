; ---------------------------------------------------------------------------
; BanimazaDoor_InActivateWindow - vtable +$3A: is a BANIMAZADOOR inside the active window
; In:  8(a6) = this (BANIMAZADOOR object)
; Out: none
; Evidence: class descriptor BANIMAZADOOR slot +$3A (tools/classes.py); TAS frames 23236-23786 (277 active)
; ---------------------------------------------------------------------------
BanimazaDoor_InActivateWindow:
	link.w	a6,#$0
	movem.l	d3/d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$10(a4),d0
	ext.l	d0
	move.w	g_CameraX(a5),d1
	ext.l	d1
	move.l	d0,d7
	sub.l	d1,d7
	moveq	#-$20,d0
	cmp.l	d7,d0
	ble.s	loc_03A658
	moveq	#$0,d0
	bra.s	loc_03A690
loc_03A658:
	cmpi.l	#$160,d7
	ble.s	loc_03A664
	moveq	#$0,d0
	bra.s	loc_03A690
loc_03A664:
	move.w	$12(a4),d0
	ext.l	d0
	move.w	g_CameraY(a5),d1
	ext.l	d1
	sub.l	d1,d0
	move.l	d0,d7
	moveq	#$40,d0
	add.l	d0,d7
	moveq	#-$20,d1
	cmp.l	d7,d1
	ble.s	loc_03A682
	moveq	#$0,d0
	bra.s	loc_03A690
loc_03A682:
	cmpi.l	#$100,d7
	sgt.b	d3
	neg.b	d3
	seq.b	d0
	neg.b	d0
loc_03A690:
	movem.l	-$C(a6),d3/d7/a4
	unlk	a6
	rts
