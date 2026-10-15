; ---------------------------------------------------------------------------
; Boulder_AllocDebris - take the next free rock-debris record
; In:  none
; Out: d0 = record or 0 when all 30 are used
; Evidence: -$3C64 += 1
; ---------------------------------------------------------------------------
Boulder_AllocDebris:
	link.w	a6,#$0
	move.l	a4,-(a7)
	moveq	#$0,d0
	movea.l	d0,a4
	moveq	#$1E,d1
	cmp.w	-$3C64(a5),d1
	ble.s	loc_05B084
	move.w	-$3C64(a5),d0
	addq.w	#$1,-$3C64(a5)
	ext.l	d0
	movea.l	-$3C68(a5),a0
	lsl.l	#$2,d0
	move.l	d0,d1
	lsl.l	#$2,d0
	add.l	d1,d0
	lea.l	(a0,d0.l),a4
loc_05B084:
	move.l	a4,d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
