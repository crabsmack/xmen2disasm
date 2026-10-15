; ---------------------------------------------------------------------------
; GaussBullet_UpdateAll - timer: update every live GAUSSBULLET record
; In:  none
; Out: none
; Evidence: Timer_Create(GaussBullet_UpdateAll) in GaussBullet_InitPool; TAS 2516-57465 every frame
; ---------------------------------------------------------------------------
GaussBullet_UpdateAll:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	tst.b	-$38DE(a5)
	beq.s	loc_119098
	moveq	#$2,d0
	bra.s	loc_11909A
loc_119098:
	moveq	#$1,d0
loc_11909A:
	move.w	d0,d7
	movea.l	-$1CAC(a5),a0
	tst.w	(a0)
	beq.s	loc_1190CC
	lea.l	$8(a0),a4
	bra.s	loc_1190BA
loc_1190AA:
	ext.l	d7
	move.l	d7,-(a7)
	move.l	a4,-(a7)
	jsr	GaussBullet_Update(pc)
	addq.w	#$8,a7
	lea.l	$20(a4),a4
loc_1190BA:
	movea.l	-$1CAC(a5),a0
	move.w	(a0),d0
	ext.l	d0
	asl.l	#$5,d0
	lea.l	$8(a0,d0.l),a0
	cmpa.l	a4,a0
	bhi.s	loc_1190AA
loc_1190CC:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
