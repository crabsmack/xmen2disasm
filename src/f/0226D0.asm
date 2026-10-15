; ---------------------------------------------------------------------------
; sub_0226D0	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0226D0:
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
