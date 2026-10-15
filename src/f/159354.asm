; ---------------------------------------------------------------------------
; Magneto_ShotOriginAir - air shot origin per direction 0-9: hand offset, angle and damage type
; In:  8(a6) = byte dir, $C..$18(a6) = pointers dx, dy, angle, type
; Out: none
; Evidence: switch: e.g. 7 = ($63,$3B) 0 deg type 10, 2 = (-$63,$3B) 180 deg type 9, 4/5 = up 90 deg type 12, 0/9 = down 270 deg type 11
; ---------------------------------------------------------------------------
Magneto_ShotOriginAir:
	link.w	a6,#$0
	movem.l	d7/a3-a4,-(a7)
	move.b	$B(a6),d7
	movea.l	$10(a6),a3
	movea.l	$C(a6),a4
	move.b	d7,d0
	bmi.w	Magneto_ShotOriginAir_Ret
	cmpi.b	#$9,d0
	bgt.w	Magneto_ShotOriginAir_Ret
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	Sw_159354(pc,d1.w),d1
	jmp	Sw_159354-2(pc,d1.w)
