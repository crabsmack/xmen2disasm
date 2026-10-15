; ---------------------------------------------------------------------------
; Boulder_Update - vtable +$4A: per-frame update of a BOULDER
; In:  8(a6) = this (BOULDER object)
; Out: none
; Evidence: class descriptor BOULDER slot +$4A (tools/classes.py); TAS frames 20651-20996 (180 active)
; ---------------------------------------------------------------------------
Boulder_Update:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	lea.l	$D22(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$4A(a0),a1
	jsr	(a1)
	tst.l	$B8(a4)
	addq.w	#$4,a7
	beq.w	loc_05BC6E
	tst.b	-$38DE(a5)
	beq.s	loc_05BBF6
	moveq	#$2,d0
	bra.s	loc_05BBF8
loc_05BBF6:
	moveq	#$1,d0
loc_05BBF8:
	ext.w	d0
	add.w	d0,$26(a4)
	movea.l	$B8(a4),a0
	move.w	$26(a4),d0
	cmp.w	$2(a0),d0
	blt.s	loc_05BC6E
	addq.w	#$1,$28(a4)
	moveq	#$0,d0
	move.b	$1(a0),d0
	cmp.w	$28(a4),d0
	bgt.s	loc_05BC34
	clr.w	$28(a4)
	movea.l	$B8(a4),a0
	moveq	#$0,d0
	move.b	(a0),d0
	moveq	#$2,d1
	and.b	d0,d1
	beq.s	loc_05BC34
	moveq	#$0,d0
	move.l	d0,$B8(a4)
loc_05BC34:
	tst.l	$B8(a4)
	beq.s	loc_05BC6E
	move.w	$28(a4),d0
	ext.l	d0
	lsl.l	#$1,d0
	add.l	$B8(a4),d0
	movea.l	d0,a0
	move.b	$7(a0),$A5(a4)
	moveq	#$0,d0
	move.b	$A5(a4),d0
	cmpi.w	#$FF,d0
	beq.s	loc_05BC64
	move.b	$A5(a4),d0
	cmp.b	$AE(a4),d0
	beq.s	loc_05BC6A
loc_05BC64:
	andi.b	#$DF,$A4(a4)
loc_05BC6A:
	clr.w	$26(a4)
loc_05BC6E:
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.w	-$3490(a5),d1
	ext.l	d1
	move.l	d0,d7
	sub.l	d1,d7
	cmpi.l	#$144,d7
	ble.s	loc_05BC92
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
loc_05BC92:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
