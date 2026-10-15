; ---------------------------------------------------------------------------
; ExodusBlast_LaunchRight - EXODUSBLAST kind 1: fly right at $32C
; In:  8(a6) = this
; Out: d0 = +4 & 8
; Evidence: +$94 = -$20; next ExodusBlast_StateFlyRight
; ---------------------------------------------------------------------------
ExodusBlast_LaunchRight:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$32C,$16(a4)
	clr.w	$18(a4)
	clr.w	$20(a4)
	move.w	#$FFE0,$94(a4)
	clr.w	$6C(a4)
	lea.l	ExodusBlast_StateFlyRight(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
