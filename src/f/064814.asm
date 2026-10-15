; ---------------------------------------------------------------------------
; PlayerSelect_LoadCharFrame_Cyclops - PlayerSelect_LoadCharFrame cases 1-2 (Cyclops, Gambit)
; In:  a3 = cursor
; Out: none
; Evidence: Sw_0647D0 entries 1 and 2: sub_1E3C5A, sub_1D0744
; ---------------------------------------------------------------------------
PlayerSelect_LoadCharFrame_Cyclops:
	jsr	$4B32(a5)	; -> sub_1E3C5A
	movea.l	d0,a4
	jsr	$4B3A(a5)	; -> sub_1E3C6A
	move.w	d0,d7
	bra.s	$64870
loc_064822:
	jsr	$4992(a5)	; -> sub_1D0744
	movea.l	d0,a4
	jsr	$499A(a5)	; -> sub_1D0754
	move.w	d0,d7
	bra.s	$64870
