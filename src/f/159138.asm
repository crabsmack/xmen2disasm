; ---------------------------------------------------------------------------
; Magneto_AirShotEndAnim - follow-through animation after an air shot in aim direction 0-9
; In:  8(a6) = word direction
; Out: d0 = animation script
; Evidence: same direction grouping as Magneto_AirShotAnim; used by Magneto_StateAirShot
; ---------------------------------------------------------------------------
Magneto_AirShotEndAnim:
	link.w	a6,#$0
	move.l	a4,-(a7)
	move.w	$A(a6),d0
	bmi.w	Magneto_AirShotEndAnim_Default
	cmpi.w	#$9,d0
	bgt.w	Magneto_AirShotEndAnim_Default
	add.w	d0,d0
	move.w	Sw_159138(pc,d0.w),d0
	jmp	Sw_159138-2(pc,d0.w)
