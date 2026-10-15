; ---------------------------------------------------------------------------
; MagnetoBoss_StateZone0 - MAGNETOBOSS: shoot at the target whenever the cooldown ends until the camera reaches x $1A4, then lock camera zone 1
; In:  8(a6) = this
; Out: none
; Evidence: cooldown +$AC reloaded from +$AA, shot delay +$9D; AvalonA4_SetCameraZone(1, $1A4, $B0, 4, 4); next MagnetoBoss_Zone1Setup
; ---------------------------------------------------------------------------
MagnetoBoss_StateZone0:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	cmpi.w	#$1A4,g_CameraX(a5)
	blt.s	loc_036F00
	moveq	#$4,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	pea.l	($B0).w
	pea.l	($1A4).w
	moveq	#$1,d1
	move.l	d1,-(a7)
	jsr	$72A(a5)	; -> AvalonA4_SetCameraZone
	lea.l	$14(a7),a7
	clr.w	$6C(a4)
	lea.l	MagnetoBoss_Zone1Setup(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_036F48
loc_036F00:
	tst.l	$8C(a4)
	beq.s	loc_036F48
	tst.w	$AC(a4)
	bne.s	loc_036F48
	move.w	$AA(a4),$AC(a4)
	moveq	#$0,d0
	move.b	$9D(a4),d0
	cmpi.w	#$FFFF,d0
	bne.s	loc_036F30
	lea.l	MagnetoBoss_StateAimShoot(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	MagnetoBoss_StateAimShoot(pc)
	addq.w	#$4,a7
	bra.s	loc_036F48
loc_036F30:
	moveq	#$0,d0
	move.b	$9D(a4),d0
	move.w	d0,$6C(a4)
	lea.l	MagnetoBoss_StateAimShoot(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_036F48:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
