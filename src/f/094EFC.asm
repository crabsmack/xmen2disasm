; ---------------------------------------------------------------------------
; EvilDrop_StateStart - EVILDROP initial state: go to EvilDrop_StateDrop
; In:  8(a6) = this
; Out: d0
; Evidence: +$5C/+$64 set by EvilDrop_Init
; Found: link-after-rts
; ---------------------------------------------------------------------------
EvilDrop_StateStart:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	clr.w	$6C(a4)
	lea.l	EvilDrop_StateDrop(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
