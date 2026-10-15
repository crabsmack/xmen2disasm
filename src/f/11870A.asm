; ---------------------------------------------------------------------------
; ICandy_Draw - ICandy: place the sprite at its camera-relative position
; In:  8(a6) = this
; Out: none
; Evidence: method 4 of ICANDY; sub_1FB346(this+$1C, x - camera x, y - camera y)
; ---------------------------------------------------------------------------
ICandy_Draw:
	link.w	a6,#$0
	movem.l	d6-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.w	g_CameraX(a5),d1
	ext.l	d1
	move.l	d0,d6
	sub.l	d1,d6
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.w	g_CameraY(a5),d1
	ext.l	d1
	move.l	d0,d7
	sub.l	d1,d7
	ext.l	d7
	move.l	d7,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	pea.l	$1C(a4)
	jsr	$508A(a5)	; -> Spr_Draw
	movem.l	-$C(a6),d6-d7/a4
	unlk	a6
	rts
