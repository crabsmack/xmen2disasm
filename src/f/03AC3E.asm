; ---------------------------------------------------------------------------
; RollingDiscs_ClassInit - vtable +$5E: per-level class setup for ROLLINGDISCS (load its resources)
; In:  8(a6) = this, $C(a6) = class index
; Out: none
; Evidence: class descriptor ROLLINGDISCS slot +$5E (tools/classes.py); TAS frames 22435-22435 (1 active)
; ---------------------------------------------------------------------------
RollingDiscs_ClassInit:
	link.w	a6,#$0
	movem.l	d3/d7/a3-a4,-(a7)
	movea.l	-$CB2(a5),a0
	moveq	#$0,d0
	move.w	$12(a0),d0
	tst.l	d0
	movea.l	d0,a4
	adda.l	-$CB2(a5),a4
	movea.l	a4,a3
	addq.w	#$2,a3
	move.l	$8(a6),-(a7)
	jsr	sub_03AC36(pc)
	move.w	(a4),-$3C7A(a5)
	pea.l	Str_Empty_03AD12(pc)
	move.w	-$3C7A(a5),d1
	ext.l	d1
	lsl.l	#$2,d1
	move.l	d1,d0
	lsl.l	#$2,d1
	add.l	d0,d1
	move.l	d1,-(a7)
	jsr	$5032(a5)	; -> Mem_StackAlloc
	move.l	d0,-$3C7E(a5)
	move.w	-$3C7A(a5),d0
	ext.l	d0
	move.l	d0,d7
	movea.l	-$3C7E(a5),a4
	lea.l	$C(a7),a7
	bra.s	loc_03AD00
loc_03AC96:
	move.w	$2(a3),(a4)
	move.w	$4(a3),$2(a4)
	move.w	$2(a3),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$4(a4)
	move.w	$4(a3),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$8(a4)
	move.w	$6(a3),$C(a4)
	sge.b	d3
	neg.b	d3
	beq.s	loc_03ACCC
	move.w	$6(a3),d0
	ext.l	d0
	bra.s	loc_03ACD4
loc_03ACCC:
	move.w	$6(a3),d0
	ext.l	d0
	neg.l	d0
loc_03ACD4:
	move.w	d0,$E(a4)
	move.w	$8(a3),$10(a4)
	move.b	$B(a3),$12(a4)
	tst.w	$E(a3)
	beq.s	loc_03ACEE
	moveq	#$0,d0
	bra.s	loc_03ACF0
loc_03ACEE:
	moveq	#$1,d0
loc_03ACF0:
	move.b	d0,$13(a4)
	move.l	d7,d0
	subq.l	#$1,d7
	lea.l	$14(a4),a4
	lea.l	$10(a3),a3
loc_03AD00:
	tst.l	d7
	bne.s	loc_03AC96
	clr.w	-$3C80(a5)
	movem.l	-$10(a6),d3/d7/a3-a4
	unlk	a6
	rts
