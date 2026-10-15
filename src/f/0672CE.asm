; ---------------------------------------------------------------------------
; ScalingActor_SetFrame - vtable +$56: set the animation frame of a SCALINGACTOR
; In:  8(a6) = this (SCALINGACTOR object)
; Out: none
; Evidence: class descriptor SCALINGACTOR slot +$56 (tools/classes.py); TAS frames 2348-49088 (53 active)
; ---------------------------------------------------------------------------
ScalingActor_SetFrame:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	move.w	$E(a6),d7
	movea.l	$8(a6),a4
	movea.l	$8C(a4),a0
	move.b	$3C(a0),d0
	bmi.w	loc_06736C
	cmpi.b	#$6,d0
	bgt.s	loc_06736C
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	Sw_0672CE(pc,d1.w),d1
	jmp	Sw_0672CE-2(pc,d1.w)
