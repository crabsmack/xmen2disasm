; ---------------------------------------------------------------------------
; Gambit_UpdateCard_TrailLoop - Gambit_UpdateCard trail loop body: stop at Gambit's body, else emit one sparkle sprite
; In:  a6 frame of Gambit_UpdateCard
; Out: none
; Evidence: inner label of Gambit_UpdateCard's trail loop
; ---------------------------------------------------------------------------
Gambit_UpdateCard_TrailLoop:
	clr.w	d4
	bra.s	loc_1CF760
loc_1CF752:
	move.w	#$1000,d4
	bra.s	loc_1CF760
loc_1CF758:
	clr.w	d4
	bra.s	loc_1CF760
loc_1CF75C:
	move.w	#$1800,d4
loc_1CF760:
	ext.l	d6
	move.w	g_CameraY(a5),d0
	ext.l	d0
	add.l	d6,d0
	move.l	d0,-(a7)
	ext.l	d5
	move.w	g_CameraX(a5),d0
	ext.l	d0
	add.l	d5,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	move.l	a3,-(a7)
	jsr	Gambit_PointNearBody(pc)
	tst.b	d0
	lea.l	$10(a7),a7
	bne.s	loc_1CF7F0
	lea.l	g_SpriteTable(a5),a0
	movea.l	g_SprWritePtr(a5),a1
	move.b	$3(a1),d0
	ext.w	d0
	move.w	d0,g_SprIndex(a5)
	ext.l	d0
	asl.l	#$3,d0
	add.l	a0,d0
	move.l	d0,g_SprWritePtr(a5)
	move.w	d6,d0
	sub.w	#$FF84,d0
	movea.l	g_SprWritePtr(a5),a0
	move.w	d0,(a0)
	movea.l	g_SprWritePtr(a5),a0
	clr.b	$2(a0)
	move.w	#$2000,d0
	or.w	-$E(a6),d0
	ext.l	d0
	move.l	#$8000,d1
	or.l	d0,d1
	ext.l	d4
	move.l	d4,d0
	or.l	d1,d0
	movea.l	g_SprWritePtr(a5),a0
	move.w	d0,$4(a0)
	move.w	d5,d0
	sub.w	#$FF84,d0
	movea.l	g_SprWritePtr(a5),a0
	move.w	d0,$6(a0)
