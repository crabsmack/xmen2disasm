; ---------------------------------------------------------------------------
; Irq_Disable - mask all interrupts (SR mask = 7)
; In:  none
; Out: none
; Evidence: ori.w #$700,sr
; ---------------------------------------------------------------------------
Irq_Disable:
	ori.w	#$700,sr
	rts
