; ---------------------------------------------------------------------------
; Pop_StateStart - POP first state (Init's +$5C/+$64): start waiting
; In:  8(a6) = this
; Out: d0 = flags & 8
; Evidence: +$6C = 0, +$5C = Pop_StateWait
; ---------------------------------------------------------------------------
Pop_StateStart:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	clr.w	$6C(a4)
	lea.l	Pop_StateWait(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
