; ---------------------------------------------------------------------------
; BigAcolyte_ActGrow - BIGACOLYTE intro step 4: grow the rendered picture 2x3 px per frame (moving up-left) until width $39, then burst out
; In:  8(a6) = this
; Out: d0 = +4 & 8
; Evidence: scale record -$CA2 +$10/+$12 += 2/3; sound $DC at the start; BigAcolyte_RenderScaled each frame; then BigAcolyte_StateBurstWall
; ---------------------------------------------------------------------------
BigAcolyte_ActGrow:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	subi.l	#$100,$8(a4)
	subi.l	#$180,$C(a4)
	movea.l	g_ScaleParamsPtr(a5),a0
	movea.l	a0,a1
	move.w	$10(a0),d0
	cmp.w	$8(a1),d0
	bne.s	loc_010E62
	pea.l	($DC).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($DC).w
	jsr	$521A(a5)	; -> Snd_Play
	addq.w	#$8,a7
loc_010E62:
	movea.l	g_ScaleParamsPtr(a5),a0
	addq.w	#$2,$10(a0)
	movea.l	g_ScaleParamsPtr(a5),a0
	addq.w	#$3,$12(a0)
	movea.l	g_ScaleParamsPtr(a5),a0
	moveq	#$38,d0
	cmp.w	$10(a0),d0
	blt.s	loc_010EAE
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.w	$34(a4),d1
	ext.l	d1
	lsl.l	#$5,d1
	move.l	d1,-(a7)
	move.l	a0,-(a7)
	move.l	g_ScaleSrcBitmap(a5),-(a7)
	jsr	BigAcolyte_RenderScaled(pc)
	lea.l	$10(a7),a7
	clr.w	$6C(a4)
	lea.l	BigAcolyte_ActGrow(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_010EDE
loc_010EAE:
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.w	$34(a4),d1
	ext.l	d1
	lsl.l	#$5,d1
	move.l	d1,-(a7)
	move.l	g_ScaleParamsPtr(a5),-(a7)
	move.l	g_ScaleSrcBitmap(a5),-(a7)
	jsr	BigAcolyte_RenderScaled(pc)
	lea.l	$10(a7),a7
	clr.w	$6C(a4)
	lea.l	BigAcolyte_StateBurstWall(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_010EDE:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
