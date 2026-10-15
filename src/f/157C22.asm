; ---------------------------------------------------------------------------
; MagneticGlob_Draw - MAGNETICGLOB slot +$1A: draw the bolt at its screen position
; In:  8(a6) = bolt
; Out: none
; Evidence: Spr_Draw(+$2E, x - g_CameraX, y - g_CameraY)
; ---------------------------------------------------------------------------
MagneticGlob_Draw:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.w	g_CameraY(a5),d1
	ext.l	d1
	sub.l	d1,d0
	move.l	d0,-(a7)
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.w	g_CameraX(a5),d1
	ext.l	d1
	sub.l	d1,d0
	move.l	d0,-(a7)
	pea.l	$2E(a4)
	jsr	$508A(a5)	; -> Spr_Draw
	movea.l	-$4(a6),a4
	unlk	a6
	rts
