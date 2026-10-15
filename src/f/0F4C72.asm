; ---------------------------------------------------------------------------
; sub_0F4C72	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0F4C72:
	link.w	a6,#$0
	lea.l	sub_0F47AE(pc),a0
	move.l	a0,g_SceneFrameHook(a5)
	jsr	$23FA(a5)	; -> sub_0DC316
	move.b	#$1,-$38B4(a5)
	jsr	sub_0F4AEE(pc)
	jsr	sub_0F4562(pc)
	pea.l	($13A).w
	pea.l	($9A6).w
	pea.l	($144).w
	pea.l	($9B0).w
	jsr	$8A(a5)	; -> Players_PlaceAtStart
	move.w	#$546,-$3B02(a5)
	clr.w	-$3B08(a5)
	lea.l	$2632(a5),a0
	move.l	$2(a0),g_CamShake(a5)
	unlk	a6
	rts
