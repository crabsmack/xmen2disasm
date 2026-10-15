; ---------------------------------------------------------------------------
; Irq_VBlankVector - 68000 vector 30 (level 6 V-int): save scratch regs and call the hook pointer at $210
; In:  none
; Out: none
; Evidence: movem d0-d2/a0-a1; jsr ($210) = Irq_VBlank; rte
; ---------------------------------------------------------------------------
Irq_VBlankVector:
	movem.l	d0-d2/a0-a1,-(a7)
	movea.l	($210).w,a0
	jsr	(a0)
	movem.l	(a7)+,d0-d2/a0-a1
	rte
