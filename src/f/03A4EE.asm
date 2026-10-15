; ---------------------------------------------------------------------------
; BanimazaDoor_Draw - vtable +$1A: draw a BANIMAZADOOR
; In:  8(a6) = this (BANIMAZADOOR object)
; Out: none
; Evidence: class descriptor BANIMAZADOOR slot +$1A (tools/classes.py); TAS frames 23673-23742 (41 active)
; ---------------------------------------------------------------------------
BanimazaDoor_Draw:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	tst.b	$A0(a4)
	beq.s	loc_03A562
	moveq	#$0,d0
	move.b	$7A(a4),d0
	ext.l	d0
	lsl.l	#$2,d0
	move.l	d0,d1
	lsl.l	#$2,d0
	add.l	d1,d0
	lea.l	-$33D2(a5),a0
	lea.l	(a0,d0.w),a3
	move.w	$12(a4),$54(a4)
	move.w	$12(a4),$4C(a4)
	move.w	$12(a4),$A(a3)
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.w	d0,$58(a4)
	move.w	d0,$50(a4)
	move.w	d0,$E(a3)
	move.w	$10(a4),d0
	subq.w	#$5,d0
	move.w	d0,$4E(a4)
	move.w	d0,$56(a4)
	move.w	d0,$8(a3)
	move.w	$10(a4),d0
	add.w	#$25,d0
	move.w	d0,$52(a4)
	move.w	d0,$5A(a4)
	move.w	d0,$C(a3)
loc_03A562:
	move.b	$9A(a4),d0
	cmpi.b	#$3,d0
	bhi.s	loc_03A5B4
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	Sw_03A4EE(pc,d1.w),d1
	jmp	Sw_03A4EE-2(pc,d1.w)
