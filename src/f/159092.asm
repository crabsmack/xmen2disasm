; ---------------------------------------------------------------------------
; Magneto_AirShotAnim - wind-up animation for an air shot in aim direction 0-9
; In:  8(a6) = word direction
; Out: d0 = animation script (0 if out of range)
; Evidence: switch: 0/9 down, 1/8 down-diagonal, 2/7 level, 3/6 up-diagonal, 4/5 up; used by Magneto_StartAirShot
; ---------------------------------------------------------------------------
Magneto_AirShotAnim:
	link.w	a6,#$0
	move.l	a4,-(a7)
	move.w	$A(a6),d0
	bmi.w	Magneto_AirShotAnim_Default
	cmpi.w	#$9,d0
	bgt.w	Magneto_AirShotAnim_Default
	add.w	d0,d0
	move.w	Sw_159092(pc,d0.w),d0
	jmp	Sw_159092-2(pc,d0.w)
