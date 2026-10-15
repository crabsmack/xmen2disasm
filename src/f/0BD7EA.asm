; ---------------------------------------------------------------------------
; Barbarian_TargetPlayer - BARBARIAN: if a live player stands on one of its neighbour segments, target that player (+$A2, segment +$AA, position +$9E/+$A0)
; In:  8(a6) = this, $C(a6) = player
; Out: d0 = 1 when targeted
; Evidence: callers Barbarian_StateWatchP1/P2; TAS 27995-33090
; Found: link-after-rts
; ---------------------------------------------------------------------------
Barbarian_TargetPlayer:
	link.w	a6,#$FFFC
	movem.l	d3/d6-d7/a3-a4,-(a7)
	movea.l	$C(a6),a3
	movea.l	$8(a6),a4
	move.w	$4(a3),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_0BD888
	moveq	#$0,d7
loc_0BD814:
	lea.l	$AE(a4),a0
	move.b	(a0,d7.l),d6
	moveq	#$0,d0
	move.b	d6,d0
	cmpi.w	#$FF,d0
	bne.s	loc_0BD82A
	moveq	#$0,d0
	bra.s	loc_0BD88A
loc_0BD82A:
	moveq	#$0,d0
	move.b	d6,d0
	ext.l	d0
	lsl.l	#$2,d0
	move.l	d0,d1
	lsl.l	#$2,d0
	add.l	d1,d0
	lea.l	g_Segs(a5),a0
	adda.w	d0,a0
	move.l	a0,-$4(a6)
	move.l	a0,d0
	cmp.l	$76(a3),d0
	bne.s	loc_0BD87E
	move.l	a3,$A2(a4)
	move.l	-$4(a6),$AA(a4)
	move.l	$8(a3),d0
	asr.l	#$8,d0
	move.w	d0,$9E(a4)
	move.l	$C(a3),d0
	asr.l	#$8,d0
	move.w	d0,$A0(a4)
	moveq	#$14,d0
	move.l	d0,-(a7)
	move.l	-$4(a6),-(a7)
	move.l	a4,-(a7)
	jsr	Barbarian_StepTargetX(pc)
	moveq	#$1,d0
	lea.l	$C(a7),a7
	bra.s	loc_0BD88A
loc_0BD87E:
	move.l	d7,d0
	addq.l	#$1,d7
	moveq	#$C,d0
	cmp.l	d7,d0
	bgt.s	loc_0BD814
loc_0BD888:
	moveq	#$0,d0
loc_0BD88A:
	movem.l	-$18(a6),d3/d6-d7/a3-a4
	unlk	a6
	rts
