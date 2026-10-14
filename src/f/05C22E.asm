; ---------------------------------------------------------------------------
; sub_05C22E	[link-after-rts]
; ---------------------------------------------------------------------------
sub_05C22E:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$4(a4),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_05C27E
	andi.b	#$FB,$2E(a4)
	moveq	#$8,d0
	and.w	$6(a4),d0
	moveq	#$0,d1
	move.w	d0,d1
	move.l	d1,-(a7)
	moveq	#$0,d0
	move.b	$42(a4),d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.w	$88(a4),d1
	ext.l	d1
	move.l	d1,-(a7)
	jsr	$4F7A(a5)	; -> sub_1F91E8
	lea.l	$10(a7),a7
loc_05C27E:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
