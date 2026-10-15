; ---------------------------------------------------------------------------
; SmallBrood_StateFlash - SMALLBROOD state: flash (toggle the palette bit every 4 frames) until the fuse +$6E runs out, then explode
; In:  8(a6) = this
; Out: d0
; Evidence: +$2E bits 0-1 ^= 2, +$6C = 4; +$6E == 0 -> SmallBrood_StateExplode
; Found: link-after-rts
; ---------------------------------------------------------------------------
SmallBrood_StateFlash:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$3,d0
	and.b	$2E(a4),d0
	moveq	#$0,d1
	move.b	d0,d1
	moveq	#$2,d0
	eor.b	d0,d1
	move.w	d1,d7
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	ext.w	d0
	move.w	d7,d1
	or.w	d0,d1
	move.b	d1,$2E(a4)
	tst.w	$6E(a4)
	bne.s	loc_0851A0
	clr.w	$6C(a4)
	lea.l	SmallBrood_StateExplode(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_0851B4
loc_0851A0:
	move.w	#$4,$6C(a4)
	lea.l	SmallBrood_StateFlash(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0851B4:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
