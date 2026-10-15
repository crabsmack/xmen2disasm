; ---------------------------------------------------------------------------
; sub_036DF0	[link-after-rts]
; ---------------------------------------------------------------------------
sub_036DF0:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.l	d0,-(a7)
	jsr	$722(a5)	; -> AvalonA4_ClearCameraZone
	move.w	#$500,$16(a4)
	move.w	#$FFB8,$18(a4)
	move.b	#$8,$9C(a4)
	move.w	$AE(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	moveq	#$4,d1
	and.b	$2E(a4),d1
	beq.s	loc_036E2C
	moveq	#$1,d1
	bra.s	loc_036E2E
loc_036E2C:
	moveq	#$0,d1
loc_036E2E:
	move.l	d1,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	moveq	#$0,d1
	move.b	$9C(a4),d1
	move.l	d1,-(a7)
	move.l	$C(a4),-(a7)
	move.l	$8(a4),-(a7)
	jsr	$3E4A(a5)	; -> sub_1595EE
	andi.w	#$FFFD,$6(a4)
	pea.l	-$1652(a5)
	move.l	a4,-(a7)
	jsr	$4062(a5)	; -> HitList_Add
	move.l	d0,$84(a4)
	ori.b	#$1,$9B(a4)
	lea.l	$2C(a7),a7
	clr.w	$6C(a4)
	lea.l	sub_036E82(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
