; ---------------------------------------------------------------------------
; FluxBomb_StartImplode - start the implosion: place 16 particles around the bomb and upload their tiles
; In:  8(a6) = bomb
; Out: d0
; Evidence: +$100 = 1; VDP_QueueDma of two particle tiles (Art_FluxBombTiles (jt $47C2)/$49CA data) to the bomb's VRAM; particle start = -(dx, dy) << shift from the table
; ---------------------------------------------------------------------------
FluxBomb_StartImplode:
	link.w	a6,#$0
	movem.l	d3/d7/a3-a4,-(a7)
	movea.l	$8(a6),a0
	lea.l	$9E(a0),a3
	lea.l	$479A(a5),a0
	movea.l	$2(a0),a4
	movea.l	$8(a6),a0
	tst.b	$FF(a0)
	beq.s	loc_158562
	lea.l	$47A2(a5),a0
	movea.l	$2(a0),a0
	bra.s	loc_15856A
loc_158562:
	lea.l	$479A(a5),a0
	movea.l	$2(a0),a0
loc_15856A:
	movea.l	a0,a4
	movea.l	$8(a6),a0
	move.b	#$1,$100(a0)
	moveq	#$20,d0
	move.l	d0,-(a7)
	move.w	g_FluxBombSpr+$6(a5),d1
	ext.l	d1
	move.w	g_FluxBombSpr+$8(a5),d2
	ext.l	d2
	add.l	d1,d2
	subq.l	#$1,d2
	lsl.l	#$5,d2
	move.l	d2,-(a7)
	lea.l	$47C2(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$51DA(a5)	; -> VDP_QueueDma
	moveq	#$20,d0
	move.l	d0,-(a7)
	move.w	g_FluxBombSpr+$6(a5),d1
	ext.l	d1
	move.w	g_FluxBombSpr+$8(a5),d2
	ext.l	d2
	add.l	d1,d2
	subq.l	#$2,d2
	lsl.l	#$5,d2
	move.l	d2,-(a7)
	lea.l	$47CA(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$51DA(a5)	; -> VDP_QueueDma
	clr.w	d7
	moveq	#$10,d3
	lea.l	$18(a7),a7
loc_1585C6:
	tst.w	(a4)
	bne.s	loc_1585D0
	andi.w	#$FFFE,(a3)
	bra.s	loc_1585FC
loc_1585D0:
	move.b	(a4),d0
	ext.w	d0
	ext.l	d0
	move.w	$2(a4),d1
	lsl.l	d1,d0
	neg.l	d0
	move.w	d0,$2(a3)
	move.b	$1(a4),d0
	ext.w	d0
	ext.l	d0
	move.w	$2(a4),d1
	lsl.l	d1,d0
	neg.l	d0
	move.w	d0,$4(a3)
	ori.w	#$1,(a3)
	addq.w	#$4,a4
loc_1585FC:
	addq.w	#$6,a3
	move.w	d7,d0
	addq.w	#$1,d7
	cmp.w	d7,d3
	bgt.s	loc_1585C6
	movem.l	-$10(a6),d3/d7/a3-a4
	unlk	a6
	rts
