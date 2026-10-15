; ---------------------------------------------------------------------------
; Mem_Set - fill N bytes with a byte value (memset)
; In:  8(a6) = dst   $C(a6) = long: fill byte   $10(a6) = long: count
; Out: d0 = dst
; Evidence: over 18 bytes: aligns dst, then 16-byte unrolled long stores of the replicated byte; byte loop for the rest
; ---------------------------------------------------------------------------
Mem_Set:
	movea.l	$4(a7),a0
	movem.l	$8(a7),d0-d1
	cmpi.l	#$13,d1
	blt.s	loc_1F494C
	moveq	#$0,d2
	move.b	d0,d2
	lsl.w	#$8,d0
	or.w	d0,d2
	move.l	d2,d0
	swap	d2
	or.l	d2,d0
	move.l	a0,d2
	lsr.b	#$1,d2
	bcc.s	loc_1F492A
	move.b	d0,(a0)+
	subq.l	#$1,d1
loc_1F492A:
	lsr.b	#$1,d2
	bcc.s	loc_1F4932
	move.w	d0,(a0)+
	subq.l	#$2,d1
loc_1F4932:
	move.l	d1,d2
	lsr.l	#$4,d2
	subq.l	#$1,d2
loc_1F4938:
	move.l	d0,(a0)+
	move.l	d0,(a0)+
	move.l	d0,(a0)+
	move.l	d0,(a0)+
	subq.l	#$1,d2
	bcc.s	loc_1F4938
	andi.w	#$F,d1
	bra.s	loc_1F494C
loc_1F494A:
	move.b	d0,(a0)+
loc_1F494C:
	dbra	d1,loc_1F494A
	move.l	$4(a7),d0
	rts
