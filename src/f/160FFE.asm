; ---------------------------------------------------------------------------
; Cam_ApplyPos - camera step (+$C): set the scroll position = camera position + transition offset (+ look offset in y)
; In:  8(a6) = this
; Out: none
; Evidence: Cam_SetPos(+$30 + +$2C, +$32 + +$2E + +$5C); last step of Cam_DefaultUpdate
; ---------------------------------------------------------------------------
Cam_ApplyPos:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$32(a4),d0
	ext.l	d0
	move.w	$2E(a4),d1
	ext.l	d1
	add.l	d0,d1
	move.w	$5C(a4),d0
	ext.l	d0
	add.l	d1,d0
	move.l	d0,-(a7)
	move.w	$30(a4),d0
	ext.l	d0
	move.w	$2C(a4),d1
	ext.l	d1
	add.l	d0,d1
	move.l	d1,-(a7)
	jsr	$4E32(a5)	; -> Cam_SetPos
	movea.l	-$4(a6),a4
	unlk	a6
	rts
