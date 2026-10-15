; ---------------------------------------------------------------------------
; Magneto_ShotEndAnim - follow-through animation after a ground shot in aim direction 1-8
; In:  8(a6) = word direction
; Out: d0 = animation script
; Evidence: same grouping as Magneto_ShotAnim; used by Magneto_FireShot/SpawnBomb
; ---------------------------------------------------------------------------
Magneto_ShotEndAnim:
	link.w	a6,#$0
	move.l	a4,-(a7)
	move.w	$A(a6),d0
	subq.w	#$1,d0
	bmi.s	Magneto_ShotEndAnim_Default
	cmpi.w	#$7,d0
	bgt.s	Magneto_ShotEndAnim_Default
	add.w	d0,d0
	move.w	Sw_15926A(pc,d0.w),d0
	jmp	Sw_15926A-2(pc,d0.w)
