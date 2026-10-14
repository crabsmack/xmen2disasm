; ---------------------------------------------------------------------------
; sub_1FC1FA
; ---------------------------------------------------------------------------
sub_1FC1FA:
	move.l	-$C8A(a5),d7
	cmp.l	-$C00(a5),d7
	beq.w	loc_1FC29E
	move.l	d7,-$C00(a5)
	move.w	-$C8A(a5),d2
	lsl.w	#$7,d2
	subi.w	#$7C,d2
	movea.l	-$BE0(a5),a4
	moveq	#$4,d3
	move.w	-$C88(a5),d0
loc_1FC21E:
	move.w	d0,d1
	cmpi.w	#$4,d0
	ble.s	loc_1FC228
	moveq	#$4,d1
loc_1FC228:
	move.w	d1,d7
	lsl.w	#$3,d7
	subq.w	#$2,d7
loc_1FC22E:
	move.w	d3,(a4)+
	dbra	d7,loc_1FC22E
	move.w	d2,(a4)+
	sub.w	d1,d0
	bne.s	loc_1FC21E
	movea.l	-$BE8(a5),a4
	move.l	#$10001,d0
	move.l	d0,d1
	move.w	-$C88(a5),d1
	cmpi.w	#$4,d1
	ble.s	loc_1FC254
	move.w	#$4,d1
loc_1FC254:
	lsl.w	#$5,d1
	move.w	-$C8A(a5),d7
	subq.w	#$1,d7
	subq.w	#$3,d1
loc_1FC25E:
	movem.l	d0-d1,(a4)
	addq.w	#$8,a4
	dbra	d7,loc_1FC25E
	move.w	-$C88(a5),d1
	move.w	d1,d2
	andi.w	#$3,d1
	bne.s	loc_1FC27C
	move.w	#$3E8,-$BFA(a5)
	bra.s	loc_1FC29E
loc_1FC27C:
	andi.w	#$FFFC,d2
	lsl.w	#$3,d2
	move.w	d2,-$BFA(a5)
	movea.l	-$BE4(a5),a4
	lsl.w	#$5,d1
	move.w	-$C8A(a5),d7
	subq.w	#$1,d7
	subq.w	#$3,d1
loc_1FC294:
	movem.l	d0-d1,(a4)
	addq.w	#$8,a4
	dbra	d7,loc_1FC294
loc_1FC29E:
	move.w	-$BFA(a5),-$C24(a5)
	rts
