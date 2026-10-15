; ---------------------------------------------------------------------------
; BabyBio_GetMoveLimit - BABYBIO slot 29: return the patrol limit in a direction (0 left +$AC, 1 right +$AE, 2-3 current y) and whether it is a wall (0) or an open edge (1)
; In:  8(a6) = this  $F(a6) = byte direction  $10(a6) = byte* kind out
; Out: d0 = limit coordinate (pixels)
; Evidence: switch Sw_11C662; edge flags +$B7/+$B8 from the spawn record (BabyBio_Init)
; ---------------------------------------------------------------------------
BabyBio_GetMoveLimit:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$10(a6),a3
	movea.l	$8(a6),a4
	move.b	$F(a6),d0
	bmi.s	BabyBio_GetMoveLimit_Done
	cmpi.b	#$3,d0
	bgt.s	BabyBio_GetMoveLimit_Done
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	Sw_11C662(pc,d1.w),d1
	jmp	Sw_11C662-2(pc,d1.w)
