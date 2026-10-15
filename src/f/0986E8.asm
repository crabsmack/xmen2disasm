; ---------------------------------------------------------------------------
; EvilNightcrawler_StateFall - EVILNIGHTCRAWLER state: fall using the Nightcrawler player's slot +$7E until reaching the floor, then land
; In:  8(a6) = this
; Out: d0
; Evidence: calls NIGHTCRAWLER ($113496) slot +$7E while y < +$A6; next EvilNightcrawler_StateLand
; Found: link-after-rts
; ---------------------------------------------------------------------------
EvilNightcrawler_StateFall:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$C(a4),d7
	asr.l	#$8,d7
	cmp.w	$A6(a4),d7
	blt.s	loc_098720
	move.w	$A6(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$C(a4)
	clr.w	$6C(a4)
	lea.l	EvilNightcrawler_StateLand(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_098744
loc_098720:
	move.l	a4,-(a7)
	lea.l	$2BA2(a5),a0
	movea.l	$2(a0),a0
	movea.l	$7E(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	clr.w	$6C(a4)
	lea.l	EvilNightcrawler_StateFall(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_098744:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
