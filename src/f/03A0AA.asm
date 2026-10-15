; ---------------------------------------------------------------------------
; BanimazaDoor_StateStartRise - BANIMAZADOOR: rise (vy $5DC) with sound $BC, become visible, hittable and solid
; In:  8(a6) = this
; Out: d0 = 0
; Evidence: HitList_Add(this, $FFEBAE); floor segment (g_Segs + +$7A*$14) flag $40 cleared; next BanimazaDoor_StateRising
; ---------------------------------------------------------------------------
BanimazaDoor_StateStartRise:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	pea.l	($BC).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($BC).w
	jsr	$521A(a5)	; -> Snd_Play
	andi.w	#$BFFF,$6(a4)
	pea.l	g_HitListEnemyBody(a5)
	move.l	a4,-(a7)
	jsr	$4062(a5)	; -> HitList_Add
	move.l	d0,$84(a4)
	moveq	#$0,d0
	move.b	$7A(a4),d0
	ext.l	d0
	lsl.l	#$2,d0
	move.l	d0,d1
	lsl.l	#$2,d0
	add.l	d1,d0
	lea.l	g_Segs(a5),a0
	andi.b	#$BF,(a0,d0.w)
	move.b	#$1,$9A(a4)
	move.w	#$5DC,$18(a4)
	clr.w	$20(a4)
	move.b	#$1,$A0(a4)
	lea.l	BanimazaDoor_StateRising(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$0,d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
