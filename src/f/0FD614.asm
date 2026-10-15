; ---------------------------------------------------------------------------
; sub_0FD614	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0FD614:
	link.w	a6,#$0
	move.l	d7,-(a7)
	lea.l	sub_0FCCAE(pc),a0
	move.l	a0,-$388E(a5)
	tst.l	g_Player1(a5)
	bne.s	loc_0FD662
	jsr	$4D9A(a5)	; -> Irq_Disable
loc_0FD62C:
	moveq	#$0,d7
	move.b	($C00008).l,d7
	moveq	#$0,d0
	move.b	($C00008).l,d0
	cmp.w	d7,d0
	bne.s	loc_0FD62C
	jsr	$4DA2(a5)	; -> Irq_Enable
	ext.l	d7
	move.w	-$3B90(a5),d0
	ext.l	d0
	add.l	d7,d0
	move.l	d0,-(a7)
	jsr	$4182(a5)	; -> sub_160512
	jsr	$4A(a5)	; -> Player1_StartLife
	move.w	#$4B0,-$3B0A(a5)
	addq.w	#$4,a7
	bra.s	loc_0FD666
loc_0FD662:
	clr.w	-$3B0A(a5)
loc_0FD666:
	moveq	#$2,d0
	and.w	-$3C5E(a5),d0
	beq.s	loc_0FD672
	clr.w	-$3B0A(a5)
loc_0FD672:
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	jsr	$8A(a5)	; -> Players_PlaceAtStart
	jsr	sub_0FCDEE(pc)
	jsr	sub_0FD50A(pc)
	jsr	sub_0FC71A(pc)
	jsr	sub_0FC8A4(pc)
	lea.l	$10(a7),a7
	move.l	-$4(a6),d7
	unlk	a6
	rts
