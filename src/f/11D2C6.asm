; ---------------------------------------------------------------------------
; BabyBio_ActFireLoop - BABYBIO firing: when on screen fire a GaussBullet from the muzzle (13,-31, mirrored), every 16 frames, +$B9 shots, then next entry after +$B6
; In:  8(a6) = this
; Out: d0
; Evidence: GaussBullet_Fire(.., this, dx, dy, flags | 2); TAS 30939-57271
; ---------------------------------------------------------------------------
BabyBio_ActFireLoop:
	link.w	a6,#$FFFC
	movem.l	d4-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$9C(a4),d6
	asr.l	#$8,d6
	cmp.w	g_CameraX(a5),d6
	ble.w	loc_11D37A
	ext.l	d6
	move.w	g_CameraX(a5),d0
	ext.l	d0
	add.l	#$140,d0
	cmp.l	d6,d0
	ble.w	loc_11D37A
	moveq	#$D,d6
	moveq	#-$1F,d7
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	move.l	$8(a4),-$4(a6)
	move.l	$C(a4),d4
	moveq	#$4,d0
	and.b	$2E(a4),d0
	beq.s	loc_11D31E
	move.l	#$8000,d0
	bra.s	loc_11D320
loc_11D31E:
	moveq	#$0,d0
loc_11D320:
	move.l	d0,d5
	moveq	#$8,d0
	and.b	$2E(a4),d0
	beq.s	loc_11D332
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
	move.w	d0,d7
loc_11D332:
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_11D348
	ext.l	d6
	move.l	d6,d0
	neg.l	d0
	move.w	d0,d6
	ori.l	#$800,d5
loc_11D348:
	ext.l	d6
	move.l	d6,d0
	lsl.l	#$8,d0
	add.l	d0,-$4(a6)
	ext.l	d7
	move.l	d7,d0
	lsl.l	#$8,d0
	add.l	d0,d4
	ori.l	#$2,d5
	move.l	d5,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	move.l	a4,-(a7)
	move.l	d4,-(a7)
	move.l	-$4(a6),-(a7)
	jsr	$2E92(a5)	; -> GaussBullet_Fire
	lea.l	$18(a7),a7
loc_11D37A:
	subq.b	#$1,$B9(a4)
	moveq	#$0,d0
	move.b	$B9(a4),d0
	tst.l	d0
	bhi.s	loc_11D3D4
	tst.l	$98(a4)
	bne.s	loc_11D3A0
	move.l	$64(a4),$5C(a4)
	moveq	#$0,d0
	move.b	$B6(a4),d0
	move.w	d0,$6C(a4)
	bra.s	loc_11D3E8
loc_11D3A0:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_11D3B4
	clr.w	$96(a4)
loc_11D3B4:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	moveq	#$0,d0
	move.b	$B6(a4),d0
	move.w	d0,$6C(a4)
	bra.s	loc_11D3E8
loc_11D3D4:
	move.w	#$10,$6C(a4)
	lea.l	BabyBio_ActFireLoop(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_11D3E8:
	movem.l	-$18(a6),d4-d7/a4
	unlk	a6
	rts
