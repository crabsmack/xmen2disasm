; ---------------------------------------------------------------------------
; loc_11C694	[runtime: executed in tas]
; ---------------------------------------------------------------------------
loc_11C694:
	tst.b	$B7(a4)
	beq.s	loc_11C69E
	clr.b	(a3)
	bra.s	loc_11C6A2
loc_11C69E:
	move.b	#$1,(a3)
loc_11C6A2:
	move.w	$AC(a4),d0
	bra.s	loc_11C6C4
loc_11C6A8:
	tst.b	$B8(a4)
	beq.s	loc_11C6B2
	clr.b	(a3)
	bra.s	loc_11C6B6
loc_11C6B2:
	move.b	#$1,(a3)
loc_11C6B6:
	move.w	$AE(a4),d0
	bra.s	loc_11C6C4
