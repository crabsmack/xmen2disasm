; ---------------------------------------------------------------------------
; TechWallGun_Fire - TECHWALLGUN slot +$6E: launch one bullet in a direction 1-9 from the barrel (muzzle flash first)
; In:  8(a6) = this, $C(a6) = word direction
; Out: d0
; Evidence: TechWallGun_FindFreeBullet; +$E = $40 | dir; Obj_SetAnim(+$94); switch: barrel offset and velocity ($290 diagonal, $3A0 straight) and acceleration per direction; sound $F3
; ---------------------------------------------------------------------------
TechWallGun_Fire:
	link.w	a6,#$FFFC
	movem.l	d4-d7/a3-a4,-(a7)
	move.w	$E(a6),d4
	movea.l	$8(a6),a3
	move.l	a3,-(a7)
	jsr	TechWallGun_FindFreeBullet(pc)
	movea.l	d0,a4
	move.l	a4,d0
	addq.w	#$4,a7
	beq.w	TechWallGun_Fire_Ret
	move.b	#$40,$E(a4)
	or.b	d4,$E(a4)
	move.l	$94(a3),-(a7)
	move.l	a3,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	move.w	d4,d0
	subq.w	#$1,d0
	addq.w	#$8,a7
	bmi.w	TechWallGun_Fire_Default
	cmpi.w	#$8,d0
	bgt.w	TechWallGun_Fire_Default
	add.w	d0,d0
	move.w	Sw_143082(pc,d0.w),d0
	jmp	Sw_143082-2(pc,d0.w)
