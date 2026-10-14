; ---------------------------------------------------------------------------
; sub_006672	[link-after-rts]
; ---------------------------------------------------------------------------
sub_006672:
	link.w	a6,#$FFEC
	movem.l	d3/d5-d7,-(a7)
	clr.w	d6
	clr.w	d5
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	moveq	#$1,d1
	move.l	d1,-(a7)
	moveq	#-$1,d0
	move.l	d0,-(a7)
	lea.l	$433A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d1,-(a7)
	pea.l	-$14(a6)
	jsr	$506A(a5)	; -> sub_1FB026
	move.w	d0,d5
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	moveq	#$1,d1
	move.l	d1,-(a7)
	moveq	#-$1,d0
	move.l	d0,-(a7)
	lea.l	$434A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d1,-(a7)
	pea.l	-$14(a6)
	jsr	$506A(a5)	; -> sub_1FB026
	move.w	d0,d7
	add.w	d5,d7
	cmp.w	d6,d7
	slt.b	d3
	neg.b	d3
	beq.s	loc_0066D0
	move.w	d6,d0
	bra.s	loc_0066D2
loc_0066D0:
	move.w	d7,d0
loc_0066D2:
	move.w	d0,d6
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	moveq	#$1,d1
	move.l	d1,-(a7)
	moveq	#-$1,d0
	move.l	d0,-(a7)
	lea.l	$434A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d1,-(a7)
	pea.l	-$14(a6)
	jsr	$506A(a5)	; -> sub_1FB026
	move.w	d0,d7
	add.w	d5,d7
	cmp.w	d6,d7
	slt.b	d3
	neg.b	d3
	beq.s	loc_006704
	move.w	d6,d0
	bra.s	loc_006706
loc_006704:
	move.w	d7,d0
loc_006706:
	move.w	d0,d6
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	moveq	#$1,d1
	move.l	d1,-(a7)
	moveq	#-$1,d0
	move.l	d0,-(a7)
	lea.l	$4442(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d1,-(a7)
	pea.l	-$14(a6)
	jsr	$506A(a5)	; -> sub_1FB026
	move.w	d0,d7
	cmp.w	d6,d7
	slt.b	d3
	neg.b	d3
	beq.s	loc_006736
	move.w	d6,d0
	bra.s	loc_006738
loc_006736:
	move.w	d7,d0
loc_006738:
	move.w	d0,d6
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	moveq	#$1,d1
	move.l	d1,-(a7)
	moveq	#-$1,d0
	move.l	d0,-(a7)
	lea.l	$444A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d1,-(a7)
	pea.l	-$14(a6)
	jsr	$506A(a5)	; -> sub_1FB026
	move.w	d0,d7
	cmp.w	d6,d7
	slt.b	d3
	neg.b	d3
	beq.s	loc_006768
	move.w	d6,d0
	bra.s	loc_00676A
loc_006768:
	move.w	d7,d0
loc_00676A:
	move.w	d0,d6
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	moveq	#$1,d1
	move.l	d1,-(a7)
	moveq	#-$1,d0
	move.l	d0,-(a7)
	lea.l	$464A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d1,-(a7)
	pea.l	-$14(a6)
	jsr	$506A(a5)	; -> sub_1FB026
	move.w	d0,d7
	addi.w	#$10,d7
	cmp.w	d6,d7
	slt.b	d3
	neg.b	d3
	beq.s	loc_00679E
	move.w	d6,d0
	bra.s	loc_0067A0
loc_00679E:
	move.w	d7,d0
loc_0067A0:
	move.w	d0,d6
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	moveq	#$1,d1
	move.l	d1,-(a7)
	moveq	#-$1,d0
	move.l	d0,-(a7)
	lea.l	$4652(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d1,-(a7)
	pea.l	-$14(a6)
	jsr	$506A(a5)	; -> sub_1FB026
	move.w	d0,d7
	addi.w	#$10,d7
	cmp.w	d6,d7
	slt.b	d3
	neg.b	d3
	beq.s	loc_0067D4
	move.w	d6,d0
	bra.s	loc_0067D6
loc_0067D4:
	move.w	d7,d0
loc_0067D6:
	move.w	d0,d6
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	moveq	#$1,d1
	move.l	d1,-(a7)
	moveq	#-$1,d0
	move.l	d0,-(a7)
	lea.l	$465A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d1,-(a7)
	pea.l	-$14(a6)
	jsr	$506A(a5)	; -> sub_1FB026
	move.w	d0,d7
	addi.w	#$10,d7
	cmp.w	d6,d7
	slt.b	d3
	neg.b	d3
	beq.s	loc_00680A
	move.w	d6,d0
	bra.s	loc_00680C
loc_00680A:
	move.w	d7,d0
loc_00680C:
	move.w	d0,d6
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	moveq	#$1,d1
	move.l	d1,-(a7)
	moveq	#-$1,d0
	move.l	d0,-(a7)
	lea.l	$454A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d1,-(a7)
	pea.l	-$14(a6)
	jsr	$506A(a5)	; -> sub_1FB026
	move.w	d0,d7
	cmp.w	d6,d7
	slt.b	d3
	neg.b	d3
	beq.s	loc_00683C
	move.w	d6,d0
	bra.s	loc_00683E
loc_00683C:
	move.w	d7,d0
loc_00683E:
	move.w	d0,d6
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	moveq	#$1,d1
	move.l	d1,-(a7)
	moveq	#-$1,d0
	move.l	d0,-(a7)
	lea.l	$4552(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d1,-(a7)
	pea.l	-$14(a6)
	jsr	$506A(a5)	; -> sub_1FB026
	move.w	d0,d7
	cmp.w	d6,d7
	slt.b	d3
	neg.b	d3
	beq.s	loc_00686E
	move.w	d6,d0
	bra.s	loc_006870
loc_00686E:
	move.w	d7,d0
loc_006870:
	move.w	d0,d6
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	moveq	#$1,d1
	move.l	d1,-(a7)
	moveq	#-$1,d0
	move.l	d0,-(a7)
	lea.l	$455A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d1,-(a7)
	pea.l	-$14(a6)
	jsr	$506A(a5)	; -> sub_1FB026
	move.w	d0,d7
	cmp.w	d6,d7
	slt.b	d3
	neg.b	d3
	beq.s	loc_0068A0
	move.w	d6,d0
	bra.s	loc_0068A2
loc_0068A0:
	move.w	d7,d0
loc_0068A2:
	move.w	d0,d6
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	moveq	#$1,d1
	move.l	d1,-(a7)
	moveq	#-$1,d0
	move.l	d0,-(a7)
	lea.l	$3D9A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d1,-(a7)
	pea.l	-$14(a6)
	jsr	$506A(a5)	; -> sub_1FB026
	move.w	d0,d7
	cmp.w	d6,d7
	slt.b	d3
	neg.b	d3
	beq.s	loc_0068D2
	move.w	d6,d0
	bra.s	loc_0068D4
loc_0068D2:
	move.w	d7,d0
loc_0068D4:
	move.w	d0,d6
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	moveq	#$1,d1
	move.l	d1,-(a7)
	moveq	#-$1,d0
	move.l	d0,-(a7)
	lea.l	$3D8A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d1,-(a7)
	pea.l	-$14(a6)
	jsr	$506A(a5)	; -> sub_1FB026
	move.w	d0,d7
	cmp.w	d6,d7
	slt.b	d3
	neg.b	d3
	beq.s	loc_006904
	move.w	d6,d0
	bra.s	loc_006906
loc_006904:
	move.w	d7,d0
loc_006906:
	move.w	d0,d6
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	moveq	#$1,d1
	move.l	d1,-(a7)
	moveq	#-$1,d0
	move.l	d0,-(a7)
	lea.l	$3DA2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d1,-(a7)
	pea.l	-$14(a6)
	jsr	$506A(a5)	; -> sub_1FB026
	move.w	d0,d7
	cmp.w	d6,d7
	slt.b	d3
	neg.b	d3
	beq.s	loc_006936
	move.w	d6,d0
	bra.s	loc_006938
loc_006936:
	move.w	d7,d0
loc_006938:
	move.w	d0,d6
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	moveq	#$1,d1
	move.l	d1,-(a7)
	moveq	#-$1,d0
	move.l	d0,-(a7)
	lea.l	$49A2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d1,-(a7)
	pea.l	-$14(a6)
	jsr	$506A(a5)	; -> sub_1FB026
	move.w	d0,d7
	addi.w	#$D,d7
	cmp.w	d6,d7
	slt.b	d3
	neg.b	d3
	beq.s	loc_00696C
	move.w	d6,d0
	bra.s	loc_00696E
loc_00696C:
	move.w	d7,d0
loc_00696E:
	move.w	d0,d6
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	moveq	#$1,d1
	move.l	d1,-(a7)
	moveq	#-$1,d0
	move.l	d0,-(a7)
	lea.l	$49AA(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d1,-(a7)
	pea.l	-$14(a6)
	jsr	$506A(a5)	; -> sub_1FB026
	move.w	d0,d7
	addi.w	#$D,d7
	cmp.w	d6,d7
	slt.b	d3
	neg.b	d3
	beq.s	loc_0069A2
	move.w	d6,d0
	bra.s	loc_0069A4
loc_0069A2:
	move.w	d7,d0
loc_0069A4:
	move.w	d0,d6
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	moveq	#$1,d1
	move.l	d1,-(a7)
	moveq	#-$1,d0
	move.l	d0,-(a7)
	lea.l	$49B2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d1,-(a7)
	pea.l	-$14(a6)
	jsr	$506A(a5)	; -> sub_1FB026
	move.w	d0,d7
	addi.w	#$D,d7
	cmp.w	d6,d7
	slt.b	d3
	neg.b	d3
	beq.s	loc_0069D8
	move.w	d6,d0
	bra.s	loc_0069DA
loc_0069D8:
	move.w	d7,d0
loc_0069DA:
	move.w	d0,d6
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	moveq	#$1,d1
	move.l	d1,-(a7)
	moveq	#-$1,d0
	move.l	d0,-(a7)
	lea.l	$4B42(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d1,-(a7)
	pea.l	-$14(a6)
	jsr	$506A(a5)	; -> sub_1FB026
	move.w	d0,d7
	addi.w	#$34,d7
	cmp.w	d6,d7
	slt.b	d3
	neg.b	d3
	beq.s	loc_006A0E
	move.w	d6,d0
	bra.s	loc_006A10
loc_006A0E:
	move.w	d7,d0
loc_006A10:
	move.w	d0,d6
	lea.l	$1F8(a7),a7
	movem.l	-$24(a6),d3/d5-d7
	unlk	a6
	rts
