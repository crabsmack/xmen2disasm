; ---------------------------------------------------------------------------
; Irq_HBlankVector - 68000 vector 28 (level 4 H-int): save scratch regs and call the hook pointer at $214
; In:  none
; Out: none
; Evidence: movem d0-d2/a0-a1; jsr ($214) = Irq_HBlank; rte
; ---------------------------------------------------------------------------
Irq_HBlankVector:
	movem.l	d0-d2/a0-a1,-(a7)
	movea.l	($214).w,a0
	jsr	(a0)
	movem.l	(a7)+,d0-d2/a0-a1
	rte
