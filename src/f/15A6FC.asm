; ---------------------------------------------------------------------------
; Obj_InScreenWindow - test whether an object's body box overlaps the camera window
; In:  8(a6) = object
; Out: d0 = 1 overlapping (or flags +6 bit $1000), else 0
; Evidence: box +$4E/+$52/+$4C/+$50 minus g_CameraX/Y against words -$35BA/-$35B8 (x) and -$35BE/-$35BC (y); flags +6 $800 / $20 skip the x / y test; jt 2007
; ---------------------------------------------------------------------------
Obj_InScreenWindow:
	link.w	a6,#$0
	movem.l	d4-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$4E(a4),d0
	ext.l	d0
	move.w	g_CameraX(a5),d1
	ext.l	d1
	move.l	d0,d4
	sub.l	d1,d4
	move.w	$52(a4),d0
	ext.l	d0
	move.w	g_CameraX(a5),d1
	ext.l	d1
	move.l	d0,d5
	sub.l	d1,d5
	move.w	$4C(a4),d0
	ext.l	d0
	move.w	g_CameraY(a5),d1
	ext.l	d1
	move.l	d0,d6
	sub.l	d1,d6
	move.w	$50(a4),d0
	ext.l	d0
	move.w	g_CameraY(a5),d1
	ext.l	d1
	move.l	d0,d7
	sub.l	d1,d7
	move.w	#$1000,d0
	and.w	$6(a4),d0
	beq.s	loc_15A756
	moveq	#$1,d0
	bra.s	loc_15A792
loc_15A756:
	move.w	#$800,d0
	and.w	$6(a4),d0
	bne.s	loc_15A774
	cmp.w	g_ActWinRight(a5),d4
	ble.s	loc_15A76A
	moveq	#$0,d0
	bra.s	loc_15A792
loc_15A76A:
	cmp.w	g_ActWinLeft(a5),d5
	bge.s	loc_15A774
	moveq	#$0,d0
	bra.s	loc_15A792
loc_15A774:
	moveq	#$20,d0
	and.w	$6(a4),d0
	bne.s	loc_15A790
	cmp.w	g_ActWinBottom(a5),d6
	ble.s	loc_15A786
	moveq	#$0,d0
	bra.s	loc_15A792
loc_15A786:
	cmp.w	g_ActWinTop(a5),d7
	bge.s	loc_15A790
	moveq	#$0,d0
	bra.s	loc_15A792
loc_15A790:
	moveq	#$1,d0
loc_15A792:
	movem.l	-$14(a6),d4-d7/a4
	unlk	a6
	rts
