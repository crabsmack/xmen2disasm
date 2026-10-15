; ---------------------------------------------------------------------------
; Wolverine_StateCeilingCrawl - one crawl step along a ceiling; at its end go round onto a wall or stop
; In:  8(a6) = player
; Out: none
; Evidence: anim done -> frame $2D/$30, sound 99, delay 10, Wolverine_StateCeilingHang; blocked -> hang; past the segment end: next segment classified 0 -> stop with +$90 $100000/$80000 (end right/left) else Wolverine_CeilingToWall
; ---------------------------------------------------------------------------
Wolverine_StateCeilingCrawl:
	link.w	a6,#$0
	movem.l	d3-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	tst.l	$44(a4)
	beq.w	loc_196DF6
	move.l	#$3C000,d0
	and.l	$90(a4),d0
	beq.s	loc_196CD2
	moveq	#$0,d0
	move.l	d0,$44(a4)
	tst.b	$C2(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_196CB6
	moveq	#$1,d1
	bra.s	loc_196CB8
loc_196CB6:
	moveq	#$0,d1
loc_196CB8:
	move.b	d1,$C2(a4)
	clr.w	$6C(a4)
	lea.l	Wolverine_StateCeilingHang(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	loc_196E5A
loc_196CD2:
	move.w	#$100,d0
	and.w	$4(a4),d0
	beq.w	loc_196DE2
	moveq	#$0,d0
	move.b	$7B(a4),d0
	ext.l	d0
	lsl.l	#$2,d0
	move.l	d0,d1
	lsl.l	#$2,d0
	add.l	d1,d0
	lea.l	g_Segs(a5),a0
	lea.l	(a0,d0.w),a3
	move.l	$8(a4),d7
	asr.l	#$8,d7
	move.l	a3,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$F2(a0),a1
	jsr	(a1)
	move.w	d0,d6
	moveq	#$10,d0
	and.b	$2E(a4),d0
	addq.w	#$8,a7
	bne.s	loc_196D36
	move.w	$C(a3),d0
	cmp.w	$8(a3),d0
	sgt.b	d3
	neg.b	d3
	beq.s	loc_196D28
	move.w	$C(a3),d0
	bra.s	loc_196D2C
loc_196D28:
	move.w	$8(a3),d0
loc_196D2C:
	move.w	d0,d4
	cmp.w	d4,d7
	bgt.w	loc_196DE2
	bra.s	loc_196D56
loc_196D36:
	move.w	$C(a3),d0
	cmp.w	$8(a3),d0
	slt.b	d3
	neg.b	d3
	beq.s	loc_196D4A
	move.w	$C(a3),d0
	bra.s	loc_196D4E
loc_196D4A:
	move.w	$8(a3),d0
loc_196D4E:
	move.w	d0,d5
	cmp.w	d5,d7
	blt.w	loc_196DE2
loc_196D56:
	tst.w	d6
	beq.s	loc_196D6E
	lea.l	Wolverine_CeilingToWall(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	Wolverine_CeilingToWall(pc)
	addq.w	#$4,a7
	bra.w	loc_196E5A
loc_196D6E:
	clr.w	$1E(a4)
	clr.w	$16(a4)
	moveq	#$0,d0
	move.l	d0,$44(a4)
	moveq	#$10,d1
	and.b	$2E(a4),d1
	bne.s	loc_196D8C
	ori.l	#$100000,$90(a4)
loc_196D8C:
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_196D9C
	ori.l	#$80000,$90(a4)
loc_196D9C:
	tst.b	$C2(a4)
	bne.s	loc_196DBA
	moveq	#$30,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	move.b	#$1,$C2(a4)
	addq.w	#$8,a7
	bra.s	loc_196DCE
loc_196DBA:
	moveq	#$2D,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	clr.b	$C2(a4)
	addq.w	#$8,a7
loc_196DCE:
	clr.w	$6C(a4)
	lea.l	Wolverine_StateCeilingHang(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_196E5A
loc_196DE2:
	clr.w	$6C(a4)
	lea.l	Wolverine_StateCeilingCrawl(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_196E5A
loc_196DF6:
	tst.l	$44(a4)
	bne.s	loc_196E5A
	clr.w	$1E(a4)
	clr.w	$16(a4)
	tst.b	$C2(a4)
	bne.s	loc_196E1C
	moveq	#$2D,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	bra.s	loc_196E2C
loc_196E1C:
	moveq	#$30,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
loc_196E2C:
	moveq	#$63,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$63,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	andi.l	#$FFFFFFDF,$90(a4)
	addq.w	#$8,a7
	move.w	#$A,$6C(a4)
	lea.l	Wolverine_StateCeilingHang(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_196E5A:
	movem.l	-$1C(a6),d3-d7/a3-a4
	unlk	a6
	rts
