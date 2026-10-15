; ---------------------------------------------------------------------------
; sub_05C6AA	[link-after-rts]
; ---------------------------------------------------------------------------
sub_05C6AA:
	link.w	a6,#$0
	movem.l	d3/a3-a4,-(a7)
	movea.l	$8(a6),a3
	moveq	#$0,d0
	move.b	$3B(a3),d0
	cmpi.w	#$FF,d0
	seq.b	d3
	neg.b	d3
	beq.s	loc_05C6CA
	moveq	#$0,d0
	bra.s	loc_05C6DA
loc_05C6CA:
	moveq	#$0,d0
	move.b	$3B(a3),d0
	movea.l	-$34A6(a5),a0
	asl.l	#$2,d0
	move.l	(a0,d0.l),d0
loc_05C6DA:
	movea.l	d0,a4
	move.l	a4,d0
	bne.s	loc_05C6EE
	lea.l	sub_05C4A0(pc),a0
	move.l	a0,$5C(a3)
	moveq	#$0,d0
	bra.w	loc_05C8EA
loc_05C6EE:
	moveq	#$3,d0
	move.l	d0,-(a7)
	move.l	a3,-(a7)
	movea.l	(a3),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	pea.l	($AC).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($AC).w
	jsr	$521A(a5)	; -> Snd_Play
	move.l	a4,-(a7)
	jsr	$4E7A(a5)	; -> Obj_Detach
	move.w	#$2BC,$16(a4)
	move.w	#$FDA8,$18(a4)
	move.w	#$6E,$20(a4)
	moveq	#$10,d0
	and.b	$2E(a3),d0
	lea.l	$14(a7),a7
	beq.s	loc_05C73C
	move.w	$16(a4),d0
	ext.l	d0
	neg.l	d0
	move.w	d0,$16(a4)
loc_05C73C:
	move.b	$99(a3),d0
	addq.b	#$6,d0
	beq.s	loc_05C784
	subq.b	#$1,d0
	beq.s	loc_05C79A
	subq.b	#$1,d0
	beq.s	loc_05C7B0
	subq.b	#$1,d0
	beq.s	loc_05C7C6
	subq.b	#$1,d0
	beq.w	loc_05C7DC
	subq.b	#$1,d0
	beq.w	loc_05C7F2
	subq.b	#$1,d0
	beq.w	loc_05C806
	subq.b	#$1,d0
	beq.w	loc_05C81A
	subq.b	#$1,d0
	beq.w	loc_05C82E
	subq.b	#$1,d0
	beq.w	loc_05C842
	subq.b	#$1,d0
	beq.w	loc_05C856
	subq.b	#$1,d0
	beq.w	loc_05C86A
	bra.w	loc_05C87C
loc_05C784:
	move.w	#$424,$16(a4)
	move.w	#$FC4A,$18(a4)
	move.w	#$64,$20(a4)
	bra.w	loc_05C87C
loc_05C79A:
	move.w	#$424,$16(a4)
	move.w	#$FC4A,$18(a4)
	move.w	#$64,$20(a4)
	bra.w	loc_05C87C
loc_05C7B0:
	move.w	#$384,$16(a4)
	move.w	#$FDA8,$18(a4)
	move.w	#$6E,$20(a4)
	bra.w	loc_05C87C
loc_05C7C6:
	move.w	#$2BC,$16(a4)
	move.w	#$FDA8,$18(a4)
	move.w	#$6E,$20(a4)
	bra.w	loc_05C87C
loc_05C7DC:
	move.w	#$258,$16(a4)
	move.w	#$FD44,$18(a4)
	move.w	#$6E,$20(a4)
	bra.w	loc_05C87C
loc_05C7F2:
	move.w	#$12C,$16(a4)
	move.w	#$2BC,$18(a4)
	move.w	#$6E,$20(a4)
	bra.s	loc_05C87C
loc_05C806:
	move.w	#$96,$16(a4)
	move.w	#$4EC,$18(a4)
	move.w	#$50,$20(a4)
	bra.s	loc_05C87C
loc_05C81A:
	move.w	#$12C,$16(a4)
	move.w	#$2BC,$18(a4)
	move.w	#$6E,$20(a4)
	bra.s	loc_05C87C
loc_05C82E:
	move.w	#$258,$16(a4)
	move.w	#$FD44,$18(a4)
	move.w	#$6E,$20(a4)
	bra.s	loc_05C87C
loc_05C842:
	move.w	#$2BC,$16(a4)
	move.w	#$FDA8,$18(a4)
	move.w	#$6E,$20(a4)
	bra.s	loc_05C87C
loc_05C856:
	move.w	#$384,$16(a4)
	move.w	#$FDA8,$18(a4)
	move.w	#$6E,$20(a4)
	bra.s	loc_05C87C
loc_05C86A:
	move.w	#$424,$16(a4)
	move.w	#$FC4A,$18(a4)
	move.w	#$64,$20(a4)
loc_05C87C:
	tst.w	$22(a4)
	sge.b	d3
	neg.b	d3
	beq.s	loc_05C88E
	move.w	$22(a4),d0
	ext.l	d0
	bra.s	loc_05C896
loc_05C88E:
	move.w	$22(a4),d0
	ext.l	d0
	neg.l	d0
loc_05C896:
	move.w	d0,$22(a4)
	tst.w	$24(a4)
	sge.b	d3
	neg.b	d3
	beq.s	loc_05C8AC
	move.w	$24(a4),d0
	ext.l	d0
	bra.s	loc_05C8B4
loc_05C8AC:
	move.w	$24(a4),d0
	ext.l	d0
	neg.l	d0
loc_05C8B4:
	move.w	d0,$24(a4)
	tst.b	$99(a3)
	bge.s	loc_05C8CA
	move.w	$16(a4),d0
	ext.l	d0
	neg.l	d0
	move.w	d0,$16(a4)
loc_05C8CA:
	lea.l	$D2A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a3,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	move.w	#$14,$6E(a3)
	lea.l	sub_05C4A0(pc),a0
	move.l	a0,$5C(a3)
	addq.w	#$8,a7
	moveq	#$0,d0
loc_05C8EA:
	movem.l	-$C(a6),d3/a3-a4
	unlk	a6
	rts
