; ---------------------------------------------------------------------------
; sub_160FFE	[link-after-rts]
; ---------------------------------------------------------------------------
sub_160FFE:
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
	jsr	$4E32(a5)	; -> sub_1F5F78
	movea.l	-$4(a6),a4
	unlk	a6
	rts
