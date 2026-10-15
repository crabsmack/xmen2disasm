; ---------------------------------------------------------------------------
; BabyBio_GetMoveLimit_Horiz - BabyBio_GetMoveLimit cases 0/1: left/right patrol limit and its wall/edge kind
; In:  inside BabyBio_GetMoveLimit (a3 = kind out, a4 = this)
; Out: -
; Evidence: Sw_11C662 targets loc_11C694/loc_11C6A8
; ---------------------------------------------------------------------------
BabyBio_GetMoveLimit_Horiz:
	tst.b	$B7(a4)
	beq.s	loc_11C69E
	clr.b	(a3)
	bra.s	loc_11C6A2
loc_11C69E:
	move.b	#$1,(a3)
loc_11C6A2:
	move.w	$AC(a4),d0
	bra.s	BabyBio_GetMoveLimit_Done
loc_11C6A8:
	tst.b	$B8(a4)
	beq.s	loc_11C6B2
	clr.b	(a3)
	bra.s	loc_11C6B6
loc_11C6B2:
	move.b	#$1,(a3)
loc_11C6B6:
	move.w	$AE(a4),d0
	bra.s	BabyBio_GetMoveLimit_Done
