; ---------------------------------------------------------------------------
; Magneto_ShotOrigin - standing shot origin per direction 1-8: hand offset, angle and damage type
; In:  8(a6) = byte dir, $C..$18(a6) = pointers dx, dy, angle, type
; Out: none
; Evidence: switch on dir-1; angles 45-degree steps (1 = 225, 2 = 180, 3 = 135, 4/5 = 90, 6 = 45, 7 = 0, 8 = 315)
; ---------------------------------------------------------------------------
Magneto_ShotOrigin:
	link.w	a6,#$0
	movem.l	d7/a3-a4,-(a7)
	move.b	$B(a6),d7
	movea.l	$10(a6),a3
	movea.l	$C(a6),a4
	move.b	d7,d0
	subq.b	#$1,d0
	bmi.w	Magneto_ShotOrigin_Ret
	cmpi.b	#$7,d0
	bgt.w	Magneto_ShotOrigin_Ret
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	Sw_1594C0(pc,d1.w),d1
	jmp	Sw_1594C0-2(pc,d1.w)
