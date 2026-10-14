; ---------------------------------------------------------------------------
; sub_09615C	[link-after-rts]
; ---------------------------------------------------------------------------
sub_09615C:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$9C(a4),a3
	moveq	#$10,d0
	and.b	$2E(a4),d0
	bne.s	loc_09617C
	andi.b	#$EF,$2E(a3)
	bra.s	loc_096182
loc_09617C:
	ori.b	#$10,$2E(a3)
loc_096182:
	lea.l	$1962(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$8C(a3)
	jsr	$3ED2(a5)	; -> sub_15A6DE
	move.l	$8(a4),$8(a3)
	move.l	$C(a4),$C(a3)
	clr.b	$96(a3)
	pea.l	($EF).w
	jsr	$5222(a5)	; -> sub_1FE5A2
	pea.l	($EF).w
	jsr	$521A(a5)	; -> sub_1FE584
	movea.l	$A8(a4),a0
	movea.l	a0,a1
	adda.w	$6(a1),a0
	move.l	a0,-(a7)
	move.l	a3,-(a7)
	jsr	$33A2(a5)	; -> sub_11F42C
	lea.l	$3352(a5),a0
	move.l	a0,$5C(a3)
	clr.w	$6C(a3)
	lea.l	$18(a7),a7
	clr.w	$6C(a4)
	lea.l	sub_0961F0(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
