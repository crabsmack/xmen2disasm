; ---------------------------------------------------------------------------
; BanimazaDoor_TakeDamage - 20-frame hit cooldown, remember the attacker (+$92) and hit point (+$96 x+16, +$98 mid height), health -= damage; still standing -> draw state 2, else health 4, draw state 3, 200-frame cooldown and state BanimazaDoor_Shatter (BANIMAZADOOR override of slot +$26 TakeDamage; does not call the parent)
; In:  8(a6) = this (BANIMAZADOOR object), $C(a6) = attacker, $17(a6) = byte damage
; Out: none
; Evidence: class descriptor BANIMAZADOOR slot +$26 (tools/classes.py); not reached by the TAS
; ---------------------------------------------------------------------------
BanimazaDoor_TakeDamage:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	clr.w	$6C(a4)
	move.w	#$14,$6A(a4)
	move.l	$C(a6),$92(a4)
	move.w	$10(a4),d0
	add.w	#$10,d0
	move.w	d0,$96(a4)
	move.w	$12(a4),d0
	ext.l	d0
	move.l	$C(a4),d1
	asr.l	#$8,d1
	add.l	d0,d1
	asr.l	#$1,d1
	move.w	d1,$98(a4)
	move.b	$17(a6),d0
	ext.w	d0
	sub.w	d0,$68(a4)
	tst.w	$68(a4)
	ble.s	loc_03A610
	move.b	#$2,$9A(a4)
	bra.s	loc_03A62A
loc_03A610:
	move.w	#$4,$68(a4)
	move.b	#$3,$9A(a4)
	move.w	#$C8,$6A(a4)
	lea.l	BanimazaDoor_Shatter(pc),a0
	move.l	a0,$5C(a4)
loc_03A62A:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
