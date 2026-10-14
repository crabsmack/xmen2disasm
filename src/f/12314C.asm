; ---------------------------------------------------------------------------
; sub_12314C	[link-after-rts]
; ---------------------------------------------------------------------------
sub_12314C:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.b	$B6(a4)
	beq.s	loc_123164
	andi.b	#$EF,$2E(a4)
	bra.s	loc_12316A
loc_123164:
	ori.b	#$10,$2E(a4)
loc_12316A:
	move.w	$10(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	$8(a4),d1
	sub.l	d0,d1
	cmpi.l	#$5000,d1
	ble.s	loc_1231C6
	clr.w	$1E(a4)
	clr.w	$16(a4)
	lea.l	$3462(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	pea.l	($F2).w
	jsr	$5222(a5)	; -> sub_1FE5A2
	pea.l	($F2).w
	jsr	$521A(a5)	; -> sub_1FE584
	move.l	a4,-(a7)
	jsr	$4E7A(a5)	; -> sub_1F6530
	lea.l	$14(a7),a7
	move.w	#$FF,$6C(a4)
	lea.l	sub_1231E0(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_1231D8
loc_1231C6:
	clr.w	$6C(a4)
	lea.l	sub_12314C(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_1231D8:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
