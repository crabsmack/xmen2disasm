; ---------------------------------------------------------------------------
; AvalonB2_AnimSprite - timer callback: flip the AvalonB2 sprite slot -$3596 between frames 0 and 1 and upload it
; In:  none
; Out: none
; Evidence: Timer_Create(Timer_SetVBlankHookCb, $3C, AvalonB2_AnimSprite, 1) in AvalonB2_RunScene; Spr_SetFrame(slot, -$3A10 & 1), Spr_UploadFrame
; ---------------------------------------------------------------------------
AvalonB2_AnimSprite:
	link.w	a6,#$0
	moveq	#$1,d0
	and.l	g_VBlankCount(a5),d0
	move.l	d0,-(a7)
	pea.l	-$3596(a5)
	jsr	$507A(a5)	; -> Spr_SetFrame
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	-$3596(a5)
	jsr	$5062(a5)	; -> Spr_UploadFrame
	unlk	a6
	rts
