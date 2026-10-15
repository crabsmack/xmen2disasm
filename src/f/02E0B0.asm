; ---------------------------------------------------------------------------
; ExodusBlast_StateLaunch_part4 - part 4 of ExodusBlast_StateLaunch: shared exit split off by the code-flow tools (not a separate function)
; In:  registers/frame of ExodusBlast_StateLaunch
; Out: continues in ExodusBlast_StateLaunch
; Evidence: only reached by branches from ExodusBlast_StateLaunch; ends with rts
; ---------------------------------------------------------------------------
ExodusBlast_StateLaunch_part4:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
