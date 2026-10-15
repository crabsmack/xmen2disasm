; ---------------------------------------------------------------------------
; XClone_TileHookOpenWall - clone-maker tile hook [3]: once the reward flag is set (and no player is Magneto), blast open the wall at map columns $5A-$5B rows $19-$1D
; In:  8(a6) = word column, $A(a6) = word row, $10(a6) = object
; Out: d0 = 0
; Evidence: rewrites map tiles via Map_SetBlockFG/Map_SetBlockFGFlip, explosions along x $B50/$B70, clears tile priority bits, sound $35, removes the solid block (sub_1F8454/Seg_Free); installed in $FFC714
; Found: link-after-rts
; ---------------------------------------------------------------------------
XClone_TileHookOpenWall:
	link.w	a6,#$FFFE
	movem.l	d3-d7/a3-a4,-(a7)
	move.w	$E(a6),d5
	move.w	$A(a6),d7
	ext.l	d5
	movea.l	-$3A76(a5),a0
	move.l	d5,d0
	add.l	d0,d0
	move.w	(a0,d0.l),d0
	ext.l	d0
	ext.l	d7
	add.l	d7,d0
	movea.l	-$3A88(a5),a0
	add.l	d0,d0
	move.w	#$1FF,d6
	and.w	(a0,d0.l),d6
	clr.w	d6
	clr.b	d4
	moveq	#$2,d0
	and.w	-$3B08(a5),d0
	beq.w	loc_099802
	move.w	g_Player1+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_099590
	lea.l	$2BBA(a5),a0
	move.l	g_Player1(a5),d0
	cmp.l	$2(a0),d0
	bne.s	loc_099590
	move.w	d6,d0
	addq.w	#$1,d6
loc_099590:
	move.w	g_Player2+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_0995BA
	lea.l	$2BBA(a5),a0
	move.l	g_Player2(a5),d0
	cmp.l	$2(a0),d0
	bne.s	loc_0995BA
	move.w	d6,d0
	addq.w	#$1,d6
loc_0995BA:
	move.l	$10(a6),-(a7)
	jsr	Clone_CharTypeOf(pc)
	move.w	d0,-$2(a6)
	move.w	-$3B08(a5),d0
	ext.l	d0
	move.b	-$1(a6),d1
	addq.b	#$8,d1
	moveq	#$1,d2
	lsl.l	d1,d2
	and.l	d0,d2
	addq.w	#$4,a7
	beq.s	loc_0995DE
	moveq	#$1,d4
loc_0995DE:
	tst.w	d6
	bne.s	loc_0995E6
	tst.b	d4
	bne.s	loc_0995EC
loc_0995E6:
	moveq	#$0,d0
	bra.w	loc_099802
loc_0995EC:
	moveq	#$4B,d4
	pea.l	($3E8).w
	ext.l	d5
	move.l	d5,d0
	lsl.l	#$5,d0
	moveq	#$10,d1
	add.l	d1,d0
	move.l	d0,-(a7)
	ext.l	d7
	move.l	d7,d0
	lsl.l	#$5,d0
	add.l	d1,d0
	move.l	d0,-(a7)
	jsr	$3EFA(a5)	; -> Seg_FindBelow
	movea.l	d0,a3
	move.l	a3,d0
	lea.l	$C(a7),a7
	beq.s	loc_09963E
	move.w	$A(a3),d0
	cmp.w	$E(a3),d0
	slt.b	d3
	neg.b	d3
	beq.s	loc_09962A
	move.w	$A(a3),d0
	bra.s	loc_09962E
loc_09962A:
	move.w	$E(a3),d0
loc_09962E:
	move.w	d0,d6
	ext.l	d6
	move.l	d6,-(a7)
	move.l	-$3B1C(a5),-(a7)
	jsr	$3B4A(a5)	; -> Debris_SetFloorY
	addq.w	#$8,a7
loc_09963E:
	moveq	#$19,d6
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$4,d1
	move.l	d1,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	moveq	#$5A,d0
	move.l	d0,-(a7)
	jsr	$3FDA(a5)	; -> Map_SetBlockFG
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$4,d1
	move.l	d1,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	moveq	#$5B,d0
	move.l	d0,-(a7)
	jsr	$3FDA(a5)	; -> Map_SetBlockFG
	move.w	d6,d0
	addq.w	#$1,d6
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$4A,d1
	move.l	d1,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	moveq	#$5A,d0
	move.l	d0,-(a7)
	jsr	$3FDA(a5)	; -> Map_SetBlockFG
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$4A,d1
	move.l	d1,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	moveq	#$5B,d0
	move.l	d0,-(a7)
	jsr	$3FDA(a5)	; -> Map_SetBlockFG
	move.w	d6,d0
	addq.w	#$1,d6
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$4B,d1
	move.l	d1,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	moveq	#$5A,d0
	move.l	d0,-(a7)
	jsr	$3FDA(a5)	; -> Map_SetBlockFG
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$4B,d1
	move.l	d1,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	moveq	#$5B,d0
	move.l	d0,-(a7)
	jsr	$3FDA(a5)	; -> Map_SetBlockFG
	move.w	d6,d0
	addq.w	#$1,d6
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$4B,d1
	move.l	d1,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	moveq	#$5A,d0
	move.l	d0,-(a7)
	jsr	$3FDA(a5)	; -> Map_SetBlockFG
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$4B,d1
	move.l	d1,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	moveq	#$5B,d0
	move.l	d0,-(a7)
	jsr	$3FDA(a5)	; -> Map_SetBlockFG
	move.w	d6,d0
	addq.w	#$1,d6
	moveq	#$1,d0
	move.l	d0,-(a7)
	moveq	#$0,d1
	move.l	d1,-(a7)
	move.l	d1,-(a7)
	moveq	#$4,d0
	move.l	d0,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	moveq	#$5A,d0
	move.l	d0,-(a7)
	jsr	$3FE2(a5)	; -> Map_SetBlockFGFlip
	moveq	#$1,d0
	move.l	d0,-(a7)
	moveq	#$0,d1
	move.l	d1,-(a7)
	move.l	d1,-(a7)
	moveq	#$4,d0
	move.l	d0,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	moveq	#$5B,d0
	move.l	d0,-(a7)
	jsr	$3FE2(a5)	; -> Map_SetBlockFGFlip
	clr.w	d6
	lea.l	$B0(a7),a7
loc_09972A:
	moveq	#$5A,d7
	move.w	d6,d5
	add.w	#$1A,d5
	moveq	#$3,d0
	move.l	d0,-(a7)
	move.l	-$3B1C(a5),-(a7)
	ext.l	d5
	move.l	d5,d1
	lsl.l	#$5,d1
	moveq	#$10,d2
	add.l	d2,d1
	move.l	d1,-(a7)
	ext.l	d7
	move.l	d7,d1
	lsl.l	#$5,d1
	add.l	d2,d1
	move.l	d1,-(a7)
	jsr	$3B6A(a5)	; -> Debris_Spawn
	ext.l	d5
	movea.l	-$3A72(a5),a0
	move.l	d5,d0
	add.l	d0,d0
	move.w	(a0,d0.l),d0
	ext.l	d0
	ext.l	d7
	add.l	d7,d0
	movea.l	-$3A84(a5),a0
	add.l	d0,d0
	lea.l	(a0,d0.l),a4
	andi.w	#$47FF,(a4)
	move.w	d7,d0
	addq.w	#$1,d7
	moveq	#$3,d0
	move.l	d0,-(a7)
	move.l	-$3B1C(a5),-(a7)
	ext.l	d5
	move.l	d5,d1
	lsl.l	#$5,d1
	moveq	#$10,d2
	add.l	d2,d1
	move.l	d1,-(a7)
	ext.l	d7
	move.l	d7,d1
	lsl.l	#$5,d1
	add.l	d2,d1
	move.l	d1,-(a7)
	jsr	$3B6A(a5)	; -> Debris_Spawn
	ext.l	d5
	movea.l	-$3A72(a5),a0
	move.l	d5,d0
	add.l	d0,d0
	move.w	(a0,d0.l),d0
	ext.l	d0
	ext.l	d7
	add.l	d7,d0
	movea.l	-$3A84(a5),a0
	add.l	d0,d0
	lea.l	(a0,d0.l),a4
	andi.w	#$47FF,(a4)
	lea.l	$20(a7),a7
	move.w	d6,d0
	addq.w	#$1,d6
	cmpi.w	#$3,d6
	blt.w	loc_09972A
	moveq	#$35,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$35,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	ext.l	d5
	move.l	d5,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	moveq	#$14,d0
	move.l	d0,-(a7)
	jsr	$4F52(a5)	; -> sub_1F8454
	movea.l	d0,a4
	move.l	a4,d0
	lea.l	$14(a7),a7
	beq.s	loc_099800
	move.l	a4,-(a7)
	jsr	$4F22(a5)	; -> Seg_Free
	addq.w	#$4,a7
loc_099800:
	moveq	#$0,d0
loc_099802:
	movem.l	-$1E(a6),d3-d7/a3-a4
	unlk	a6
	rts
