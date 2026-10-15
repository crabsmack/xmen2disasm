; ---------------------------------------------------------------------------
; SentinelsB2_InstallSegHooks - SentinelsB2: set the handlers for floor-segment types 21, 26 and 27
; In:  none
; Out: none
; Evidence: $FFCDEA = SentinelsB_HazardSeg, $FFCDFE = SentinelsB_SegIsMode3, $FFCE02 = SentinelsB_ExitSeg
; ---------------------------------------------------------------------------
SentinelsB2_InstallSegHooks:
	link.w	a6,#$0
	lea.l	SentinelsB_HazardSeg(pc),a0
	move.l	a0,-$3416(a5)
	lea.l	SentinelsB_SegIsMode3(pc),a0
	move.l	a0,-$3402(a5)
	lea.l	SentinelsB_ExitSeg(pc),a0
	move.l	a0,-$33FE(a5)
	unlk	a6
	rts
