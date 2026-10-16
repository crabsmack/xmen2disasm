; ---------------------------------------------------------------------------
; FloatBio_Script1 - FLOATBIO AI script for spawn case 1, vertical float (table $11B66C, 6 entries), entries 1-4
; In:  jmp thunks
; Out: -
; Evidence: jt $3042; count word mislabelled Tbl_FloatBio_Script1
; ---------------------------------------------------------------------------
FloatBio_Script1:
	jmp	$3182(a5)	; -> BabyBio_ActPlayAnimC
loc_11B672:
	jmp	$314A(a5)	; -> BabyBio_ActFacePlayer
loc_11B676:
	jmp	$3172(a5)	; -> BabyBio_ActStopWait30
loc_11B67A:
	jmp	$31CA(a5)	; -> BabyBio_ActStartFiring
