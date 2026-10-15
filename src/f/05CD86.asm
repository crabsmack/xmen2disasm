; ---------------------------------------------------------------------------
; Tusk_TakeDamage - parent TakeDamage (health floored at 0); still alive: 90-frame cooldown and state Tusk_HurtFlash for hit types $D-$F, else blink and Tusk_HurtCharge; dead: cooldown $7FFF and state Tusk_Defeated (TUSK override of slot +$26 TakeDamage)
; In:  8(a6) = this (TUSK object), $C(a6) = attacker, $13(a6)/$17(a6) = byte hit type/damage, $1A/$1E(a6) = hit point
; Out: none
; Evidence: class descriptor TUSK slot +$26 (tools/classes.py); TAS frames 21174-21959 (8 active)
; ---------------------------------------------------------------------------
Tusk_TakeDamage:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	move.b	$13(a6),d7
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
	ext.w	d7
	ext.l	d7
	move.l	d7,-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$D7A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$26(a0),a1
	jsr	(a1)
	tst.w	$68(a4)
	bge.s	loc_05CDD8
	clr.w	$68(a4)
loc_05CDD8:
	tst.w	$68(a4)
	beq.s	loc_05CE10
	move.w	#$5A,$6A(a4)
	cmpi.b	#$D,d7
	beq.s	loc_05CDF6
	cmpi.b	#$E,d7
	beq.s	loc_05CDF6
	cmpi.b	#$F,d7
	bne.s	loc_05CE00
loc_05CDF6:
	lea.l	Tusk_HurtFlash(pc),a0
	move.l	a0,$5C(a4)
	bra.s	loc_05CE1E
loc_05CE00:
	ori.w	#$40,$6(a4)
	lea.l	Tusk_HurtCharge(pc),a0
	move.l	a0,$5C(a4)
	bra.s	loc_05CE1E
loc_05CE10:
	move.w	#$7FFF,$6A(a4)
	lea.l	Tusk_Defeated(pc),a0
	move.l	a0,$5C(a4)
loc_05CE1E:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
