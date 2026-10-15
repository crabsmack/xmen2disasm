; ---------------------------------------------------------------------------
; Player_TopAboveSeg - is the player's box top (minus a margin) above the top of a segment
; In:  8(a6) = player, $C(a6) = word margin, $10(a6) = segment
; Out: d0 = byte 1/0 (0 when no segment)
; Evidence: +$4C - margin < min(seg y1 +$A, y2 +$E); XClimber_CheckGrab refuses wall grabs past the wall's top
; ---------------------------------------------------------------------------
Player_TopAboveSeg:
	link.w	a6,#$0
	movem.l	d3/d7/a4,-(a7)
	movea.l	$10(a6),a4
	move.l	a4,d0
	beq.s	loc_1F1418
	move.w	$A(a4),d0
	cmp.w	$E(a4),d0
	slt.b	d3
	neg.b	d3
	beq.s	loc_1F13F4
	move.w	$A(a4),d0
	bra.s	loc_1F13F8
loc_1F13F4:
	move.w	$E(a4),d0
loc_1F13F8:
	move.w	d0,d7
	movea.l	$8(a6),a0
	move.w	$4C(a0),d0
	ext.l	d0
	move.w	$E(a6),d1
	ext.l	d1
	sub.l	d1,d0
	ext.l	d7
	cmp.l	d0,d7
	sgt.b	d3
	neg.b	d3
	move.b	d3,d0
	bra.s	loc_1F141A
loc_1F1418:
	moveq	#$0,d0
loc_1F141A:
	movem.l	-$C(a6),d3/d7/a4
	unlk	a6
	rts
