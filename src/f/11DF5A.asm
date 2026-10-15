; ---------------------------------------------------------------------------
; WallCrawlBio_Init - BABYBIO Init, then stats Tbl_BabyMoleManTakeDamage_Hurt, flags |= 2, crawl mode +$BC = variant & 3: 0/1 crawl on a wall (y limits +$AC/+$AE = y -/+ 48 or the placement params; 1 = h-flipped), 2 crawl on a ceiling (x limits, v-flip), each with its AI script (jt $3252 / $325A); +$BE = param +$C (default 30); start at the script's first step (class slot 3, +$12)
; In:  8(a6) = this  $C/$10(a6) = x, y (16.16)  $14(a6) = placement entry or 0
; Out: d0 = garbage
; Evidence: method 3 of class descriptor $11BAA0 (name string "WALLCRAWLBIO", parent BABYBIO)
; ---------------------------------------------------------------------------
WallCrawlBio_Init:
	link.w	a6,#$0
	movem.l	d3/d7/a3-a4,-(a7)
	movea.l	$14(a6),a3
	movea.l	$8(a6),a4
	move.l	a3,-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$30BA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	lea.l	$3062(a5),a0
	movea.l	$2(a0),a0
	move.l	a0,$8C(a4)
	moveq	#$0,d0
	move.b	$2(a0),d0
	move.w	d0,$68(a4)
	ori.w	#$2,$6(a4)
	moveq	#$0,d0
	move.b	$BB(a4),d0
	moveq	#$3,d1
	and.b	d0,d1
	move.b	d1,$BC(a4)
	move.b	$BC(a4),d0
	lea.l	$10(a7),a7
	beq.s	loc_11DFCA
	subq.b	#$1,d0
	beq.s	loc_11DFCA
	subq.b	#$1,d0
	beq.w	loc_11E06E
	bra.w	loc_11E114
loc_11DFCA:
	move.w	$4(a3),d0
	sub.w	#$30,d0
	move.w	d0,$AC(a4)
	move.w	$4(a3),d0
	add.w	#$30,d0
	move.w	d0,$AE(a4)
	move.b	#$1,$B7(a4)
	move.b	#$1,$B8(a4)
	move.l	a3,d0
	beq.s	loc_11E058
	move.w	$6(a3),d7
	beq.s	loc_11E026
	tst.w	d7
	ble.s	loc_11E004
	move.b	#$1,$B7(a4)
	bra.s	loc_11E008
loc_11E004:
	clr.b	$B7(a4)
loc_11E008:
	tst.w	d7
	sge.b	d3
	neg.b	d3
	beq.s	loc_11E016
	ext.l	d7
	move.l	d7,d0
	bra.s	loc_11E01C
loc_11E016:
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
loc_11E01C:
	move.w	$4(a3),d1
	sub.w	d0,d1
	move.w	d1,$AC(a4)
loc_11E026:
	move.w	$8(a3),d7
	beq.s	loc_11E058
	tst.w	d7
	ble.s	loc_11E038
	move.b	#$1,$B8(a4)
	bra.s	loc_11E03C
loc_11E038:
	clr.b	$B8(a4)
loc_11E03C:
	tst.w	d7
	sge.b	d3
	neg.b	d3
	beq.s	loc_11E04A
	ext.l	d7
	move.l	d7,d0
	bra.s	loc_11E050
loc_11E04A:
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
loc_11E050:
	add.w	$4(a3),d0
	move.w	d0,$AE(a4)
loc_11E058:
	lea.l	$3052(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$96(a4)
	jsr	$3ED2(a5)	; -> AiScript_Set
	addq.w	#$8,a7
	bra.w	loc_11E114
loc_11E06E:
	move.w	$2(a3),d0
	sub.w	#$30,d0
	move.w	d0,$AC(a4)
	move.w	$2(a3),d0
	add.w	#$30,d0
	move.w	d0,$AE(a4)
	move.b	#$1,$B7(a4)
	move.b	#$1,$B8(a4)
	move.l	a3,d0
	beq.s	loc_11E0FC
	move.w	$6(a3),d7
	beq.s	loc_11E0CA
	tst.w	d7
	ble.s	loc_11E0A8
	move.b	#$1,$B7(a4)
	bra.s	loc_11E0AC
loc_11E0A8:
	clr.b	$B7(a4)
loc_11E0AC:
	tst.w	d7
	sge.b	d3
	neg.b	d3
	beq.s	loc_11E0BA
	ext.l	d7
	move.l	d7,d0
	bra.s	loc_11E0C0
loc_11E0BA:
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
loc_11E0C0:
	move.w	$2(a3),d1
	sub.w	d0,d1
	move.w	d1,$AC(a4)
loc_11E0CA:
	move.w	$8(a3),d7
	beq.s	loc_11E0FC
	tst.w	d7
	ble.s	loc_11E0DC
	move.b	#$1,$B8(a4)
	bra.s	loc_11E0E0
loc_11E0DC:
	clr.b	$B8(a4)
loc_11E0E0:
	tst.w	d7
	sge.b	d3
	neg.b	d3
	beq.s	loc_11E0EE
	ext.l	d7
	move.l	d7,d0
	bra.s	loc_11E0F4
loc_11E0EE:
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
loc_11E0F4:
	add.w	$2(a3),d0
	move.w	d0,$AE(a4)
loc_11E0FC:
	ori.b	#$8,$2E(a4)
	lea.l	$305A(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$96(a4)
	jsr	$3ED2(a5)	; -> AiScript_Set
	addq.w	#$8,a7
loc_11E114:
	moveq	#$0,d0
	move.b	$BC(a4),d0
	cmpi.w	#$1,d0
	bne.s	loc_11E126
	ori.b	#$10,$2E(a4)
loc_11E126:
	move.w	#$1E,$BE(a4)
	move.l	a3,d0
	beq.s	loc_11E13E
	move.w	$A(a3),d0
	move.w	$C(a3),d7
	beq.s	loc_11E13E
	move.w	d7,$BE(a4)
loc_11E13E:
	tst.l	$98(a4)
	bne.s	loc_11E150
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_11E16C
loc_11E150:
	clr.w	$96(a4)
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_11E16C:
	movem.l	-$10(a6),d3/d7/a3-a4
	unlk	a6
	rts
