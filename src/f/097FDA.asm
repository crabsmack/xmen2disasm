; ---------------------------------------------------------------------------
; sub_097FDA	[jt 769]
; ---------------------------------------------------------------------------
sub_097FDA:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,d0
	beq.s	loc_098062
	moveq	#$2A,d0
	move.l	d0,-(a7)
	moveq	#$0,d1
	move.l	d1,-(a7)
	move.l	a4,-(a7)
	jsr	$4DB2(a5)	; -> Mem_Set
	lea.l	$1912(a5),a0
	move.l	$2(a0),(a4)
	move.w	$E(a6),$4(a4)
	move.w	$12(a6),$6(a4)
	tst.b	$1B(a6)
	lea.l	$C(a7),a7
	beq.s	loc_09801A
	ori.b	#$10,$10(a4)
loc_09801A:
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	move.l	d0,-(a7)
	movea.l	(a4),a0
	move.l	$E(a0),-(a7)
	jsr	$4FD2(a5)	; -> Timer_Create
	move.l	d0,$24(a4)
	lea.l	$10(a7),a7
	beq.s	loc_098040
	move.l	$24(a4),-(a7)
	jsr	$4FDA(a5)	; -> Timer_Start
	addq.w	#$4,a7
loc_098040:
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
	move.w	d0,$28(a4)
	lea.l	$18(a7),a7
loc_098062:
	move.l	a4,d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
