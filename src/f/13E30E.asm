; ---------------------------------------------------------------------------
; ExplodeFx_TrailArc - death effect: trail whose head shoots vertically and curves toward the middle of the screen area
; In:  8(a6) = object
; Out: none
; Evidence: ExplodeFx_Trail(obj, 0, vy, ax, ay): x px < $A0 -> ax = $200 else -$200; y px < $70 -> vy = $800, ay = -$20, else vy = -$800, ay = $20 (absolute pixel coordinates); XNpc_Explode stats byte 2 = 4, Pop type 2 (jt 1879)
; ---------------------------------------------------------------------------
ExplodeFx_TrailArc:
	link.w	a6,#$0
	movem.l	d4-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$8(a4),d4
	asr.l	#$8,d4
	move.l	$C(a4),d5
	asr.l	#$8,d5
	cmpi.w	#$A0,d4
	bge.s	loc_13E334
	clr.w	d4
	move.w	#$200,d6
	bra.s	loc_13E33A
loc_13E334:
	clr.w	d4
	move.w	#$FE00,d6
loc_13E33A:
	cmpi.w	#$70,d5
	bge.s	loc_13E348
	move.w	#$800,d5
	moveq	#-$20,d7
	bra.s	loc_13E34E
loc_13E348:
	move.w	#$F800,d5
	moveq	#$20,d7
loc_13E34E:
	ext.l	d7
	move.l	d7,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	ext.l	d5
	move.l	d5,-(a7)
	ext.l	d4
	move.l	d4,-(a7)
	move.l	a4,-(a7)
	jsr	ExplodeFx_Trail(pc)
	movem.l	-$14(a6),d4-d7/a4
	unlk	a6
	rts
