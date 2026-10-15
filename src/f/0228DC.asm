; ---------------------------------------------------------------------------
; AvalonA2_DisabledFrameEffect - AvalonA2 per-frame effect whose body is skipped: branches straight to its exit
; In:  none
; Out: none
; Evidence: link + bra.s to the unlk; the $76 bytes in between ($0228E2) never run; called from AvalonA2_FrameHook while no palette fade is active
; ---------------------------------------------------------------------------
AvalonA2_DisabledFrameEffect:
	link.w	a6,#$0
	bra.s	AvalonA2_DisabledFrameEffect_exit
