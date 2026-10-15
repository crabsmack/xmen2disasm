; ---------------------------------------------------------------------------
; SiberiaB1_PostLoad - SiberiaB1 scene post-load hook: wind sprite, scroll offset, run the plane-B scroll hook, then Scene_PostLoadVram
; In:  none
; Out: none
; Evidence: installed in $FFC914 (-$38EC, called last by Level_Load)
; ---------------------------------------------------------------------------
SiberiaB1_PostLoad:
	link.w	a6,#$0
	jsr	SiberiaB1_InitWindSprite(pc)
	addi.w	#$100,-$3ACC(a5)
	clr.b	-$13F0(a5)
	jsr	$4D9A(a5)	; -> Irq_Disable
	movea.l	-$3A50(a5),a0
	jsr	(a0)
	jsr	$4DA2(a5)	; -> Irq_Enable
	jsr	$82(a5)	; -> Scene_PostLoadVram
	unlk	a6
	rts
