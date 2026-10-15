; ---------------------------------------------------------------------------
; Platform1_StateShuttle - Platform1 mode 0: when blocked (+4 bit $100) and the cooldown is over, reverse direction
; In:  8(a6) = this
; Out: d0
; Evidence: +$16 = -(+$92); TAS 35152-36560
; ---------------------------------------------------------------------------
Platform1_StateShuttle:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$100,d0
	and.w	$4(a4),d0
	beq.s	loc_1071D6
	tst.w	$6E(a4)
	bgt.s	loc_1071D6
	andi.w	#$FEFF,$4(a4)
	move.w	$92(a4),d0
	ext.l	d0
	neg.l	d0
	move.w	d0,$16(a4)
loc_1071D6:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
