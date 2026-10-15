; ---------------------------------------------------------------------------
; SavageBigBio_Move - vtable +$4E: per-frame movement of a SAVAGEBIGBIO
; In:  8(a6) = this
; Evidence: slot +$4E of the SAVAGEBIGBIO descriptor $0BD30C; TAS frames 33665-34355 (688 frames active); calls parent SAVAGEBIOBASE slot +$4E
; ---------------------------------------------------------------------------
SavageBigBio_Move:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$16(a4),d0
	ext.l	d0
	cmp.l	-$3B24(a5),d0
	ble.s	loc_0BA79A
	move.w	-$3B22(a5),$16(a4)
	bra.s	loc_0BA7B4
loc_0BA79A:
	move.l	-$3B24(a5),d0
	neg.l	d0
	move.w	$16(a4),d1
	ext.l	d1
	cmp.l	d1,d0
	ble.s	loc_0BA7B4
	move.l	-$3B24(a5),d0
	neg.l	d0
	move.w	d0,$16(a4)
loc_0BA7B4:
	move.w	$E(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	lea.l	$2072(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$4E(a0),a1
	jsr	(a1)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
