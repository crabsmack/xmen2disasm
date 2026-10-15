; ---------------------------------------------------------------------------
; FluxBomb_StartBurst - start the explosion: damage the area and begin the outward particle burst
; In:  8(a6) = bomb
; Out: d0
; Evidence: +$6E = 6 (15 strong), +$100 = 3, FluxBomb_DamageArea, +$101 = 0, particle tiles DMA, particles reset to the centre
; ---------------------------------------------------------------------------
FluxBomb_StartBurst:
	link.w	a6,#$0
	movem.l	d3/d7/a3-a4,-(a7)
	movea.l	$8(a6),a0
	lea.l	$9E(a0),a4
	tst.b	$FF(a0)
	beq.s	loc_1589BC
	lea.l	$47B2(a5),a0
	movea.l	$2(a0),a3
	movea.l	$8(a6),a0
	move.w	#$F,$6E(a0)
	bra.s	loc_1589CE
loc_1589BC:
	lea.l	$47AA(a5),a0
	movea.l	$2(a0),a3
	movea.l	$8(a6),a0
	move.w	#$6,$6E(a0)
loc_1589CE:
	movea.l	$8(a6),a0
	move.b	#$3,$100(a0)
	move.l	$8(a6),-(a7)
	jsr	FluxBomb_DamageArea(pc)
	movea.l	$8(a6),a0
	clr.b	$101(a0)
	moveq	#$20,d0
	move.l	d0,-(a7)
	move.w	-$1A62(a5),d1
	ext.l	d1
	move.w	-$1A60(a5),d2
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
	move.w	-$1A62(a5),d1
	ext.l	d1
	move.w	-$1A60(a5),d2
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
	lea.l	$1C(a7),a7
loc_158A38:
	tst.w	(a3)
	bne.s	loc_158A42
	andi.w	#$FFFE,(a4)
	bra.s	loc_158A4C
loc_158A42:
	clr.l	$2(a4)
	ori.w	#$1,(a4)
	addq.w	#$2,a3
loc_158A4C:
	addq.w	#$6,a4
	move.w	d7,d0
	addq.w	#$1,d7
	cmp.w	d7,d3
	bgt.s	loc_158A38
	movem.l	-$10(a6),d3/d7/a3-a4
	unlk	a6
	rts
