; ---------------------------------------------------------------------------
; Barbarian_TakeDamage - vtable +$26: a BARBARIAN is hit (attacker, damage)
; In:  8(a6) = this, $C(a6) = attacker, then hit parameters (see ACTOR +$26 $15E680)
; Evidence: slot +$26 of the BARBARIAN descriptor $0BE74E; TAS frames 28004-33017 (11 frames active); calls parent BIONPC slot +$26
; ---------------------------------------------------------------------------
Barbarian_TakeDamage:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$6(a4),$96(a4)
	move.w	$1E(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$1A(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.b	$17(a6),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	move.b	$13(a6),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$211A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$26(a0),a1
	jsr	(a1)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
