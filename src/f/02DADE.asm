; ---------------------------------------------------------------------------
; sub_02DADE	[jt 199]
; ---------------------------------------------------------------------------
sub_02DADE:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$5A,$6A(a4)
	move.b	$6B(a4),$A7(a4)
	ori.w	#$40,$6(a4)
	pea.l	($DF).w
	jsr	$5222(a5)	; -> sub_1FE5A2
	pea.l	($D8).w
	jsr	$5222(a5)	; -> sub_1FE5A2
	pea.l	($D8).w
	jsr	$521A(a5)	; -> sub_1FE584
	move.b	$17(a6),d0
	ext.w	d0
	sub.w	d0,$68(a4)
	tst.w	$68(a4)
	lea.l	$C(a7),a7
	bge.s	loc_02DB2A
	clr.w	$68(a4)
loc_02DB2A:
	tst.w	$68(a4)
	bne.s	loc_02DB98
	tst.w	-$359A(a5)
	bne.s	loc_02DB98
	moveq	#$28,d0
	move.l	d0,-(a7)
	jsr	$4F8A(a5)	; -> sub_1F944E
	move.b	$A6(a4),d0
	cmpi.b	#$4,d0
	addq.w	#$4,a7
	bhi.s	loc_02DB62
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	$2DB58(pc,d1.w),d1
	jmp	$2DB56(pc,d1.w)
