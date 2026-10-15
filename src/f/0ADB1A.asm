; ---------------------------------------------------------------------------
; TrapDoor_SetTiles - TRAPDOOR slot +$82: write one tile id across the trapdoor segment's columns at its row
; In:  8(a6) = this, $E(a6) = word tile
; Out: d0
; Evidence: columns from the segment's x range (+8/+$C), row = y >> 13; sub_15D7F8; jt 902
; Found: jt 902
; ---------------------------------------------------------------------------
TrapDoor_SetTiles:
	link.w	a6,#$0
	movem.l	d4-d7/a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$9C(a4),a0
	move.w	$8(a0),d0
	ext.l	d0
	addq.l	#$8,d0
	move.l	d0,d4
	asr.l	#$5,d4
	move.w	$C(a0),d0
	ext.l	d0
	subq.l	#$8,d0
	move.l	d0,d5
	asr.l	#$5,d5
	moveq	#$D,d0
	move.l	$C(a4),d6
	asr.l	d0,d6
	ext.l	d4
	move.l	d4,d7
	bra.s	loc_0ADB6E
loc_0ADB50:
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.w	$E(a6),d1
	ext.l	d1
	move.l	d1,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	move.l	d7,-(a7)
	jsr	$3FDA(a5)	; -> sub_15D7F8
	lea.l	$10(a7),a7
	move.l	d7,d0
	addq.l	#$1,d7
loc_0ADB6E:
	ext.l	d5
	cmp.l	d7,d5
	bge.s	loc_0ADB50
	movem.l	-$14(a6),d4-d7/a4
	unlk	a6
	rts
