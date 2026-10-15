; ---------------------------------------------------------------------------
; BigBio_SpitSpawn - BIGBIO: launch a spit projectile (max 8) from its mouth, diagonally toward its facing
; In:  8(a6) = this  $F(a6) = byte kind
; Out: none
; Evidence: pool $FFE770 (16-byte records), count $FFE76E; speed +-$900
; ---------------------------------------------------------------------------
BigBio_SpitSpawn:
	link.w	a6,#$0
	movem.l	d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	moveq	#$8,d0
	cmp.w	-$1A92(a5),d0
	ble.s	loc_12162A
	tst.b	$B6(a3)
	beq.s	loc_1215C6
	move.w	#$2E00,d0
	bra.s	loc_1215CA
loc_1215C6:
	move.w	#$D200,d0
loc_1215CA:
	ext.l	d0
	move.l	d0,d7
	move.w	-$1A92(a5),d0
	addq.w	#$1,-$1A92(a5)
	ext.l	d0
	movea.l	-$1A90(a5),a0
	asl.l	#$4,d0
	lea.l	(a0,d0.l),a4
	move.l	d7,d0
	add.l	$8(a3),d0
	add.l	#$FFFFF900,d0
	move.l	d0,(a4)
	move.l	$C(a3),d0
	add.l	#$FFFFC000,d0
	move.l	d0,$4(a4)
	clr.w	$8(a4)
	move.b	$F(a6),$E(a4)
	clr.b	$F(a4)
	tst.b	$B6(a3)
	beq.s	loc_12161A
	move.l	#$900,d0
	bra.s	loc_121620
loc_12161A:
	move.l	#$FFFFF700,d0
loc_121620:
	move.w	d0,$A(a4)
	move.w	#$900,$C(a4)
loc_12162A:
	movem.l	-$C(a6),d7/a3-a4
	unlk	a6
	rts
