; ---------------------------------------------------------------------------
; Math_LMul - 32x32 -> 32-bit multiply (compiler runtime)
; In:  d0 = long, d1 = long
; Out: d0 = d0 * d1 (low 32 bits)
; Evidence: three mulu.w partial products; 12 callers in compiled code
; ---------------------------------------------------------------------------
Math_LMul:
	move.l	d0,-(a7)
	mulu.w	d1,d0
	movea.l	d0,a0
	move.l	d1,d0
	mulu.w	(a7)+,d1
	clr.w	d0
	swap	d0
	beq.s	loc_15C20E
	mulu.w	(a7),d0
loc_15C20E:
	addq.l	#$2,a7
	add.w	d1,d0
	swap	d0
	clr.w	d0
	add.l	a0,d0
	rts
