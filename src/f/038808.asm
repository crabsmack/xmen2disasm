; ---------------------------------------------------------------------------
; BaniMazaA1_InitTablePtrs - store four BaniMazaA1 data table pointers in -$3C9C..-$3CA8
; In:  none
; Out: none
; Evidence: jt $38C38, $A3A, $A42, $A4A targets; users not traced yet
; ---------------------------------------------------------------------------
BaniMazaA1_InitTablePtrs:
	link.w	a6,#$0
	lea.l	$832(a5),a0
	move.l	$2(a0),-$3C9C(a5)
	lea.l	$83A(a5),a0
	move.l	$2(a0),-$3CA0(a5)
	lea.l	$842(a5),a0
	move.l	$2(a0),-$3CA4(a5)
	lea.l	$84A(a5),a0
	move.l	$2(a0),g_BmA1ColourSeqs(a5)
	unlk	a6
	rts
