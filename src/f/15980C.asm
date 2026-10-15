; ---------------------------------------------------------------------------
; Magneto_BombOrigin - standing flux-bomb origin per direction 1-8
; In:  8(a6) = byte dir, $C/$10/$14(a6) = pointers dx, dy, angle
; Out: none
; Evidence: switch on dir-1 with 45-degree angles like Magneto_ShotOrigin
; ---------------------------------------------------------------------------
Magneto_BombOrigin:
	link.w	a6,#$0
	movem.l	d7/a3-a4,-(a7)
	move.b	$B(a6),d7
	movea.l	$10(a6),a3
	movea.l	$C(a6),a4
	move.b	d7,d0
	subq.b	#$1,d0
	bmi.w	Magneto_BombOrigin_Ret
	cmpi.b	#$7,d0
	bgt.w	Magneto_BombOrigin_Ret
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	Sw_15980C(pc,d1.w),d1
	jmp	Sw_15980C-2(pc,d1.w)
