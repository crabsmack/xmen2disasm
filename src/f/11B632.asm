; ---------------------------------------------------------------------------
; FloatBio_Script0 - FLOATBIO AI script for spawn case 0 (table $11B630, 10 entries)
; In:  jmp thunks
; Out: -
; Evidence: jt $3032
; ---------------------------------------------------------------------------
FloatBio_Script0:
	jmp	$3142(a5)	; -> BabyBio_ActNext
loc_11B636:
	jmp	$314A(a5)	; -> BabyBio_ActFacePlayer
loc_11B63A:
	jmp	$317A(a5)	; -> BabyBio_ActPlayAnimB
loc_11B63E:
	jmp	$3152(a5)	; -> BabyBio_ActPlayAnimA
loc_11B642:
	jmp	$3182(a5)	; -> BabyBio_ActPlayAnimC
loc_11B646:
	jmp	$3172(a5)	; -> BabyBio_ActStopWait30
loc_11B64A:
	jmp	$31CA(a5)	; -> BabyBio_ActStartFiring
loc_11B64E:
	jmp	$3172(a5)	; -> BabyBio_ActStopWait30
loc_11B652:
	jmp	$3152(a5)	; -> BabyBio_ActPlayAnimA
	jmp	$317A(a5)	; -> BabyBio_ActPlayAnimB
