; ---------------------------------------------------------------------------
; Spr_UploadFrame18 - queue DMA of the current frame tiles of a raw-tile (type $18) sprite instance
; In:  8(a6) = sprite instance
; Out: d0 = last piece index
; Evidence: same loop as Spr_UploadFrame's type $18 path, always via VDP_QueueDma: 8-byte pieces, tile count (byte +5 >> 4) + 1, tile data offset +6; only caller sub_1F1A2E
; ---------------------------------------------------------------------------
Spr_UploadFrame18:
	link.w	a6,#$FFFA
	movem.l	d4-d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	moveq	#$0,d4
	move.b	$A(a3),d4
	move.b	$1(a3),$A(a3)
	moveq	#$0,d0
	move.b	$1(a3),d0
	cmpi.w	#$FF,d0
	beq.w	loc_1F1A24
	move.l	$2(a3),-$6(a6)
	ori.b	#$20,(a3)
	moveq	#$0,d4
	move.b	$1(a3),d4
	move.l	-$6(a6),d0
	moveq	#$24,d1
	add.l	d1,d0
	ext.l	d4
	move.l	d4,d2
	lsl.l	#$4,d2
	add.l	d0,d2
	ext.l	d4
	move.l	d4,d0
	lsl.l	#$2,d0
	movea.l	d0,a4
	adda.l	d2,a4
	move.w	$6(a3),d4
	moveq	#$0,d0
	move.w	$12(a4),d0
	tst.l	d0
	movea.l	d0,a3
	adda.l	-$6(a6),a3
	move.b	$10(a4),d0
	ext.w	d0
	move.w	d0,-$2(a6)
	clr.w	d6
	bra.s	loc_1F1A1E
loc_1F19DE:
	moveq	#$0,d7
	move.w	$6(a3),d7
	tst.l	d7
	ble.s	loc_1F1A18
	movea.l	d7,a4
	adda.l	-$6(a6),a4
	move.b	$5(a3),d0
	lsr.b	#$4,d0
	moveq	#$0,d1
	move.b	d0,d1
	move.w	d1,d5
	addq.w	#$1,d5
	ext.l	d5
	move.l	d5,d0
	lsl.l	#$5,d0
	move.l	d0,-(a7)
	ext.l	d4
	move.l	d4,d0
	lsl.l	#$5,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$51DA(a5)	; -> VDP_QueueDma
	add.w	d5,d4
	lea.l	$C(a7),a7
loc_1F1A18:
	addq.l	#$8,a3
	move.w	d6,d0
	addq.w	#$1,d6
loc_1F1A1E:
	cmp.w	-$2(a6),d6
	blt.s	loc_1F19DE
loc_1F1A24:
	movem.l	-$1E(a6),d4-d7/a3-a4
	unlk	a6
	rts
