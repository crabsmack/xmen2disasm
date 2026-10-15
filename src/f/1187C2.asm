; ---------------------------------------------------------------------------
; ICandy_PoolAlloc - return the first free ICandy pool slot (word +4 bit 15 clear) and mark it used
; In:  none
; Out: d0 = slot or 0
; Evidence: pool base/stride/count globals $FFE54E/$FFE54C/$FFE552 set by ICandy_PoolInit; only caller ICandy_New
; ---------------------------------------------------------------------------
ICandy_PoolAlloc:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	moveq	#$0,d0
	movea.l	d0,a4
	tst.w	-$1CAE(a5)
	beq.s	loc_118808
	moveq	#$0,d7
	movea.l	-$1CB2(a5),a4
	bra.s	loc_1187FA
loc_1187DC:
	move.w	$4(a4),d0
	ext.l	d0
	move.w	#$8000,d1
	and.w	d0,d1
	bne.s	loc_1187F2
	ori.w	#$8000,$4(a4)
	bra.s	loc_118808
loc_1187F2:
	move.l	d7,d0
	addq.l	#$1,d7
	adda.w	-$1CB4(a5),a4
loc_1187FA:
	move.w	-$1CAE(a5),d0
	ext.l	d0
	cmp.l	d7,d0
	bgt.s	loc_1187DC
	moveq	#$0,d0
	movea.l	d0,a4
loc_118808:
	move.l	a4,d0
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
