; ---------------------------------------------------------------------------
; sub_085C5E	[jt 612]
; ---------------------------------------------------------------------------
sub_085C5E:
	link.w	a6,#$0
	move.l	a4,-(a7)
	pea.l	$85D4A(pc)
	moveq	#$68,d0
	move.l	d0,-(a7)
	jsr	$5032(a5)	; -> Mem_StackAlloc
	movea.l	d0,a4
	move.l	a4,d0
	addq.w	#$8,a7
	beq.w	loc_085D40
	moveq	#$68,d0
	move.l	d0,-(a7)
	moveq	#$0,d1
	move.l	d1,-(a7)
	move.l	a4,-(a7)
	jsr	$4DB2(a5)	; -> Mem_Set
	lea.l	$14EA(a5),a0
	move.l	$2(a0),(a4)
	move.w	$E(a6),$8(a4)
	move.w	$E(a6),$4(a4)
	move.w	$12(a6),$A(a4)
	move.w	$12(a6),$6(a4)
	move.w	-$3B04(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	pea.l	$16(a4)
	jsr	$3F42(a5)	; -> sub_15B18A
	ori.b	#$4,$16(a4)
	move.w	-$3B04(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	pea.l	$32(a4)
	jsr	$3F42(a5)	; -> sub_15B18A
	ori.b	#$4,$32(a4)
	move.w	-$3B04(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	pea.l	$4E(a4)
	jsr	$3F42(a5)	; -> sub_15B18A
	ori.b	#$4,$4E(a4)
	clr.b	$C(a4)
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	sub_085BE8(pc)
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	move.l	d0,-(a7)
	movea.l	(a4),a0
	move.l	$E(a0),-(a7)
	jsr	$4FD2(a5)	; -> Timer_Create
	move.l	d0,$62(a4)
	lea.l	$3C(a7),a7
	beq.s	loc_085D1E
	move.l	$62(a4),-(a7)
	jsr	$4FDA(a5)	; -> Timer_Start
	addq.w	#$4,a7
loc_085D1E:
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	moveq	#$7F,d1
	move.l	d1,-(a7)
	moveq	#$4,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	move.l	$12(a0),-(a7)
	jsr	$4F6A(a5)	; -> DrawList_Add
	move.w	d0,$66(a4)
	lea.l	$18(a7),a7
loc_085D40:
	move.l	a4,d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
