; ---------------------------------------------------------------------------
; SavageBio_StateDeathWait - SAVAGE bio death: wait until the companion is done, then explode it piece by piece for $F0 frames
; In:  8(a6) = this
; Out: d0
; Evidence: next SavageBio_StateDeathExplode; TAS 33930-34115
; Found: link-after-rts
; ---------------------------------------------------------------------------
SavageBio_StateDeathWait:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$B4(a4),a3
	move.l	a3,-(a7)
	jsr	$337A(a5)	; -> BioBalls_IsDone
	tst.b	d0
	addq.w	#$4,a7
	beq.s	loc_0BCA62
	move.w	#$F0,$6E(a4)
	clr.w	$6C(a4)
	lea.l	SavageBio_StateDeathExplode(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_0BCA74
loc_0BCA62:
	clr.w	$6C(a4)
	lea.l	SavageBio_StateDeathWait(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0BCA74:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
