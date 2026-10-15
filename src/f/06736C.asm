; ---------------------------------------------------------------------------
; ScalingActor_SetFrame_part3 - part 3 of ScalingActor_SetFrame: shared exit split off by the code-flow tools (not a separate function)
; In:  registers/frame of ScalingActor_SetFrame
; Out: continues in ScalingActor_SetFrame
; Evidence: only reached by branches from ScalingActor_SetFrame; ends with rts
; ---------------------------------------------------------------------------
ScalingActor_SetFrame_part3:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
