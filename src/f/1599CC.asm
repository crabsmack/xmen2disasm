; ---------------------------------------------------------------------------
; sub_1599CC	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1599CC:
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
