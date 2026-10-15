; ---------------------------------------------------------------------------
; SporeMine_RecIdle - spore handler: idle animation $0BF54E, then look for a player
; In:  8(a6) = spore record
; Out: none
; Evidence: TAS 27906-30491
; Found: link-after-rts
; ---------------------------------------------------------------------------
SporeMine_RecIdle:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$218A(a5),a0
	movea.l	$2(a0),a0
	move.l	a0,$10(a4)
	moveq	#$0,d0
	move.b	$7(a0),d0
	move.w	d0,$E(a4)
	clr.l	$14(a4)
	lea.l	SporeMine_RecFindTarget(pc),a0
	move.l	a0,$18(a4)
	clr.w	$1C(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
