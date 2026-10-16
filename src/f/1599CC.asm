; ---------------------------------------------------------------------------
; Magneto_FrameBank - Magneto sprite definition for a frame number (three banks: 0-$3F, $40-$5F, $60+)
; In:  8(a6) = word frame
; Out: d0 = sprite definition
; Evidence: < $40 -> Art_MagnetoBossSpr3 (jt $3DA2), < $60 -> $14F99E, else $145862 (thunks)
; ---------------------------------------------------------------------------
Magneto_FrameBank:
	link.w	a6,#$0
	move.l	d7,-(a7)
	move.w	$A(a6),d7
	cmpi.w	#$60,d7
	blt.s	loc_1599E6
	lea.l	$3DA2(a5),a0
	move.l	$2(a0),d0
	bra.s	loc_1599FE
loc_1599E6:
	cmpi.w	#$40,d7
	blt.s	loc_1599F6
	lea.l	$3D9A(a5),a0
	move.l	$2(a0),d0
	bra.s	loc_1599FE
loc_1599F6:
	lea.l	$3D8A(a5),a0
	move.l	$2(a0),d0
loc_1599FE:
	move.l	-$4(a6),d7
	unlk	a6
	rts
