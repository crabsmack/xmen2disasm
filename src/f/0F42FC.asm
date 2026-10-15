; ---------------------------------------------------------------------------
; SentinelsB1_InstallSegHooks - SentinelsB1: set the handlers for floor-segment types 26 and 27
; In:  none
; Out: none
; Evidence: writes $FFCDFE (type 26) = SentinelsB_ExitSeg and $FFCE02 (type 27) = SentinelsB_SegIsMode3; handler table $FFCD96 + type*4 is called by ACTOR Move (sub_1F4C56)
; ---------------------------------------------------------------------------
SentinelsB1_InstallSegHooks:
	link.w	a6,#$0
	lea.l	$2942(a5),a0
	move.l	a0,-$33FE(a5)
	lea.l	$293A(a5),a0
	move.l	a0,-$3402(a5)
	unlk	a6
	rts
