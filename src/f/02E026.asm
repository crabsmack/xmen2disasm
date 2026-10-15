; ---------------------------------------------------------------------------
; ExodusBlast_StateLaunch_part1 - part 1 of ExodusBlast_StateLaunch: code block split off by the code-flow tools (not a separate function)
; In:  registers/frame of ExodusBlast_StateLaunch
; Out: continues in ExodusBlast_StateLaunch
; Evidence: only reached by branches from ExodusBlast_StateLaunch
; ---------------------------------------------------------------------------
ExodusBlast_StateLaunch_part1:
	clr.w	$6C(a4)
	lea.l	ExodusBlast_LaunchRight(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	ExodusBlast_StateLaunch_part4
loc_02E03A:
	clr.w	$6C(a4)
	lea.l	ExodusBlast_LaunchDownLeft(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	ExodusBlast_StateLaunch_part4
