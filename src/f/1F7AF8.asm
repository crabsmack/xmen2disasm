; ---------------------------------------------------------------------------
; Seg_ComputeSlope - compute a floor segment's slope (+4, 8.8 fixed point); steeper than 45 degrees stores dx/dy and sets flag +0 bit 3
; In:  8(a6) = segment
; Out: none
; Evidence: flat types $13-$1C -> 0; else |dy| <= |dx|: dy*256/dx (Math_LDivS), else dx*256/dy and +0 |= 8
; ---------------------------------------------------------------------------
Seg_ComputeSlope:
	link.w	a6,#$0
	movem.l	d3/d6-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.b	$1(a4),d0
	subi.b	#$13,d0
	bmi.s	Seg_ComputeSlope_Calc
	cmpi.b	#$9,d0
	bgt.s	Seg_ComputeSlope_Calc
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	Sw_1F7AF8(pc,d1.w),d1
	jmp	Sw_1F7AF8-2(pc,d1.w)
