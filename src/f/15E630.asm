; ---------------------------------------------------------------------------
; Actor_Attack - ACTOR slot +$22: hit a target (its TakeDamage) and start this object's hit-flash timer
; In:  8(a6) = this   $C(a6) = target   $10(a6)/$14(a6) = bytes   $18(a6)/$1C(a6) = words (damage and hit data passed through)
; Out: none
; Evidence: target vtable +$26 TakeDamage(target, this, ...); this+$6A = 10
; ---------------------------------------------------------------------------
Actor_Attack:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$C(a6),a3
	movea.l	$8(a6),a4
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
	move.l	a4,-(a7)
	move.l	a3,-(a7)
	movea.l	(a3),a0
	movea.l	$26(a0),a1
	jsr	(a1)
	move.w	#$A,$6A(a4)
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
