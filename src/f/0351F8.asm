; ---------------------------------------------------------------------------
; AvalonA4_GlobCrackBlockHook - map tile hook: a block hit by a MAGNETICGLOB cracks one stage ($8D -> $AD -> $AE -> $AF -> $B0) and finally explodes into tile $8E
; In:  8(a6) = word column, $C(a6) = word row, $10(a6) = hitting object
; Out: d0 = 0
; Evidence: object class jt[1993] = $159B2C (MAGNETICGLOB, Magneto's globe); sub_118136 explosion; sound $1A; installed in -$3AF0
; ---------------------------------------------------------------------------
AvalonA4_GlobCrackBlockHook:
	link.w	a6,#$0
	movem.l	d4-d7,-(a7)
	move.w	$E(a6),d6
	move.w	$A(a6),d7
	movea.l	$10(a6),a0
	move.l	(a0),d0
	cmp.l	$3E6C(a5),d0
	beq.s	loc_03521A
	moveq	#$0,d0
	bra.w	loc_035318
loc_03521A:
	ext.l	d6
	movea.l	-$3A72(a5),a0
	move.l	d6,d0
	add.l	d0,d0
	move.w	(a0,d0.l),d0
	ext.l	d0
	ext.l	d7
	add.l	d7,d0
	movea.l	-$3A84(a5),a0
	add.l	d0,d0
	move.w	#$1FF,d5
	and.w	(a0,d0.l),d5
	cmpi.w	#$8D,d5
	bne.s	loc_03525E
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	($AD).w
	ext.l	d6
	move.l	d6,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	jsr	$3FDA(a5)	; -> sub_15D7F8
	lea.l	$10(a7),a7
	bra.w	loc_035304
loc_03525E:
	cmpi.w	#$AD,d5
	bne.s	loc_035280
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	($AE).w
	ext.l	d6
	move.l	d6,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	jsr	$3FDA(a5)	; -> sub_15D7F8
	lea.l	$10(a7),a7
	bra.w	loc_035304
loc_035280:
	cmpi.w	#$AE,d5
	bne.s	loc_0352A0
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	($AF).w
	ext.l	d6
	move.l	d6,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	jsr	$3FDA(a5)	; -> sub_15D7F8
	lea.l	$10(a7),a7
	bra.s	loc_035304
loc_0352A0:
	cmpi.w	#$AF,d5
	bne.s	loc_0352C0
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	($B0).w
	ext.l	d6
	move.l	d6,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	jsr	$3FDA(a5)	; -> sub_15D7F8
	lea.l	$10(a7),a7
	bra.s	loc_035304
loc_0352C0:
	cmpi.w	#$B0,d5
	bne.s	loc_035304
	ext.l	d7
	move.l	d7,d0
	lsl.l	#$5,d0
	moveq	#$10,d1
	add.l	d1,d0
	move.l	d0,d4
	lsl.l	#$8,d4
	ext.l	d6
	move.l	d6,d0
	lsl.l	#$5,d0
	add.l	d1,d0
	move.l	d0,d5
	lsl.l	#$8,d5
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d5,-(a7)
	move.l	d4,-(a7)
	jsr	$2DCA(a5)	; -> Explosion_Spawn
	moveq	#$0,d0
	move.l	d0,-(a7)
	pea.l	($8E).w
	ext.l	d6
	move.l	d6,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	jsr	$3FDA(a5)	; -> sub_15D7F8
	lea.l	$1C(a7),a7
loc_035304:
	moveq	#$1A,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$1A,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	addq.w	#$8,a7
	moveq	#$0,d0
loc_035318:
	movem.l	-$10(a6),d4-d7
	unlk	a6
	rts
