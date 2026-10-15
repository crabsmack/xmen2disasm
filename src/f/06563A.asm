; ---------------------------------------------------------------------------
; Cerebro_TextOpFadeOut - text script op 4: start a palette fade out
; In:  a4 = script pointer
; Out: none
; Evidence: case 4 of Sw_065532: Pal_StartFade(7, -1, jt $5142), g_PalFadeDelay = word arg
; ---------------------------------------------------------------------------
Cerebro_TextOpFadeOut:
	lea.l	$5142(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#-$1,d0
	move.l	d0,-(a7)
	moveq	#$7,d1
	move.l	d1,-(a7)
	jsr	$50F2(a5)	; -> Pal_StartFade
	move.w	(a4)+,g_PalFadeDelay(a5)
	move.w	#$3,g_SceneVar3B02(a5)
	clr.b	g_PalBaseDirty(a5)
	lea.l	$C(a7),a7
	bra.s	loc_06569A
