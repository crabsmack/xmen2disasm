; ---------------------------------------------------------------------------
; ControlBox_Draw - vtable +$1A: draw a CONTROLBOX
; In:  8(a6) = this
; Evidence: slot +$1A of the CONTROLBOX descriptor $0DDA02; TAS frames 2523-7268 (2540 frames active); calls parent ACTOR slot +$1A
; ---------------------------------------------------------------------------
ControlBox_Draw:
	link.w	a6,#$FFFC
	movem.l	d6-d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	moveq	#$1,d0
	cmp.w	$9A(a3),d0
	bne.s	loc_0DD7E4
	move.w	-$3BFC(a5),d0
	ext.l	d0
	lsl.l	#$2,d0
	move.l	d0,d1
	lsl.l	#$2,d0
	add.l	d1,d0
	lea.l	g_SpriteDefs(a5),a0
	adda.w	d0,a0
	move.l	a0,-$4(a6)
	move.w	$94(a3),d0
	ext.l	d0
	movea.l	$90(a3),a0
	asl.l	#$2,d0
	lea.l	$2(a0,d0.l),a4
	move.l	$8(a3),d0
	asr.l	#$8,d0
	move.w	g_CameraX(a5),d1
	ext.l	d1
	sub.l	d1,d0
	move.b	(a4),d1
	ext.w	d1
	ext.l	d1
	move.l	d1,d6
	add.l	d0,d6
	move.l	$C(a3),d0
	asr.l	#$8,d0
	move.w	g_CameraY(a5),d1
	ext.l	d1
	sub.l	d1,d0
	move.b	$1(a4),d1
	ext.w	d1
	ext.l	d1
	move.l	d1,d7
	add.l	d0,d7
	movea.l	-$4(a6),a0
	move.b	$2(a4),$1(a0)
	move.l	d7,-(a7)
	move.l	d6,-(a7)
	move.l	-$4(a6),-(a7)
	jsr	$508A(a5)	; -> Spr_Draw
	lea.l	$C(a7),a7
	bra.s	loc_0DD7FA
loc_0DD7E4:
	move.l	a3,-(a7)
	lea.l	$2522(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$1A(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
loc_0DD7FA:
	movem.l	-$14(a6),d6-d7/a3-a4
	unlk	a6
	rts
