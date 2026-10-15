; ---------------------------------------------------------------------------
; Math_CosDeg - cosine of an angle in whole degrees, 16.16 fixed point
; In:  8(a6) = word: angle in degrees
; Out: d0 = long: cos(angle) * $10000
; Evidence: same body as Math_SinDeg applied to 90 - angle
; ---------------------------------------------------------------------------
Math_CosDeg:
	moveq	#$0,d0
	move.w	$6(a7),d0
	neg.w	d0
	addi.w	#$5A,d0
	bra.s	loc_1FDEFE
