; ---------------------------------------------------------------------------
; SavageA4_AnimEffectSprite - SavageA4: animate the effect sprite (frames 0-5, 4 frames each)
; In:  none
; Out: none
; Evidence: Spr_SetFrame + Spr_UploadFrame; TAS 33387-34593
; Found: link-after-rts
; ---------------------------------------------------------------------------
SavageA4_AnimEffectSprite:
	link.w	a6,#$0
	move.l	d7,-(a7)
	tst.b	g_TwoPlayerStep(a5)
	beq.s	loc_0B60CE
	moveq	#$2,d0
	bra.s	loc_0B60D0
loc_0B60CE:
	moveq	#$1,d0
loc_0B60D0:
	move.w	d0,d7
	sub.w	d7,-$3B32(a5)
	tst.w	-$3B32(a5)
	bgt.s	loc_0B6116
	move.w	-$3B3A(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	pea.l	g_SceneSprites(a5)
	jsr	$507A(a5)	; -> Spr_SetFrame
	moveq	#$0,d0
	move.l	d0,-(a7)
	pea.l	g_SceneSprites(a5)
	jsr	$5062(a5)	; -> Spr_UploadFrame
	move.w	-$3B3A(a5),d0
	addq.w	#$1,-$3B3A(a5)
	moveq	#$5,d0
	cmp.w	-$3B3A(a5),d0
	lea.l	$10(a7),a7
	bge.s	loc_0B6110
	clr.w	-$3B3A(a5)
loc_0B6110:
	move.w	#$4,-$3B32(a5)
loc_0B6116:
	move.l	-$4(a6),d7
	unlk	a6
	rts
