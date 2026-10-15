; ---------------------------------------------------------------------------
; Exodus_StateRiseStart - EXODUS: remember the current position, then rise
; In:  8(a6) = this
; Out: d0 = +4 & 8
; Evidence: +$94/+$96 = x/y px; next Exodus_StateRise
; ---------------------------------------------------------------------------
Exodus_StateRiseStart:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$10(a4),$94(a4)
	move.w	$12(a4),$96(a4)
	clr.w	$6C(a4)
	lea.l	Exodus_StateRise(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
