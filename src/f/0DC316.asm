; ---------------------------------------------------------------------------
; SentinelsD1_InitLight - SentinelsD1: set up the warning-light sprite (art $0DB72C)
; In:  none
; Out: none
; Evidence: Spr_Init at VRAM -$3AAE; TAS 2503-9698
; Found: jt 1147
; ---------------------------------------------------------------------------
SentinelsD1_InitLight:
	link.w	a6,#$0
	jsr	SentinelsD1_EmptyStub(pc)
	move.w	#$5,-$3B32(a5)
	clr.w	-$3B3A(a5)
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.w	g_FgTilesEnd(a5),d1
	ext.l	d1
	move.l	d1,-(a7)
	moveq	#$0,d1
	move.l	d1,-(a7)
	move.l	d1,-(a7)
	lea.l	$23D2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d0,-(a7)
	pea.l	g_SceneSprites(a5)
	jsr	$506A(a5)	; -> Spr_Init
	unlk	a6
	rts
