; ---------------------------------------------------------------------------
; EvilBeam_Draw - EVILBEAM slot +$12 (draw-list callback): draw the beam sprite
; In:  8(a6) = this
; Out: none
; Evidence: Spr_Draw(this+$10, x - g_CameraX, y - g_CameraY)
; Found: jt 771
; ---------------------------------------------------------------------------
EvilBeam_Draw:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$6(a4),d0
	ext.l	d0
	move.w	g_CameraY(a5),d1
	ext.l	d1
	sub.l	d1,d0
	move.l	d0,-(a7)
	move.w	$4(a4),d0
	ext.l	d0
	move.w	g_CameraX(a5),d1
	ext.l	d1
	sub.l	d1,d0
	move.l	d0,-(a7)
	pea.l	$10(a4)
	jsr	$508A(a5)	; -> Spr_Draw
	movea.l	-$4(a6),a4
	unlk	a6
	rts
