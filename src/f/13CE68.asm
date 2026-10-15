; ---------------------------------------------------------------------------
; Ninja_FindSegInBox - find the first live collision segment in a point's grid cell whose bounding box overlaps a given box
; In:  8(a6) = word x  $A(a6) = word y  $C(a6) = word max level  $E(a6) = (unused)  $12(a6)..$18(a6) = words left, top, right, bottom
; Out: d0 = segment record (g_Segs + i*$14) or 0
; Evidence: Seg_GridCell(x, y) -> $FF-terminated index list in the pool at $FFCD88; tests flag $80, byte +2 <= level, min/max of the end points (+8..+E) against the box; caller Ninja_ClipToSegs
; ---------------------------------------------------------------------------
Ninja_FindSegInBox:
	link.w	a6,#$FFFE
	movem.l	d3-d7/a3-a4,-(a7)
	move.w	$E(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$A(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	$3EEA(a5)	; -> Seg_GridCell
	move.w	d0,d7
	movea.l	g_SegGridPool(a5),a0
	lea.l	(a0,d7.w),a3
	move.b	(a3),d7
	moveq	#$0,d0
	movea.l	d0,a4
	addq.w	#$8,a7
	bra.w	loc_13CF56
loc_13CE9A:
	ext.w	d7
	move.l	d7,d0
	ext.l	d0
	lsl.l	#$2,d0
	move.l	d0,d1
	lsl.l	#$2,d0
	add.l	d1,d0
	lea.l	g_Segs(a5),a0
	lea.l	(a0,d0.w),a4
	move.w	$8(a4),d0
	cmp.w	$C(a4),d0
	slt.b	d3
	neg.b	d3
	beq.s	loc_13CEC4
	move.w	$8(a4),d0
	bra.s	loc_13CEC8
loc_13CEC4:
	move.w	$C(a4),d0
loc_13CEC8:
	move.w	d0,-$2(a6)
	move.w	$8(a4),d0
	cmp.w	$C(a4),d0
	sgt.b	d3
	neg.b	d3
	beq.s	loc_13CEE0
	move.w	$8(a4),d0
	bra.s	loc_13CEE4
loc_13CEE0:
	move.w	$C(a4),d0
loc_13CEE4:
	move.w	d0,d4
	move.w	$A(a4),d0
	cmp.w	$E(a4),d0
	slt.b	d3
	neg.b	d3
	beq.s	loc_13CEFA
	move.w	$A(a4),d0
	bra.s	loc_13CEFE
loc_13CEFA:
	move.w	$E(a4),d0
loc_13CEFE:
	move.w	d0,d5
	move.w	$A(a4),d0
	cmp.w	$E(a4),d0
	sgt.b	d3
	neg.b	d3
	beq.s	loc_13CF14
	move.w	$A(a4),d0
	bra.s	loc_13CF18
loc_13CF14:
	move.w	$E(a4),d0
loc_13CF18:
	move.w	d0,d6
	move.b	$2(a4),d0
	ext.w	d0
	cmp.w	$12(a6),d0
	bgt.s	loc_13CF52
	move.b	(a4),d0
	ext.w	d0
	move.w	#$80,d1
	and.b	d0,d1
	beq.s	loc_13CF52
	cmp.w	$1A(a6),d4
	blt.s	loc_13CF52
	move.w	$22(a6),d0
	cmp.w	-$2(a6),d0
	blt.s	loc_13CF52
	cmp.w	$1E(a6),d6
	blt.s	loc_13CF52
	cmp.w	$26(a6),d5
	bgt.s	loc_13CF52
	move.l	a4,d0
	bra.s	loc_13CF60
loc_13CF52:
	addq.w	#$1,a3
	move.b	(a3),d7
loc_13CF56:
	cmpi.b	#$FF,d7
	bne.w	loc_13CE9A
	moveq	#$0,d0
loc_13CF60:
	movem.l	-$1E(a6),d3-d7/a3-a4
	unlk	a6
	rts
