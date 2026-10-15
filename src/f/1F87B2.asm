; ---------------------------------------------------------------------------
; sub_1F87B2	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1F87B2:
	link.w	a6,#$0
	movem.l	d3-d7/a2-a4,-(a7)
	movea.l	$C(a6),a4
	movea.l	$10(a6),a2
	movea.l	$8(a6),a3
	moveq	#$0,d0
	move.b	$1(a3),d0
	add.w	d0,d0
	add.w	d0,d0
	lea.l	g_SegTypeHooks(a5),a0
	move.l	(a0,d0.w),d0
	beq.s	loc_1F87EC
	movea.l	d0,a0
	move.l	a2,-(a7)
	move.l	a4,-(a7)
	move.l	a3,-(a7)
	pea.l	($3).w
	jsr	(a0)
	lea.l	$10(a7),a7
loc_1F87EC:
	tst.b	d0
	bne.w	loc_1F8AEE
	move.w	$4E(a4),d7
	add.w	$52(a4),d7
	asr.w	#$1,d7
	move.w	$4C(a4),d6
	add.w	$50(a4),d6
	asr.w	#$1,d6
	move.w	$A(a3),d4
	move.w	$E(a3),d5
	cmp.w	d4,d5
	bge.s	loc_1F8814
	exg.l	d4,d5
loc_1F8814:
	moveq	#$0,d0
	move.b	d0,$3(a2)
	move.b	d0,$4(a2)
	move.b	$1(a3),d0
	cmpi.w	#$24,d0
	bhi.w	loc_1F8836
	add.w	d0,d0
	lea.l	$1F8AF8(pc),a0
	adda.w	(a0,d0.w),a0
	jmp	(a0)
loc_1F8836:
	bra.w	loc_1F8ACA
