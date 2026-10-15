; ---------------------------------------------------------------------------
; ExodusBlast_LaunchDropB - EXODUSBLAST kind 6 (swoop B): drop straight down at $400
; In:  8(a6) = this
; Out: d0 = +4 & 8
; Evidence: same values as ExodusBlast_LaunchDropA
; ---------------------------------------------------------------------------
ExodusBlast_LaunchDropB:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	clr.w	$16(a4)
	move.w	#$400,$18(a4)
	clr.w	$20(a4)
	move.w	#$FFEC,$96(a4)
	clr.w	$6C(a4)
	lea.l	ExodusBlast_StateFlyDown(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
