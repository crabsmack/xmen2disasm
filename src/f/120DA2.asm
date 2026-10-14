; ---------------------------------------------------------------------------
; sub_120DA2	[link-after-rts]
; ---------------------------------------------------------------------------
sub_120DA2:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.w	$98(a4),d1
	ext.l	d1
	cmp.l	d0,d1
	bgt.s	loc_120E12
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	moveq	#$0,d0
	move.l	d0,$44(a4)
	moveq	#$6,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	move.l	$9A(a4),-(a7)
	move.l	a4,-(a7)
	jsr	$4EBA(a5)	; -> sub_1F6B56
	move.b	#$1,$A6(a4)
	andi.w	#$EFFF,$6(a4)
	move.w	$A4(a4),$22(a4)
	lea.l	$10(a7),a7
	move.w	#$9,$6C(a4)
	lea.l	sub_12123E(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_120E24
loc_120E12:
	clr.w	$6C(a4)
	lea.l	sub_120DA2(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_120E24:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
