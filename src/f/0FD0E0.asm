; ---------------------------------------------------------------------------
; sub_0FD0E0	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0FD0E0:
	link.w	a6,#$FFE8
	movem.l	d3/d5-d7/a4,-(a7)
	move.w	$E(a6),d5
	move.w	$A(a6),d6
	clr.w	d7
loc_0FD0F2:
	jsr	sub_0FCE74(pc)
	movea.l	d0,a4
	move.l	a4,d0
	beq.w	loc_0FD242
	ext.l	d6
	move.l	d6,d0
	lsl.l	#$8,d0
	move.l	d0,-$4(a6)
	jsr	$417A(a5)	; -> sub_1600AA
	moveq	#$0,d1
	move.w	d0,d1
	move.w	#$3FF,d0
	and.w	d1,d0
	moveq	#$0,d1
	move.w	d0,d1
	move.l	d1,-$8(a6)
	jsr	$417A(a5)	; -> sub_1600AA
	moveq	#$0,d1
	move.w	d0,d1
	move.w	#$3FF,d0
	and.w	d1,d0
	moveq	#$0,d1
	move.w	d0,d1
	move.l	-$8(a6),d0
	sub.l	d1,d0
	move.l	-$4(a6),d1
	add.l	d1,d0
	move.l	d0,(a4)
	ext.l	d5
	move.l	d5,d0
	lsl.l	#$8,d0
	move.l	d0,-$C(a6)
	jsr	$417A(a5)	; -> sub_1600AA
	moveq	#$0,d1
	move.w	d0,d1
	move.w	#$3FF,d0
	and.w	d1,d0
	moveq	#$0,d1
	move.w	d0,d1
	move.l	d1,-$10(a6)
	jsr	$417A(a5)	; -> sub_1600AA
	moveq	#$0,d1
	move.w	d0,d1
	move.w	#$3FF,d0
	and.w	d1,d0
	moveq	#$0,d1
	move.w	d0,d1
	move.l	-$10(a6),d0
	sub.l	d1,d0
	move.l	-$C(a6),d1
	add.l	d1,d0
	move.l	d0,$4(a4)
	jsr	$417A(a5)	; -> sub_1600AA
	moveq	#$0,d1
	move.w	d0,d1
	move.w	#$1FF,d0
	and.w	d1,d0
	move.l	d0,-$14(a6)
	jsr	$417A(a5)	; -> sub_1600AA
	moveq	#$0,d1
	move.w	d0,d1
	move.w	#$1FF,d0
	and.w	d1,d0
	move.l	-$14(a6),d1
	sub.w	d0,d1
	move.w	d1,$8(a4)
	jsr	$417A(a5)	; -> sub_1600AA
	moveq	#$0,d1
	move.w	d0,d1
	move.w	#$1FF,d0
	and.w	d1,d0
	move.l	d0,-$18(a6)
	jsr	$417A(a5)	; -> sub_1600AA
	moveq	#$0,d1
	move.w	d0,d1
	move.w	#$1FF,d0
	and.w	d1,d0
	move.l	-$18(a6),d1
	sub.w	d0,d1
	move.w	d1,$A(a4)
	tst.w	$8(a4)
	ble.s	loc_0FD1E2
	move.w	#$2,$C(a4)
	bra.s	loc_0FD1E8
loc_0FD1E2:
	move.w	#$FFFE,$C(a4)
loc_0FD1E8:
	move.w	#$20,$E(a4)
	jsr	$417A(a5)	; -> sub_1600AA
	moveq	#$0,d1
	move.w	d0,d1
	moveq	#$1,d0
	and.w	d1,d0
	beq.s	loc_0FD200
	moveq	#$0,d0
	bra.s	loc_0FD202
loc_0FD200:
	moveq	#$3,d0
loc_0FD202:
	move.b	d0,$11(a4)
	jsr	$417A(a5)	; -> sub_1600AA
	moveq	#$0,d1
	move.w	d0,d1
	moveq	#$1,d0
	and.w	d1,d0
	move.b	d0,$10(a4)
	jsr	$417A(a5)	; -> sub_1600AA
	moveq	#$0,d1
	move.w	d0,d1
	moveq	#$3,d0
	and.w	d1,d0
	move.b	d0,$12(a4)
	jsr	$417A(a5)	; -> sub_1600AA
	moveq	#$0,d1
	move.w	d0,d1
	moveq	#$3F,d0
	and.w	d1,d0
	move.b	d0,$13(a4)
	move.w	d7,d0
	addq.w	#$1,d7
	cmpi.w	#$4,d7
	blt.w	loc_0FD0F2
loc_0FD242:
	movem.l	-$2C(a6),d3/d5-d7/a4
	unlk	a6
	rts
