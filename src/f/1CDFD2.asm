; ---------------------------------------------------------------------------
; sub_1CDFD2	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1CDFD2:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$467A(a5),a0
	move.l	$44(a4),d0
	cmp.l	$2(a0),d0
	bne.s	loc_1CDFF4
	move.w	#$1,$12(a4)
	bra.s	loc_1CDFF8
loc_1CDFF4:
	clr.w	$12(a4)
loc_1CDFF8:
	tst.w	$12(a4)
	bne.s	loc_1CE008
	movea.l	$8C(a4),a0
	move.w	$E(a0),$20(a4)
loc_1CE008:
	tst.b	$9D(a4)
	bne.s	loc_1CE01E
	move.w	-$3BA6(a5),d0
	not.w	d0
	and.w	g_Pad1Latch(a5),d0
	move.w	d0,g_Pad1Latch(a5)
	bra.s	loc_1CE02C
loc_1CE01E:
	move.w	-$3BA6(a5),d0
	not.w	d0
	and.w	g_Pad2Latch(a5),d0
	move.w	d0,g_Pad2Latch(a5)
loc_1CE02C:
	move.w	$BC(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	$3E2A(a5)	; -> sub_159092
	movea.l	d0,a3
	move.l	a3,-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	lea.l	sub_1CDEB2(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	sub_1CDEB2(pc)
	lea.l	$10(a7),a7
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
