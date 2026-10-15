; ---------------------------------------------------------------------------
; EvilDrop_StateDrop - EVILDROP state: start falling (vy $100, gravity $80)
; In:  8(a6) = this
; Out: d0
; Evidence: next EvilDrop_StateFall
; Found: link-after-rts
; ---------------------------------------------------------------------------
EvilDrop_StateDrop:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$100,$18(a4)
	move.w	#$80,$20(a4)
	clr.w	$6C(a4)
	lea.l	EvilDrop_StateFall(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
