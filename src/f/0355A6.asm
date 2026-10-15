; ---------------------------------------------------------------------------
; AvalonA4_CrackFloorHook - map tile hook: a player (or no object) cracks a floor segment one stage ($86 -> $87 -> $88 -> broken $85) across its width; the last stage frees the segment
; In:  8(a6) = word column, $C(a6) = word row, $10(a6) = hitting object
; Out: d0 = 0
; Evidence: object class XPLAYER ($1131A0) or jt $2D92 class, or none; sub_1F8454 finds the type-$14 segment; Seg_Free; Explosion_SpawnSetTimerWord debris; installed in -$3AE8
; ---------------------------------------------------------------------------
AvalonA4_CrackFloorHook:
	link.w	a6,#$FFF4
	movem.l	d3-d7/a3-a4,-(a7)
	movea.l	$10(a6),a4
	move.w	$A(a6),d6
	clr.b	d5
	move.l	a4,d0
	beq.s	loc_0355DA
	movea.l	(a4),a0
	movea.l	$2(a0),a3
	lea.l	$2B92(a5),a0
	cmpa.l	$2(a0),a3
	beq.s	loc_0355D6
	lea.l	$2B8A(a5),a0
	cmpa.l	$2(a0),a3
	bne.s	loc_0355DC
loc_0355D6:
	moveq	#$1,d5
	bra.s	loc_0355DC
loc_0355DA:
	moveq	#$1,d5
loc_0355DC:
	tst.b	d5
	beq.w	loc_035704
	move.w	$E(a6),d0
	ext.l	d0
	movea.l	-$3A72(a5),a0
	add.l	d0,d0
	move.w	(a0,d0.l),d0
	ext.l	d0
	ext.l	d6
	add.l	d6,d0
	movea.l	-$3A84(a5),a0
	add.l	d0,d0
	move.w	#$1FF,d7
	and.w	(a0,d0.l),d7
	clr.b	d5
	move.w	$E(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	moveq	#$14,d0
	move.l	d0,-(a7)
	jsr	$4F52(a5)	; -> sub_1F8454
	movea.l	d0,a4
	moveq	#$1A,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$1A,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	cmpi.w	#$86,d7
	lea.l	$14(a7),a7
	bne.s	loc_03563E
	move.w	#$87,d4
	bra.s	loc_035656
loc_03563E:
	cmpi.w	#$87,d7
	bne.s	loc_03564A
	move.w	#$88,d4
	bra.s	loc_035656
loc_03564A:
	cmpi.w	#$88,d7
	bne.s	loc_035656
	move.w	#$85,d4
	moveq	#$1,d5
loc_035656:
	move.l	a4,d0
	beq.w	loc_035704
	move.w	$A(a4),d0
	ext.l	d0
	addq.l	#$8,d0
	asr.l	#$5,d0
	move.w	d0,-$C(a6)
	move.w	$E(a4),d0
	ext.l	d0
	subq.l	#$8,d0
	asr.l	#$5,d0
	move.w	d0,-$A(a6)
	ext.l	d6
	move.l	d6,d0
	lsl.l	#$5,d0
	moveq	#$10,d1
	add.l	d1,d0
	lsl.l	#$8,d0
	move.l	d0,-$8(a6)
	move.w	-$C(a6),d0
	ext.l	d0
	lsl.l	#$5,d0
	addq.l	#$8,d0
	lsl.l	#$8,d0
	move.l	d0,-$4(a6)
	move.w	-$C(a6),d0
	ext.l	d0
	move.l	d0,d7
	bra.s	loc_0356CC
loc_0356A2:
	tst.b	d5
	seq.b	d3
	neg.b	d3
	ext.w	d3
	ext.l	d3
	move.l	d3,-(a7)
	ext.l	d4
	move.l	d4,-(a7)
	move.l	d7,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	jsr	$3FDA(a5)	; -> Map_SetBlockFG
	lea.l	$10(a7),a7
	move.l	d7,d0
	addq.l	#$1,d7
	addi.l	#$2000,-$4(a6)
loc_0356CC:
	move.w	-$A(a6),d0
	ext.l	d0
	cmp.l	d7,d0
	bge.s	loc_0356A2
	tst.b	d5
	beq.s	loc_0356E2
	move.l	a4,-(a7)
	jsr	$4F22(a5)	; -> Seg_Free
	addq.w	#$4,a7
loc_0356E2:
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.w	$E(a6),d1
	ext.l	d1
	lsl.l	#$5,d1
	moveq	#$10,d2
	add.l	d2,d1
	lsl.l	#$8,d1
	move.l	d1,-(a7)
	move.l	-$8(a6),-(a7)
	jsr	$2DD2(a5)	; -> Explosion_SpawnSetTimerWord
	lea.l	$10(a7),a7
loc_035704:
	moveq	#$0,d0
	movem.l	-$28(a6),d3-d7/a3-a4
	unlk	a6
	rts
