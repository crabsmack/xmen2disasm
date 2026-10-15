; ---------------------------------------------------------------------------
; Tuskette_Move - vtable +$4E: per-frame movement of a TUSKETTE
; In:  8(a6) = this (TUSKETTE object)
; Out: none
; Evidence: class descriptor TUSKETTE slot +$4E (tools/classes.py); TAS frames 22486-23800 (643 active)
; ---------------------------------------------------------------------------
Tuskette_Move:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	move.w	$E(a6),d7
	movea.l	$8(a6),a4
loc_05DD8C:
	move.w	$16(a4),d0
	ext.l	d0
	add.l	d0,$8(a4)
	move.w	$18(a4),d0
	ext.l	d0
	add.l	d0,$C(a4)
	move.w	$1E(a4),d0
	add.w	d0,$16(a4)
	move.w	$20(a4),d0
	add.w	d0,$18(a4)
	subq.w	#$1,d7
	bne.s	loc_05DD8C
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
