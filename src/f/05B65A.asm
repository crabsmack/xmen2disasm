; ---------------------------------------------------------------------------
; sub_05B65A	[link-after-rts]
; ---------------------------------------------------------------------------
sub_05B65A:
	link.w	a6,#$0
	movem.l	d3-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$F,d0
	move.l	d0,-(a7)
	moveq	#$0,d1
	move.b	$42(a4),d1
	move.l	d1,-(a7)
	move.l	$C(a4),d1
	asr.l	#$8,d1
	move.l	d1,-(a7)
	move.l	$8(a4),d1
	asr.l	#$8,d1
	move.l	d1,-(a7)
	jsr	$3EF2(a5)	; -> sub_15A82A
	movea.l	d0,a3
	move.l	a3,d0
	lea.l	$10(a7),a7
	beq.w	loc_05B950
	move.b	$1(a3),d0
	subq.b	#$3,d0
	beq.s	loc_05B6AC
	subi.b	#$10,d0
	beq.w	loc_05B7C2
	subq.b	#$1,d0
	beq.w	loc_05B7C2
	bra.w	loc_05B950
loc_05B6AC:
	tst.b	$2(a3)
	ble.s	loc_05B6C0
	move.b	$2(a3),d0
	ext.w	d0
	subq.w	#$1,d0
	move.b	d0,$42(a4)
	bra.s	loc_05B6CA
loc_05B6C0:
	tst.b	$2(a3)
	bne.s	loc_05B6CA
	clr.b	$42(a4)
loc_05B6CA:
	move.w	$18(a4),d0
	asr.w	#$2,d0
	ext.l	d0
	neg.l	d0
	move.w	d0,$18(a4)
	jsr	$417A(a5)	; -> sub_1600AA
	moveq	#$0,d1
	move.w	d0,d1
	tst.l	d1
	btst	#$0,d1
	beq.s	loc_05B6F0
	move.w	#$150,$16(a4)
	bra.s	loc_05B6F6
loc_05B6F0:
	move.w	#$FEB0,$16(a4)
loc_05B6F6:
	lea.l	$C72(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	lea.l	$C7A(a5),a0
	move.l	$2(a0),$B8(a4)
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.w	d0,$22(a4)
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.w	d0,$24(a4)
	movea.l	$B8(a4),a0
	move.b	$7(a0),$A5(a4)
	pea.l	($97).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($97).w
	jsr	$521A(a5)	; -> Snd_Play
	moveq	#$1,d3
	move.w	$4E(a4),d0
	ext.l	d0
	moveq	#$28,d1
	sub.l	d1,d0
	move.w	g_CameraX(a5),d2
	ext.l	d2
	sub.l	d2,d0
	cmpi.l	#$140,d0
	bgt.s	loc_05B79C
	move.w	$52(a4),d0
	ext.l	d0
	moveq	#$28,d1
	add.l	d1,d0
	move.w	g_CameraX(a5),d2
	ext.l	d2
	sub.l	d2,d0
	blt.s	loc_05B79C
	move.w	$4C(a4),d0
	ext.l	d0
	moveq	#$28,d1
	sub.l	d1,d0
	move.w	g_CameraY(a5),d2
	ext.l	d2
	sub.l	d2,d0
	cmpi.l	#$E0,d0
	bgt.s	loc_05B79C
	move.w	$50(a4),d0
	ext.l	d0
	moveq	#$28,d1
	add.l	d1,d0
	move.w	g_CameraY(a5),d2
	ext.l	d2
	sub.l	d2,d0
	blt.s	loc_05B79C
	moveq	#$0,d3
loc_05B79C:
	tst.b	d3
	seq.b	d3
	neg.b	d3
	beq.s	loc_05B7AE
	lea.l	$C82(a5),a0
	movea.l	$2(a0),a0
	bra.s	loc_05B7B6
loc_05B7AE:
	lea.l	$C8A(a5),a0
	movea.l	$2(a0),a0
loc_05B7B6:
	move.l	a0,g_CamShake(a5)
	lea.l	$10(a7),a7
	bra.w	loc_05B950
loc_05B7C2:
	move.l	$8(a4),d7
	asr.l	#$8,d7
	move.w	$8(a3),d0
	cmp.w	$C(a3),d0
	slt.b	d3
	neg.b	d3
	beq.s	loc_05B7DC
	move.w	$8(a3),d0
	bra.s	loc_05B7E0
loc_05B7DC:
	move.w	$C(a3),d0
loc_05B7E0:
	move.w	d0,d6
	move.w	$8(a3),d0
	cmp.w	$C(a3),d0
	sgt.b	d3
	neg.b	d3
	beq.s	loc_05B7F6
	move.w	$8(a3),d0
	bra.s	loc_05B7FA
loc_05B7F6:
	move.w	$C(a3),d0
loc_05B7FA:
	move.w	d0,d4
	move.w	d7,d5
	sub.w	d6,d5
	move.w	d4,d6
	sub.w	d7,d6
	cmp.w	d5,d6
	ble.s	loc_05B810
	move.w	#$FD00,$16(a4)
	bra.s	loc_05B816
loc_05B810:
	move.w	#$300,$16(a4)
loc_05B816:
	cmpi.w	#$200,$18(a4)
	ble.s	loc_05B856
	move.l	$8(a4),d6
	asr.l	#$8,d6
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.l	d0,d5
	addq.l	#$4,d5
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	($3800).w
	tst.b	-$35CA(a5)
	seq.b	d3
	neg.b	d3
	ext.w	d3
	ext.l	d3
	move.l	d3,-(a7)
	ext.l	d5
	move.l	d5,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	move.l	a4,-(a7)
	jsr	$3FC2(a5)	; -> sub_15CECC
	lea.l	$18(a7),a7
loc_05B856:
	move.w	$18(a4),d0
	asr.w	#$2,d0
	ext.l	d0
	neg.l	d0
	move.w	d0,$18(a4)
	sge.b	d3
	neg.b	d3
	beq.s	loc_05B872
	move.w	$18(a4),d0
	ext.l	d0
	bra.s	loc_05B87A
loc_05B872:
	move.w	$18(a4),d0
	ext.l	d0
	neg.l	d0
loc_05B87A:
	cmpi.l	#$100,d0
	bge.s	loc_05B888
	move.w	#$FF00,$18(a4)
loc_05B888:
	lea.l	$C72(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	lea.l	$C7A(a5),a0
	move.l	$2(a0),$B8(a4)
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.w	d0,$22(a4)
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.w	d0,$24(a4)
	movea.l	$B8(a4),a0
	move.b	$7(a0),$A5(a4)
	pea.l	($97).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($97).w
	jsr	$521A(a5)	; -> Snd_Play
	moveq	#$1,d3
	move.w	$4E(a4),d0
	ext.l	d0
	moveq	#$28,d1
	sub.l	d1,d0
	move.w	g_CameraX(a5),d2
	ext.l	d2
	sub.l	d2,d0
	cmpi.l	#$140,d0
	bgt.s	loc_05B92E
	move.w	$52(a4),d0
	ext.l	d0
	moveq	#$28,d1
	add.l	d1,d0
	move.w	g_CameraX(a5),d2
	ext.l	d2
	sub.l	d2,d0
	blt.s	loc_05B92E
	move.w	$4C(a4),d0
	ext.l	d0
	moveq	#$28,d1
	sub.l	d1,d0
	move.w	g_CameraY(a5),d2
	ext.l	d2
	sub.l	d2,d0
	cmpi.l	#$E0,d0
	bgt.s	loc_05B92E
	move.w	$50(a4),d0
	ext.l	d0
	moveq	#$28,d1
	add.l	d1,d0
	move.w	g_CameraY(a5),d2
	ext.l	d2
	sub.l	d2,d0
	blt.s	loc_05B92E
	moveq	#$0,d3
loc_05B92E:
	tst.b	d3
	seq.b	d3
	neg.b	d3
	beq.s	loc_05B940
	lea.l	$C82(a5),a0
	movea.l	$2(a0),a0
	bra.s	loc_05B948
loc_05B940:
	lea.l	$C8A(a5),a0
	movea.l	$2(a0),a0
loc_05B948:
	move.l	a0,g_CamShake(a5)
	lea.l	$10(a7),a7
loc_05B950:
	moveq	#$0,d0
	move.b	$42(a4),d0
	tst.l	d0
	bne.s	loc_05B970
	move.w	#$FF,$6C(a4)
	lea.l	sub_05B65A(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_05B982
loc_05B970:
	clr.w	$6C(a4)
	lea.l	sub_05B65A(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_05B982:
	movem.l	-$1C(a6),d3-d7/a3-a4
	unlk	a6
	rts
