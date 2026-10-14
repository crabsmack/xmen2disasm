; ---------------------------------------------------------------------------
; sub_1FD61E
; ---------------------------------------------------------------------------
sub_1FD61E:
	cmpi.w	#$1,d0
	ble.s	loc_1FD626
	rts
loc_1FD626:
	move.w	#$100,($A11100).l
	move.w	#$100,($A11200).l
loc_1FD636:
	btst	#$0,($A11100).l
	bne.s	loc_1FD636
	add.w	d0,d0
	movea.l	#$A10003,a0
	adda.w	d0,a0
	moveq	#$0,d0
	move.b	#$40,$6(a0)
	nop
	nop
	move.b	#$40,(a0)
	moveq	#$0,d0
	nop
	nop
	nop
	move.b	(a0),d0
	cmpi.b	#$70,d0
	beq.w	loc_1FD712
	move.b	#$0,(a0)
	lsl.w	#$8,d0
	move.b	(a0),d0
	cmpi.b	#$3F,d0
	beq.w	loc_1FD712
	move.b	#$40,(a0)
	moveq	#$0,d1
	nop
	nop
	nop
	move.b	(a0),d1
	move.b	#$0,(a0)
	lsl.w	#$8,d1
	move.b	(a0),d1
	move.b	#$40,(a0)
	moveq	#$0,d2
	nop
	nop
	nop
	move.b	(a0),d2
	move.b	#$0,(a0)
	lsl.w	#$8,d2
	move.b	(a0),d2
	move.b	#$40,(a0)
	swap	d2
	nop
	nop
	nop
	move.b	(a0),d2
	move.b	#$0,(a0)
	lsl.w	#$8,d2
	move.b	(a0),d2
	move.b	#$40,(a0)
	swap	d2
	cmp.w	d0,d1
	bne.s	loc_1FD712
	cmp.w	d1,d2
	beq.s	loc_1FD6F8
	andi.w	#$F,d2
	bne.s	loc_1FD712
	lsl.b	#$2,d0
	lsl.w	#$2,d0
	ror.w	#$8,d0
	ror.b	#$2,d0
	andi.w	#$FF,d0
	swap	d2
	andi.w	#$F00,d2
	or.w	d2,d0
	not.w	d0
	andi.l	#$4FFF,d0
	move.w	#$0,($A11100).l
	rts
loc_1FD6F8:
	lsl.b	#$2,d0
	lsl.w	#$2,d0
	ror.w	#$8,d0
	ror.b	#$2,d0
	andi.l	#$FF,d0
	not.b	d0
	move.w	#$0,($A11100).l
	rts
loc_1FD712:
	move.w	#$8000,d0
	move.w	#$0,($A11100).l
	rts
