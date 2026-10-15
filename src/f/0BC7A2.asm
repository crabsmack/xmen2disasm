; ---------------------------------------------------------------------------
; SavageBioBalls_StateWait - BIOBALLS companion state: wait for the timer +$6E, then its next script step (+$8E/+$8C)
; In:  8(a6) = the BIOBALLS object
; Out: none
; Evidence: TAS 33963-34114
; Found: link-after-rts
; ---------------------------------------------------------------------------
SavageBioBalls_StateWait:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.w	$6E(a4)
	bgt.s	loc_0BC7F2
	tst.l	$8E(a4)
	bne.s	loc_0BC7C4
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_0BC804
loc_0BC7C4:
	addq.w	#$1,$8C(a4)
	movea.l	$8E(a4),a0
	move.w	$8C(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_0BC7D8
	clr.w	$8C(a4)
loc_0BC7D8:
	movea.l	$8E(a4),a0
	addq.l	#$2,a0
	move.w	$8C(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_0BC804
loc_0BC7F2:
	clr.w	$6C(a4)
	lea.l	SavageBioBalls_StateWait(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0BC804:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
