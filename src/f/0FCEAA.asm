; ---------------------------------------------------------------------------
; SiberiaB1_DebrisFree - SiberiaB1: remove a debris particle by moving the last one into its slot
; In:  8(a6) = slot
; Out: none
; Evidence: Mem_Copy 20 bytes, count $FFC6F0 - 1
; ---------------------------------------------------------------------------
SiberiaB1_DebrisFree:
	link.w	a6,#$0
	tst.w	-$3B10(a5)
	beq.s	loc_0FCEDA
	moveq	#$14,d0
	move.l	d0,-(a7)
	subq.w	#$1,-$3B10(a5)
	move.w	-$3B10(a5),d1
	ext.l	d1
	movea.l	-$3B24(a5),a0
	lsl.l	#$2,d1
	move.l	d1,d2
	lsl.l	#$2,d1
	add.l	d2,d1
	pea.l	(a0,d1.l)
	move.l	$8(a6),-(a7)
	jsr	$4DAA(a5)	; -> Mem_Copy
loc_0FCEDA:
	unlk	a6
	rts
