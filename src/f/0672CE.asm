; ---------------------------------------------------------------------------
; ScalingActor_SetFrame - set the frame with the SetFrame of the character in picture descriptor +$3C (0 Beast_SetFrame, 1 Actor_SetFrame for Cyclops, 2 sub_1D041E Gambit, 3 Nightcrawler, 4 Psylocke, 5 Wolverine, 6 Magneto; others nothing) (SCALINGACTOR override of slot +$56 SetFrame)
; In:  8(a6) = this (SCALINGACTOR object), $E(a6) = word frame
; Out: none
; Evidence: class descriptor SCALINGACTOR slot +$56 (tools/classes.py); switch Sw_0672CE, ScalingActor_SetFrame_part1-3; TAS frames 2348-49088 (53 active)
; ---------------------------------------------------------------------------
ScalingActor_SetFrame:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	move.w	$E(a6),d7
	movea.l	$8(a6),a4
	movea.l	$8C(a4),a0
	move.b	$3C(a0),d0
	bmi.w	ScalingActor_SetFrame_part3
	cmpi.b	#$6,d0
	bgt.s	ScalingActor_SetFrame_part3
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	Sw_0672CE(pc,d1.w),d1
	jmp	Sw_0672CE-2(pc,d1.w)
