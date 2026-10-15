; ---------------------------------------------------------------------------
; Pop_Init - POP constructor: parent Init, state Pop_StateStart, flags |= $80, no motion, type +$8C = placement p6, delay +$6E = p8 (default 60), frame $FF (class slot 3, +$12)
; In:  8(a6) = this  $C/$10(a6) = x, y (16.16)  $14(a6) = placement entry (not null-checked)
; Out: none
; Evidence: method 3 of class descriptor $13F28A (name string "POP", parent ACTOR)
; ---------------------------------------------------------------------------
Pop_Init:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$14(a6),a3
	movea.l	$8(a6),a4
	move.l	a3,-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$3B22(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	lea.l	Pop_StateStart(pc),a0
	move.l	a0,$64(a4)
	move.l	a0,$5C(a4)
	ori.w	#$80,$6(a4)
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	move.w	$6(a3),$8C(a4)
	tst.w	$8(a3)
	beq.s	loc_13F0CE
	move.w	$8(a3),d0
	bra.s	loc_13F0D0
loc_13F0CE:
	moveq	#$3C,d0
loc_13F0D0:
	move.w	d0,$6E(a4)
	pea.l	($FF).w
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	lea.l	$18(a7),a7
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
