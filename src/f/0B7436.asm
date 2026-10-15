; ---------------------------------------------------------------------------
; ChildShip_OnHurt - CHILDSHIP slot +$6E OnHurt: knocked back by the hit direction (9 left, 10 right, 11 down, 12 up: speed $500) with deceleration $C0
; In:  8(a6) = this, $F(a6) = byte direction
; Out: none
; Evidence: next ChildShip_StateKnockback; switch Sw_0B7436; TAS 33414
; Found: jt 934
; ---------------------------------------------------------------------------
ChildShip_OnHurt:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	ChildShip_StateKnockback(pc),a0
	move.l	a0,$5C(a4)
	clr.w	$6C(a4)
	move.b	$13(a6),d0
	subi.b	#$9,d0
	bmi.s	ChildShip_OnHurt_SetDecel
	cmpi.b	#$3,d0
	bgt.s	ChildShip_OnHurt_SetDecel
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	Sw_0B7436(pc,d1.w),d1
	jmp	Sw_0B7436-2(pc,d1.w)
