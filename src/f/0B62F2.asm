; ---------------------------------------------------------------------------
; sub_0B62F2	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0B62F2:
	link.w	a6,#$0
	lea.l	sub_0B611E(pc),a0
	move.l	a0,g_SceneFrameHook(a5)
	jsr	sub_0B6252(pc)
	jsr	sub_0B6086(pc)
	jsr	sub_0B600A(pc)
	pea.l	($500).w
	moveq	#$64,d0
	move.l	d0,-(a7)
	pea.l	($180).w
	pea.l	($140).w
	jsr	$8A(a5)	; -> Players_PlaceAtStart
	unlk	a6
	rts
