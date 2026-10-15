; ---------------------------------------------------------------------------
; ExplodeFx_ChainStep - spawn the next explosion(s) of a chain from its path script
; In:  8(a6) = effect
; Out: none
; Evidence: path entries {word dx (negated when h-flipped), word dy (subtracted), word, word delay} ended by a negative long at +4; free slot of 27 ($6-byte {x, y, frame, live} from +$20) gets origin + offset; at the end restart from +$1C while +$14 repeats remain, waiting +$15; explosion sound with cooldown
; ---------------------------------------------------------------------------
ExplodeFx_ChainStep:
	link.w	a6,#$0
	movem.l	d3/d6-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$20(a4),a4
	clr.w	d7
	clr.b	d6
	movea.l	$8(a6),a0
	movea.l	$18(a0),a0
	tst.l	$4(a0)
	bge.s	loc_13EAA6
	movea.l	$8(a6),a0
	tst.b	$14(a0)
	beq.s	loc_13EA98
	tst.b	$14(a0)
	ble.s	loc_13EA7C
	subq.b	#$1,$14(a0)
loc_13EA7C:
	movea.l	$8(a6),a0
	movea.l	a0,a1
	move.l	$1C(a0),$18(a1)
	movea.l	$8(a6),a0
	moveq	#$0,d0
	move.b	$15(a0),d0
	move.w	d0,$12(a0)
	bra.s	loc_13EAA6
loc_13EA98:
	movea.l	$8(a6),a0
	moveq	#$0,d0
	move.l	d0,$18(a0)
	bra.w	loc_13EBAC
loc_13EAA6:
	movea.l	$8(a6),a0
	tst.w	$12(a0)
	bgt.w	loc_13EBAC
loc_13EAB2:
	cmpi.w	#$1B,d7
	bge.w	loc_13EB82
	tst.b	$5(a4)
	bne.w	loc_13EB78
	movea.l	$8(a6),a0
	movea.l	$18(a0),a3
	move.w	$6(a3),$12(a0)
	movea.l	$8(a6),a0
	movea.l	a0,a1
	moveq	#$0,d0
	move.b	$16(a1),d0
	moveq	#$2,d1
	and.b	d0,d1
	seq.b	d3
	neg.b	d3
	beq.s	loc_13EAEC
	move.w	(a3),d0
	ext.l	d0
	bra.s	loc_13EAF2
loc_13EAEC:
	move.w	(a3),d0
	ext.l	d0
	neg.l	d0
loc_13EAF2:
	add.w	$E(a0),d0
	move.w	d0,(a4)
	movea.l	$8(a6),a0
	move.w	$10(a0),d0
	sub.w	$2(a3),d0
	move.w	d0,$2(a4)
	move.b	#$6,$4(a4)
	move.b	#$1,$5(a4)
	moveq	#$1,d6
	movea.l	$8(a6),a0
	addq.l	#$8,$18(a0)
	movea.l	$8(a6),a0
	tst.w	$12(a0)
	bgt.s	loc_13EB82
	movea.l	$18(a0),a0
	tst.l	$4(a0)
	bge.s	loc_13EB6E
	movea.l	$8(a6),a0
	tst.b	$14(a0)
	beq.s	loc_13EB62
	tst.b	$14(a0)
	ble.s	loc_13EB46
	subq.b	#$1,$14(a0)
loc_13EB46:
	movea.l	$8(a6),a0
	movea.l	a0,a1
	move.l	$1C(a0),$18(a1)
	movea.l	$8(a6),a0
	moveq	#$0,d0
	move.b	$15(a0),d0
	move.w	d0,$12(a0)
	bra.s	loc_13EB6E
loc_13EB62:
	movea.l	$8(a6),a0
	moveq	#$0,d0
	move.l	d0,$18(a0)
	bra.s	loc_13EBAC
loc_13EB6E:
	movea.l	$8(a6),a0
	tst.w	$12(a0)
	bgt.s	loc_13EB82
loc_13EB78:
	move.w	d7,d0
	addq.w	#$1,d7
	addq.w	#$6,a4
	bra.w	loc_13EAB2
loc_13EB82:
	tst.b	d6
	beq.s	loc_13EBAC
	movea.l	$8(a6),a0
	tst.b	$D(a0)
	bgt.s	loc_13EBAC
	moveq	#$38,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$38,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	movea.l	$8(a6),a0
	move.b	#$6,$D(a0)
	addq.w	#$8,a7
loc_13EBAC:
	movem.l	-$14(a6),d3/d6-d7/a3-a4
	unlk	a6
	rts
