; ---------------------------------------------------------------------------
; Boulder_FreeDebris - free a rock-debris record by moving the last live record into it
; In:  8(a6) = record
; Out: none
; Evidence: Mem_Copy of $14 bytes; -$3C64 -= 1
; ---------------------------------------------------------------------------
Boulder_FreeDebris:
	link.w	a6,#$0
	tst.w	-$3C64(a5)
	beq.s	loc_05B0C4
	moveq	#$14,d0
	move.l	d0,-(a7)
	move.w	-$3C64(a5),d1
	ext.l	d1
	subq.l	#$1,d1
	movea.l	-$3C68(a5),a0
	lsl.l	#$2,d1
	move.l	d1,d2
	lsl.l	#$2,d1
	add.l	d2,d1
	pea.l	(a0,d1.l)
	move.l	$8(a6),-(a7)
	jsr	$4DAA(a5)	; -> Mem_Copy
	move.w	-$3C64(a5),d0
	subq.w	#$1,-$3C64(a5)
loc_05B0C4:
	unlk	a6
	rts
