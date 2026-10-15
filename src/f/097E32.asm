; ---------------------------------------------------------------------------
; EvilBeast_UpdateThrows - EVILBEAST slot +$82 (per frame): advance its two thrown objects (+$BA, +$BC) until each reports done
; In:  8(a6) = this
; Out: none
; Evidence: Beast_ShockwaveStep(slot, &y, resource record -$3C3E*$14 + $FFC97A, side 0/1, 1, 0); clears +$BE bits 0/1; TAS 53043-53370
; Found: jt 766
; ---------------------------------------------------------------------------
EvilBeast_UpdateThrows:
	link.w	a6,#$FFFE
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.w	d0,-$2(a6)
	moveq	#$0,d0
	move.b	$BE(a4),d0
	tst.l	d0
	btst	#$0,d0
	beq.s	loc_097E90
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$1,d1
	move.l	d1,-(a7)
	move.l	d0,-(a7)
	move.w	-$3C3E(a5),d2
	ext.l	d2
	lsl.l	#$2,d2
	move.l	d2,d3
	lsl.l	#$2,d2
	add.l	d3,d2
	lea.l	g_SpriteDefs(a5),a0
	pea.l	(a0,d2.w)
	pea.l	-$2(a6)
	pea.l	$BA(a4)
	jsr	$42EA(a5)	; -> Beast_ShockwaveStep
	tst.b	d0
	lea.l	$18(a7),a7
	beq.s	loc_097E90
	andi.b	#$FE,$BE(a4)
loc_097E90:
	moveq	#$0,d0
	move.b	$BE(a4),d0
	moveq	#$2,d1
	and.b	d0,d1
	beq.s	loc_097ED6
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$1,d1
	move.l	d1,-(a7)
	move.l	d1,-(a7)
	move.w	-$3C3E(a5),d2
	ext.l	d2
	lsl.l	#$2,d2
	move.l	d2,d3
	lsl.l	#$2,d2
	add.l	d3,d2
	lea.l	g_SpriteDefs(a5),a0
	pea.l	(a0,d2.w)
	pea.l	-$2(a6)
	pea.l	$BC(a4)
	jsr	$42EA(a5)	; -> Beast_ShockwaveStep
	tst.b	d0
	lea.l	$18(a7),a7
	beq.s	loc_097ED6
	andi.b	#$FD,$BE(a4)
loc_097ED6:
	movem.l	-$A(a6),d3/a4
	unlk	a6
	rts
