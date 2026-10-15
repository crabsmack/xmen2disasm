; ---------------------------------------------------------------------------
; sub_0C0F88	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0C0F88:
	link.w	a6,#$FFFE
	movem.l	d4-d7,-(a7)
	move.w	$E(a6),d5
	move.w	$16(a6),d6
	move.w	$12(a6),d7
	move.w	d5,d4
	asr.w	#$2,d4
	ext.l	d4
	move.l	d4,-(a7)
	move.l	-$3C0E(a5),-(a7)
	jsr	$507A(a5)	; -> Spr_SetFrame
	sub.w	g_CameraX(a5),d7
	sub.w	g_CameraY(a5),d6
	ext.l	d6
	move.l	d6,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	move.l	-$3C0E(a5),-(a7)
	jsr	$508A(a5)	; -> Spr_Draw
	lea.l	$14(a7),a7
	movem.l	-$12(a6),d4-d7
	unlk	a6
	rts
