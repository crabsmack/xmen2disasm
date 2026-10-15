; ---------------------------------------------------------------------------
; XPlayer_Update - XPLAYER slot +$4A: per-frame player update: move, save safe spot, animate, timers, run the state, look up/down release, charge meter, frame hit points
; In:  8(a6) = player
; Out: d0
; Evidence: XPlayer_Move, +$A2, Anim_AdvanceByDistance, timers +$6E/+$A6/+$A8/+$AA, state +$5C when +$6C < 1, camera +$32/+$2E when Down/Up released while looking (+$90 $40000), +$72, Obj_UpdateBoxes, +$76 UpdateCharge, frame hit points via $15CB34
; ---------------------------------------------------------------------------
XPlayer_Update:
	link.w	a6,#$FFFC
	movem.l	d3/d5-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	tst.b	g_TwoPlayerStep(a5)
	beq.s	loc_1F165A
	moveq	#$2,d7
	bra.s	loc_1F165C
loc_1F165A:
	moveq	#$1,d7
loc_1F165C:
	andi.w	#$FFF7,$4(a4)
	move.l	$8(a4),d5
	move.l	$C(a4),d6
	move.w	#$1000,d0
	and.w	$4(a4),d0
	bne.s	loc_1F1690
	move.w	#$800,d0
	and.w	$4(a4),d0
	bne.s	loc_1F1688
	movea.l	$76(a4),a0
	moveq	#$4,d0
	and.b	(a0),d0
	beq.s	loc_1F1690
loc_1F1688:
	move.l	a4,-(a7)
	jsr	$4EDA(a5)	; -> sub_1F6D76
	addq.w	#$4,a7
loc_1F1690:
	move.w	#$800,d0
	and.w	$4(a4),d0
	bne.s	loc_1F16AE
	moveq	#$0,d0
	move.b	$3A(a4),d0
	cmpi.w	#$FF,d0
	beq.s	loc_1F16AE
	move.l	a4,-(a7)
	jsr	$4E7A(a5)	; -> Obj_Detach
	addq.w	#$4,a7
loc_1F16AE:
	ext.l	d7
	move.l	d7,-(a7)
	move.l	a4,-(a7)
	jsr	XPlayer_Move(pc)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$A2(a0),a1
	jsr	(a1)
	move.l	$C(a4),d0
	sub.l	d6,d0
	move.l	d0,-(a7)
	move.l	$8(a4),d0
	sub.l	d5,d0
	move.l	d0,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	move.l	a4,-(a7)
	jsr	$412A(a5)	; -> Anim_AdvanceByDistance
	tst.b	d0
	lea.l	$1C(a7),a7
	beq.s	loc_1F16EA
	ori.w	#$8,$4(a4)
loc_1F16EA:
	tst.w	$6E(a4)
	ble.s	loc_1F16FE
	sub.w	d7,$6E(a4)
	tst.w	$6E(a4)
	bge.s	loc_1F16FE
	clr.w	$6E(a4)
loc_1F16FE:
	tst.w	$A6(a4)
	ble.s	loc_1F1712
	sub.w	d7,$A6(a4)
	tst.w	$A6(a4)
	bge.s	loc_1F1712
	clr.w	$A6(a4)
loc_1F1712:
	tst.w	$A8(a4)
	ble.s	loc_1F1726
	sub.w	d7,$A8(a4)
	tst.w	$A8(a4)
	bge.s	loc_1F1726
	clr.w	$A8(a4)
loc_1F1726:
	tst.w	$AA(a4)
	ble.s	loc_1F173A
	sub.w	d7,$AA(a4)
	tst.w	$AA(a4)
	bge.s	loc_1F173A
	clr.w	$AA(a4)
loc_1F173A:
	tst.w	$6A(a4)
	bgt.s	loc_1F1746
	andi.w	#$FFBF,$6(a4)
loc_1F1746:
	tst.w	$6C(a4)
	ble.s	loc_1F1764
	cmpi.w	#$FF,$6C(a4)
	bge.s	loc_1F1786
	sub.w	d7,$6C(a4)
	tst.w	$6C(a4)
	bge.s	loc_1F1786
	clr.w	$6C(a4)
	bra.s	loc_1F1786
loc_1F1764:
	move.l	a4,-(a7)
	movea.l	$5C(a4),a0
	jsr	(a0)
	move.w	$4(a4),d0
	ext.l	d0
	move.w	#$8000,d1
	and.w	d0,d1
	addq.w	#$4,a7
	beq.w	loc_1F1964
	move.l	a4,-(a7)
	jsr	XPlayer_TetherToPartner(pc)
	addq.w	#$4,a7
loc_1F1786:
	move.l	#$40000,d0
	and.l	$90(a4),d0
	beq.w	loc_1F1890
	move.l	#$200000,d0
	and.l	$90(a4),d0
	bne.w	loc_1F1890
	movea.l	g_Camera(a5),a0
	moveq	#$8,d0
	and.w	$4A(a0),d0
	beq.s	loc_1F181A
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F17C2
	move.w	g_PadMaskDown(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1F17CA
loc_1F17C2:
	move.w	g_PadMaskDown(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1F17CA:
	beq.s	loc_1F17DC
	tst.w	$16(a4)
	bne.s	loc_1F17DC
	move.w	#$1000,d0
	and.w	$4(a4),d0
	beq.s	loc_1F181A
loc_1F17DC:
	andi.l	#$FFFBFFFF,$90(a4)
	tst.b	$9D(a4)
	bne.s	loc_1F17FA
	move.w	g_PadMaskDown(a5),d0
	not.w	d0
	and.w	g_Pad1Latch(a5),d0
	move.w	d0,g_Pad1Latch(a5)
	bra.s	loc_1F1808
loc_1F17FA:
	move.w	g_PadMaskDown(a5),d0
	not.w	d0
	and.w	g_Pad2Latch(a5),d0
	move.w	d0,g_Pad2Latch(a5)
loc_1F1808:
	movea.l	g_Camera(a5),a0
	move.l	a0,-(a7)
	movea.l	(a0),a0
	movea.l	$32(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.s	loc_1F1890
loc_1F181A:
	movea.l	g_Camera(a5),a0
	moveq	#$4,d0
	and.w	$4A(a0),d0
	beq.s	loc_1F1890
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1F183A
	move.w	g_PadMaskUp(a5),d0
	and.w	g_Pad1Held(a5),d0
	bra.s	loc_1F1842
loc_1F183A:
	move.w	g_PadMaskUp(a5),d0
	and.w	g_Pad2Held(a5),d0
loc_1F1842:
	beq.s	loc_1F1854
	tst.w	$16(a4)
	bne.s	loc_1F1854
	move.w	#$1000,d0
	and.w	$4(a4),d0
	beq.s	loc_1F1890
loc_1F1854:
	tst.b	$9D(a4)
	bne.s	loc_1F186A
	move.w	g_PadMaskUp(a5),d0
	not.w	d0
	and.w	g_Pad1Latch(a5),d0
	move.w	d0,g_Pad1Latch(a5)
	bra.s	loc_1F1878
loc_1F186A:
	move.w	g_PadMaskUp(a5),d0
	not.w	d0
	and.w	g_Pad2Latch(a5),d0
	move.w	d0,g_Pad2Latch(a5)
loc_1F1878:
	andi.l	#$FFFBFFFF,$90(a4)
	movea.l	g_Camera(a5),a0
	move.l	a0,-(a7)
	movea.l	(a0),a0
	movea.l	$2E(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
loc_1F1890:
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$72(a0),a1
	jsr	(a1)
	cmp.l	$8(a4),d5
	addq.w	#$4,a7
	bne.s	loc_1F18A8
	cmp.l	$C(a4),d6
	beq.s	loc_1F18AE
loc_1F18A8:
	ori.w	#$8,$4(a4)
loc_1F18AE:
	moveq	#$8,d0
	and.w	$4(a4),d0
	beq.s	loc_1F18BE
	move.l	a4,-(a7)
	jsr	$4DD2(a5)	; -> Obj_UpdateBoxes
	addq.w	#$4,a7
loc_1F18BE:
	tst.w	$6A(a4)
	ble.s	loc_1F18C8
	subq.w	#$1,$6A(a4)
loc_1F18C8:
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$76(a0),a1
	jsr	(a1)
	moveq	#$0,d7
	move.b	$2F(a4),d7
	move.l	$30(a4),d0
	moveq	#$24,d1
	add.l	d1,d0
	ext.l	d7
	move.l	d7,d2
	lsl.l	#$4,d2
	add.l	d0,d2
	ext.l	d7
	move.l	d7,d0
	lsl.l	#$2,d0
	add.l	d2,d0
	move.l	d0,-$4(a6)
	cmpi.w	#$FF,d7
	addq.w	#$4,a7
	beq.s	loc_1F1906
	movea.l	-$4(a6),a0
	tst.w	$C(a0)
	bne.s	loc_1F190C
loc_1F1906:
	moveq	#$0,d0
	movea.l	d0,a3
	bra.s	loc_1F1918
loc_1F190C:
	movea.l	$30(a4),a3
	movea.l	-$4(a6),a0
	adda.w	$C(a0),a3
loc_1F1918:
	move.l	a3,d0
	beq.s	loc_1F1964
	tst.b	-$35C8(a5)
	beq.s	loc_1F1964
	moveq	#$20,d0
	and.l	$90(a4),d0
	bne.s	loc_1F1964
	bra.s	loc_1F193E
loc_1F192C:
	move.b	$70(a4),d0
	asr.b	#$1,d0
	move.b	d0,$70(a4)
	ori.l	#$20,$90(a4)
loc_1F193E:
	tst.b	$70(a4)
	ble.s	loc_1F1964
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.l	d0,-(a7)
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.l	d0,-(a7)
	move.l	a3,-(a7)
	move.l	a4,-(a7)
	jsr	$3FBA(a5)	; -> sub_15CB34
	tst.b	d0
	lea.l	$10(a7),a7
	bne.s	loc_1F192C
loc_1F1964:
	movem.l	-$1C(a6),d3/d5-d7/a3-a4
	unlk	a6
	rts
