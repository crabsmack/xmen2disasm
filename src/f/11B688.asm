; ---------------------------------------------------------------------------
; FloatBio_Script2 - FLOATBIO AI script for spawn case 2 (table $11B686, 6 entries)
; In:  jmp thunks
; Out: -
; Evidence: jt $304A; count word mislabelled Tbl_FloatBio_Script2Len
; ---------------------------------------------------------------------------
FloatBio_Script2:
	jmp	$3182(a5)	; -> BabyBio_ActPlayAnimC
loc_11B68C:
	jmp	$314A(a5)	; -> BabyBio_ActFacePlayer
loc_11B690:
	jmp	$3172(a5)	; -> BabyBio_ActStopWait30
loc_11B694:
	jmp	$31CA(a5)	; -> BabyBio_ActStartFiring
	jmp	$31AA(a5)	; -> BabyBio_ActMoveHorizontal
	jmp	$3172(a5)	; -> BabyBio_ActStopWait30
