; ---------------------------------------------------------------------------
; sub_0FCC86	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0FCC86:
	link.w	a6,#$0
	jsr	sub_0FCB8E(pc)
	addi.w	#$100,-$3ACC(a5)
	clr.b	-$13F0(a5)
	jsr	$4D9A(a5)	; -> Irq_Disable
	movea.l	-$3A50(a5),a0
	jsr	(a0)
	jsr	$4DA2(a5)	; -> Irq_Enable
	jsr	$82(a5)	; -> Scene_PostLoadVram
	unlk	a6
	rts
