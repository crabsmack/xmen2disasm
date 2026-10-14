; ---------------------------------------------------------------------------
; sub_111DEA	[jt 1380]
; ---------------------------------------------------------------------------
sub_111DEA:
	link.w	a6,#$0
	pea.l	$111E42(pc)
	moveq	#$14,d0
	move.l	d0,-(a7)
	jsr	$5032(a5)	; -> sub_1FA8DC
	move.l	d0,-$3B18(a5)
	addq.w	#$8,a7
	beq.s	loc_111E16
	moveq	#$14,d0
	move.l	d0,-(a7)
	moveq	#$0,d1
	move.l	d1,-(a7)
	move.l	-$3B18(a5),-(a7)
	jsr	$4DB2(a5)	; -> sub_1F4900
	lea.l	$C(a7),a7
loc_111E16:
	moveq	#$1,d0
	move.l	d0,-(a7)
	lea.l	$2AB2(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> sub_1F62C0
	move.w	d0,-$3BC0(a5)
	moveq	#$1,d0
	move.l	d0,-(a7)
	lea.l	$2AC2(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> sub_1F62C0
	move.w	d0,-$3B04(a5)
	unlk	a6
	rts
