; ---------------------------------------------------------------------------
; Rand_Next - pseudo-random number: XOR three lagged tables (lengths 233/151/127 words) with the previous outputs
; In:  none
; Out: d0 = word 0..$FFF
; Evidence: index words -$7B2/-$7B0/-$7AE step down by 2 and wrap at $1D0/$12C/$FC; tables Tbl_RandXor1/2/3; history -$7AC/-$7AA; XPlayer_StateStand picks idle variants with it
; ---------------------------------------------------------------------------
Rand_Next:
	move.w	g_RandPrev2(a5),d0
	move.w	g_RandIdx1(a5),d1
	move.w	Tbl_RandXor1(pc,d1.w),d1
	eor.w	d1,d0
	subq.w	#$2,g_RandIdx1(a5)
	bpl.w	Rand_Next_Mix2
	move.w	#$1D0,g_RandIdx1(a5)
	bra.w	Rand_Next_Mix2
