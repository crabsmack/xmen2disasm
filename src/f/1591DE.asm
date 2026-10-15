; ---------------------------------------------------------------------------
; Magneto_ShotAnim - wind-up animation for a ground shot in aim direction 1-8
; In:  8(a6) = word direction
; Out: d0 = animation script (0 if out of range)
; Evidence: switch on dir-1: 1/8, 2/7, 3/6, 4/5 pairs share scripts; used by Magneto_StartShot/StartBomb
; ---------------------------------------------------------------------------
Magneto_ShotAnim:
	link.w	a6,#$0
	move.l	a4,-(a7)
	move.w	$A(a6),d0
	subq.w	#$1,d0
	bmi.s	Magneto_ShotAnim_Default
	cmpi.w	#$7,d0
	bgt.s	Magneto_ShotAnim_Default
	add.w	d0,d0
	move.w	Sw_1591DE(pc,d0.w),d0
	jmp	Sw_1591DE-2(pc,d0.w)
