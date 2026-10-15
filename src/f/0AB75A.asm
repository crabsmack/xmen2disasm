; ---------------------------------------------------------------------------
; FloatBubble_Spawn - create a FLOATBUBBLE at (x, y) with setup words a/b and direction
; In:  8(a6) = long x, $C(a6) = long y, $12(a6) = word a, $16(a6) = word b, $1A(a6) = word direction
; Out: d0 = object
; Evidence: builds a placement record {+6 a, +8 b, +$A 0, +$E dir} and calls Tbl_FloatBubble_vtable +$0E New; jt 864; callers BubbleManager_SpawnCluster/SpawnAtSurface
; Found: jt 864
; ---------------------------------------------------------------------------
FloatBubble_Spawn:
	link.w	a6,#$FFF0
	move.l	a4,-(a7)
	move.w	$12(a6),-$A(a6)
	move.w	$16(a6),-$8(a6)
	clr.l	-$6(a6)
	move.w	$1A(a6),-$2(a6)
	pea.l	-$10(a6)
	move.l	$C(a6),-(a7)
	move.l	$8(a6),-(a7)
	lea.l	$1B12(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$1B12(a5),a0
	movea.l	$2(a0),a0
	movea.l	$E(a0),a1
	jsr	(a1)
	movea.l	d0,a4
	move.l	a4,d0
	movea.l	-$14(a6),a4
	unlk	a6
	rts
