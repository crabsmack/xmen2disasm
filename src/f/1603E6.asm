; ---------------------------------------------------------------------------
; Rand_Next_Mix3 - Rand_Next third stage: XOR the third table entry and step its index
; In:  d0 = partial value
; Out: continues in Rand_Next_Finish
; Evidence: index -$7AE wraps at $FC
; ---------------------------------------------------------------------------
Rand_Next_Mix3:
	move.w	-$7AE(a5),d1
	move.w	Tbl_RandXor3(pc,d1.w),d1
	eor.w	d1,d0
	subq.w	#$2,-$7AE(a5)
	bpl.w	Rand_Next_Finish
	move.w	#$FC,-$7AE(a5)
	bra.w	Rand_Next_Finish
