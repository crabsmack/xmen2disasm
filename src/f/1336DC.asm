; ---------------------------------------------------------------------------
; BrainRocket_Update - ACTOR Update, then if still alive test the map block at the previous position (Tile_TestAt, mask $4800): on a hit shake the camera (vertical shake for headings 90/270), explode at the box centre, Kill, sound $38 (BRAINROCKET override of slot 17, +$4A)
; In:  8(a6) = this
; Out: d0 = garbage
; Evidence: method 17 of class descriptor $133CFC (name string "BRAINROCKET", parent ACTOR)
; ---------------------------------------------------------------------------
BrainRocket_Update:
	link.w	a6,#$0
	movem.l	d3/d6-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$8(a4),d6
	asr.l	#$8,d6
	move.l	$C(a4),d7
	asr.l	#$8,d7
	move.l	a4,-(a7)
	lea.l	$361A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$4A(a0),a1
	jsr	(a1)
	moveq	#$10,d0
	and.w	$4(a4),d0
	addq.w	#$4,a7
	bne.w	loc_1337B0
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	($4800).w
	tst.b	g_SolidMapIsBg(a5)
	seq.b	d3
	neg.b	d3
	ext.w	d3
	ext.l	d3
	move.l	d3,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	move.l	a4,-(a7)
	jsr	$3FC2(a5)	; -> Tile_TestAt
	tst.b	d0
	lea.l	$18(a7),a7
	beq.s	loc_1337B0
	moveq	#$5A,d0
	cmp.w	$8C(a4),d0
	beq.s	loc_133750
	cmpi.w	#$10E,$8C(a4)
	bne.s	loc_13375C
loc_133750:
	lea.l	$3652(a5),a0
	move.l	$2(a0),g_CamShake(a5)
	bra.s	loc_133766
loc_13375C:
	lea.l	$364A(a5),a0
	move.l	$2(a0),g_CamShake(a5)
loc_133766:
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.w	$4C(a4),d1
	ext.l	d1
	move.w	$50(a4),d2
	ext.l	d2
	add.l	d1,d2
	lsl.l	#$7,d2
	move.l	d2,-(a7)
	move.w	$52(a4),d1
	ext.l	d1
	move.w	$4E(a4),d2
	ext.l	d2
	add.l	d1,d2
	lsl.l	#$7,d2
	move.l	d2,-(a7)
	jsr	$2DCA(a5)	; -> Explosion_Spawn
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	moveq	#$38,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$38,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	lea.l	$18(a7),a7
loc_1337B0:
	movem.l	-$10(a6),d3/d6-d7/a4
	unlk	a6
	rts
