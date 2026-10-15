; ---------------------------------------------------------------------------
; Irq_Enable - enable all interrupts (SR mask = 0)
; In:  none
; Out: none
; Evidence: andi.w #$F8FF,sr; paired with Irq_Disable around VDP/Z80 work
; ---------------------------------------------------------------------------
Irq_Enable:
	andi.w	#$F8FF,sr
	rts
