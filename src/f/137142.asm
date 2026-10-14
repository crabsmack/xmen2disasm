; ---------------------------------------------------------------------------
; sub_137142	[jt 1794]
; ---------------------------------------------------------------------------
sub_137142:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	$8(a6),-(a7)
	lea.l	$383A(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$383A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$E(a0),a1
	jsr	(a1)
	movea.l	d0,a4
	move.l	a4,d0
	lea.l	$14(a7),a7
	beq.w	loc_137246
	move.l	a4,-(a7)
	jsr	$4EAA(a5)	; -> sub_1F694A
	movea.l	d0,a3
	move.l	$8(a3),d0
	cmp.l	$8(a4),d0
	addq.w	#$4,a7
	bge.s	loc_137198
	ori.b	#$10,$2E(a4)
	bra.s	loc_13719E
loc_137198:
	andi.b	#$EF,$2E(a4)
loc_13719E:
	ori.w	#$1000,$6(a4)
	move.w	$16(a6),$9E(a4)
	move.w	$16(a6),d0
	bmi.s	loc_1371C8
	cmpi.w	#$3,d0
	bgt.s	loc_1371C8
	add.w	d0,d0
	move.w	$1371C0(pc,d0.w),d0
	jmp	$1371BE(pc,d0.w)
