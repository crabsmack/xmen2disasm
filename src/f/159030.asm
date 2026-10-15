; ---------------------------------------------------------------------------
; sub_159030	[link-after-rts]
; ---------------------------------------------------------------------------
sub_159030:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.b	$FE(a4)
	beq.s	loc_15905A
	tst.w	$6E(a4)
	ble.s	loc_15905A
	clr.w	$6C(a4)
	lea.l	sub_159030(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_15908A
loc_15905A:
	ori.w	#$4000,$6(a4)
	lea.l	$478A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	move.l	a4,-(a7)
	jsr	sub_158536(pc)
	lea.l	$C(a7),a7
	clr.w	$6C(a4)
	lea.l	sub_158EEE(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_15908A:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
