; ---------------------------------------------------------------------------
; Rand_Next_Mix2 - Rand_Next second stage: XOR the second table entry and step its index
; In:  d0 = partial value
; Out: continues in Rand_Next_Mix3
; Evidence: index -$7B0 wraps at $12C
; ---------------------------------------------------------------------------
Rand_Next_Mix2:
	move.w	-$7B0(a5),d1
	move.w	Tbl_RandXor2(pc,d1.w),d1
	eor.w	d1,d0
	subq.w	#$2,-$7B0(a5)
	bpl.w	Rand_Next_Mix3
	move.w	#$12C,-$7B0(a5)
	bra.w	Rand_Next_Mix3
