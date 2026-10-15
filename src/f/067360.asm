; ---------------------------------------------------------------------------
; ScalingActor_SetFrame_part2 - part 2 of ScalingActor_SetFrame: code block split off by the code-flow tools (not a separate function)
; In:  registers/frame of ScalingActor_SetFrame
; Out: continues in ScalingActor_SetFrame
; Evidence: only reached by branches from ScalingActor_SetFrame
; ---------------------------------------------------------------------------
ScalingActor_SetFrame_part2:
	ext.l	d7
	move.l	d7,-(a7)
	move.l	a4,-(a7)
	jsr	$3E5A(a5)	; -> Magneto_SetFrame
	addq.w	#$8,a7
