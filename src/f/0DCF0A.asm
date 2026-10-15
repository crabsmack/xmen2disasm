; ---------------------------------------------------------------------------
; Blast_StateFly - BLAST state: fly until it hits something (Seg_AtOpenEndAhead(this, 10)); then stick (if +$9C) or vanish
; In:  8(a6) = this
; Out: d0
; Evidence: next Blast_StateStick or Blast_StateKill; TAS 2800-7237
; Found: link-after-rts
; ---------------------------------------------------------------------------
Blast_StateFly:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$A,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E6A(a5)	; -> Seg_AtOpenEndAhead
	tst.b	d0
	addq.w	#$8,a7
	beq.s	loc_0DCF50
	tst.b	$9C(a4)
	beq.s	loc_0DCF3E
	clr.w	$6C(a4)
	lea.l	Blast_StateStick(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_0DCF50
loc_0DCF3E:
	clr.w	$6C(a4)
	lea.l	Blast_StateKill(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0DCF50:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
