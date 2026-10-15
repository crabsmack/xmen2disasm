; ---------------------------------------------------------------------------
; sub_04E81A	[link-after-rts]
; ---------------------------------------------------------------------------
sub_04E81A:
	link.w	a6,#$0
	movem.l	d6-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$8(a4),d6
	move.l	$C(a4),d7
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d7,-(a7)
	move.l	d6,-(a7)
	jsr	$2DCA(a5)	; -> Explosion_Spawn
	pea.l	($D2).w
	move.l	d7,-(a7)
	move.l	d6,-(a7)
	jsr	$2CE2(a5)	; -> SegmentPlusPowerUp_Spawn
	lea.l	$B6A(a5),a0
	move.l	$2(a0),g_CamShake(a5)
	moveq	#$C,d0
	cmp.w	-$3B0C(a5),d0
	lea.l	$18(a7),a7
	ble.s	loc_04E860
	addq.w	#$1,-$3B0C(a5)
loc_04E860:
	moveq	#$C,d0
	cmp.w	-$3B0C(a5),d0
	bne.s	loc_04E86E
	jsr	$9AA(a5)	; -> unk_BaniMazaA2_04766A
	bra.s	loc_04E872
loc_04E86E:
	jsr	$9A2(a5)	; -> BaniMazaA2_SetPaletteStep
loc_04E872:
	movem.l	-$C(a6),d6-d7/a4
	unlk	a6
	rts
