; ---------------------------------------------------------------------------
; Barbarian_StateTaunt - BARBARIAN state: play the next taunt animation (cycle +$BA), or after $65 taunts switch to Barbarian_StateScrollTiles
; In:  8(a6) = this
; Out: d0
; Evidence: 4-case switch (all jt[$2292]); never runs in the corpus
; Found: link-after-rts
; ---------------------------------------------------------------------------
Barbarian_StateTaunt:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.b	$BB(a4),d0
	cmpi.b	#$64,d0
	bls.s	loc_0BDC10
	move.w	#$3C,$6C(a4)
	lea.l	Barbarian_StateScrollTiles(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	loc_0BDC92
loc_0BDC10:
	addq.b	#$1,$BA(a4)
	move.b	$BA(a4),d0
	cmpi.b	#$3,d0
	bhi.s	Barbarian_StateTaunt_Reset
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	Sw_0BDBE2(pc,d1.w),d1
	jmp	Sw_0BDBE2-2(pc,d1.w)
