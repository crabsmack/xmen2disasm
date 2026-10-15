; ---------------------------------------------------------------------------
; Ninja_CalcPatrolBounds - compute a NINJA's patrol limits: home x (+$10) minus and plus a half-width
; In:  8(a6) = this  $C(a6) = word half-width (sign ignored)  $10(a6) = word* low out  $14(a6) = word* high out
; Out: *low = home x - |w|, *high = home x + |w|
; Evidence: only caller Ninja_Init with spawn word +6 (default $A0) into +$9C/+$9E, which Ninja_ActLeap checks
; ---------------------------------------------------------------------------
Ninja_CalcPatrolBounds:
	link.w	a6,#$0
	movem.l	d3/d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$E(a6),d7
	sge.b	d3
	neg.b	d3
	beq.s	loc_13CC56
	ext.l	d7
	move.l	d7,d0
	bra.s	loc_13CC5C
loc_13CC56:
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
loc_13CC5C:
	move.w	$10(a4),d1
	sub.w	d0,d1
	movea.l	$10(a6),a0
	move.w	d1,(a0)
	tst.w	d7
	sge.b	d3
	neg.b	d3
	beq.s	loc_13CC76
	ext.l	d7
	move.l	d7,d0
	bra.s	loc_13CC7C
loc_13CC76:
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
loc_13CC7C:
	add.w	$10(a4),d0
	movea.l	$14(a6),a0
	move.w	d0,(a0)
	movem.l	-$C(a6),d3/d7/a4
	unlk	a6
	rts
