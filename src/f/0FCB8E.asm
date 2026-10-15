; ---------------------------------------------------------------------------
; SiberiaB1_InitWindSprite - SiberiaB1: set up the wind-indicator sprite and its palette row
; In:  none
; Out: none
; Evidence: sub_1FB026 slot $FFCC6A art $0FB322, Map_SetRowPalette
; ---------------------------------------------------------------------------
SiberiaB1_InitWindSprite:
	link.w	a6,#$0
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.w	-$3AAE(a5),d1
	ext.l	d1
	move.l	d1,-(a7)
	moveq	#$2,d1
	move.l	d1,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$297A(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	-$3596(a5)
	jsr	$506A(a5)	; -> Spr_Init
	moveq	#$2,d0
	move.l	d0,-(a7)
	moveq	#$1,d1
	move.l	d1,-(a7)
	move.w	-$3AA8(a5),d2
	ext.l	d2
	move.l	d2,-(a7)
	move.l	-$3AA6(a5),-(a7)
	jsr	$4E12(a5)	; -> Map_SetRowPalette
	clr.w	-$3B3A(a5)
	unlk	a6
	rts
