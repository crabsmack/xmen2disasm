; ---------------------------------------------------------------------------
; MagnetoBoss_StateZone4 - MAGNETOBOSS zone 4: shoot and switch sides until the wall at column $39 is broken, then release the zone
; In:  8(a6) = this
; Out: d0
; Evidence: AvalonA4_ClearCameraZone(4); next MagnetoBoss_Zone4Exit
; ---------------------------------------------------------------------------
MagnetoBoss_StateZone4:
	link.w	a6,#$0
	movem.l	d5-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$8C(a4),a3
	move.l	a3,d0
	beq.w	loc_0376B8
	move.l	$8(a3),d6
	asr.l	#$8,d6
	move.b	$B2(a4),d7
	movea.l	-$3A72(a5),a0
	move.w	$14(a0),d0
	ext.l	d0
	moveq	#$39,d1
	add.l	d1,d0
	movea.l	-$3A84(a5),a0
	add.l	d0,d0
	move.w	#$3800,d2
	and.w	(a0,d0.l),d2
	moveq	#$B,d0
	move.w	d2,d5
	lsr.w	d0,d5
	tst.w	d5
	bne.s	loc_03761C
	moveq	#$4,d0
	move.l	d0,-(a7)
	jsr	$722(a5)	; -> AvalonA4_ClearCameraZone
	andi.b	#$F1,$9B(a4)
	move.w	#$FF9C,$A6(a4)
	move.w	#$1F40,$A8(a4)
	addq.w	#$4,a7
	clr.w	$6C(a4)
	lea.l	MagnetoBoss_Zone4Exit(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	loc_0376B8
loc_03761C:
	tst.w	$AC(a4)
	bne.s	loc_037666
	move.l	$8(a4),d5
	asr.l	#$8,d5
	move.w	$AA(a4),$AC(a4)
	moveq	#$0,d0
	move.b	$9D(a4),d0
	cmpi.w	#$FFFF,d0
	bne.s	loc_03764C
	lea.l	MagnetoBoss_StateAimShoot(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	MagnetoBoss_StateAimShoot(pc)
	addq.w	#$4,a7
	bra.s	loc_0376B8
loc_03764C:
	moveq	#$0,d0
	move.b	$9D(a4),d0
	move.w	d0,$6C(a4)
	lea.l	MagnetoBoss_StateAimShoot(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_0376B8
loc_037666:
	moveq	#$0,d0
	move.b	d7,d0
	cmpi.w	#$2,d0
	bne.s	loc_037690
	ext.l	d6
	move.w	g_CameraX(a5),d0
	ext.l	d0
	add.l	#$C0,d0
	cmp.l	d6,d0
	bge.s	loc_0376B8
	andi.b	#$F3,$9B(a4)
	move.b	#$3,$B2(a4)
	bra.s	loc_0376B8
loc_037690:
	moveq	#$0,d0
	move.b	d7,d0
	cmpi.w	#$3,d0
	bne.s	loc_0376B8
	ext.l	d6
	move.w	g_CameraX(a5),d0
	ext.l	d0
	add.l	#$80,d0
	cmp.l	d6,d0
	ble.s	loc_0376B8
	andi.b	#$F3,$9B(a4)
	move.b	#$2,$B2(a4)
loc_0376B8:
	movem.l	-$14(a6),d5-d7/a3-a4
	unlk	a6
	rts
