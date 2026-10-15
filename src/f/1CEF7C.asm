; ---------------------------------------------------------------------------
; sub_1CEF7C	[jt 2337]
; ---------------------------------------------------------------------------
sub_1CEF7C:
	link.w	a6,#$0
	movem.l	d3/d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$18(a4),d7
	tst.l	$44(a4)
	beq.s	loc_1CEF9E
	movea.l	$44(a4),a0
	moveq	#$2,d0
	and.b	(a0),d0
	bne.w	loc_1CF066
loc_1CEF9E:
	cmpi.w	#$FE00,d7
	bge.s	loc_1CEFBE
	moveq	#$0,d0
	move.l	d0,$44(a4)
	moveq	#$1C,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	bra.w	loc_1CF066
loc_1CEFBE:
	cmpi.w	#$200,d7
	bge.s	loc_1CEFDE
	moveq	#$0,d0
	move.l	d0,$44(a4)
	moveq	#$1D,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	bra.w	loc_1CF066
loc_1CEFDE:
	cmpi.w	#$300,d7
	bge.s	loc_1CF026
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1CEFF8
	move.w	-$3BA8(a5),d0
	and.w	g_Pad1Latch(a5),d0
	bra.s	loc_1CF000
loc_1CEFF8:
	move.w	-$3BA8(a5),d0
	and.w	g_Pad2Latch(a5),d0
loc_1CF000:
	bne.s	loc_1CF014
	lea.l	$4862(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	addq.w	#$8,a7
	bra.s	loc_1CF066
loc_1CF014:
	lea.l	$4872(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	addq.w	#$8,a7
	bra.s	loc_1CF066
loc_1CF026:
	tst.b	$9D(a4)
	seq.b	d3
	neg.b	d3
	beq.s	loc_1CF03A
	move.w	-$3BA8(a5),d0
	and.w	g_Pad1Latch(a5),d0
	bra.s	loc_1CF042
loc_1CF03A:
	move.w	-$3BA8(a5),d0
	and.w	g_Pad2Latch(a5),d0
loc_1CF042:
	bne.s	loc_1CF056
	lea.l	$486A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	addq.w	#$8,a7
	bra.s	loc_1CF066
loc_1CF056:
	lea.l	$487A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	addq.w	#$8,a7
loc_1CF066:
	movem.l	-$C(a6),d3/d7/a4
	unlk	a6
	rts
