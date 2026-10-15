; ---------------------------------------------------------------------------
; CapedAcolyte_OnHurt - CAPEDACOLYTE slot +$6E (XNPC OnHurt): get knocked away from the hit direction (9 left, 10 right, 11 down, 12 up) at speed $30C with deceleration $8E
; In:  8(a6) = this, $C(a6) = attacker, $10(a6) = byte hit direction
; Out: none
; Evidence: tools/classes.py +$6E; saves +$5C into +$60 (hurt return state), state CapedAcolyte_StateKnockback; switch on direction
; ---------------------------------------------------------------------------
CapedAcolyte_OnHurt:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.l	$60(a4)
	bne.s	loc_013738
	move.l	$5C(a4),$60(a4)
loc_013738:
	lea.l	CapedAcolyte_StateKnockback(pc),a0
	move.l	a0,$5C(a4)
	clr.w	$6C(a4)
	move.b	$13(a6),d0
	subi.b	#$9,d0
	bmi.s	CapedAcolyte_OnHurt_SetDecel
	cmpi.b	#$3,d0
	bgt.s	CapedAcolyte_OnHurt_SetDecel
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	Sw_013722(pc,d1.w),d1
	jmp	Sw_013722-2(pc,d1.w)
