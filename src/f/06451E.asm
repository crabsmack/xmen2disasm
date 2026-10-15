; ---------------------------------------------------------------------------
; Cerebro_BigSpriteDraw - upload a big sprite's tiles if needed and draw it
; In:  8(a6) = record
; Out: none
; Evidence: VDP_QueueDma(buffer, tile*32, tiles*32) when +$31 clear; sub_1FD520(x, y, tile, flags)
; ---------------------------------------------------------------------------
Cerebro_BigSpriteDraw:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.b	$31(a4)
	bne.s	loc_064554
	move.w	$8(a4),d0
	ext.l	d0
	lsl.l	#$5,d0
	move.l	d0,-(a7)
	move.w	$A(a4),d0
	ext.l	d0
	lsl.l	#$5,d0
	move.l	d0,-(a7)
	move.l	-$C9E(a5),-(a7)
	jsr	$51DA(a5)	; -> VDP_QueueDma
	move.b	#$1,$31(a4)
	lea.l	$C(a7),a7
loc_064554:
	moveq	#$0,d0
	move.b	$30(a4),d0
	move.l	d0,-(a7)
	move.w	$C(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	$12(a4),d0
	swap	d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	$E(a4),d0
	swap	d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	$50C2(a5)	; -> sub_1FD520
	lea.l	$10(a7),a7
	movea.l	-$4(a6),a4
	unlk	a6
	rts
