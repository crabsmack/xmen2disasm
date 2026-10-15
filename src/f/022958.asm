; ---------------------------------------------------------------------------
; AvalonA2_DisabledFrameEffect_exit - exit of AvalonA2_DisabledFrameEffect (unlk/rts after the skipped body)
; In:  none
; Out: none
; Evidence: only reached by the bra.s at the start of AvalonA2_DisabledFrameEffect
; ---------------------------------------------------------------------------
AvalonA2_DisabledFrameEffect_exit:
	unlk	a6
	rts
