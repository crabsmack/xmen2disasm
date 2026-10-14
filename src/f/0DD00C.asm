; ---------------------------------------------------------------------------
; sub_0DD00C	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0DD00C:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	pea.l	-$1656(a5)
	move.l	$80(a4),-(a7)
	jsr	$406A(a5)	; -> sub_15DF66
	moveq	#$0,d0
	move.l	d0,$80(a4)
	clr.w	$6E(a4)
	move.w	#$1E,$9A(a4)
	pea.l	($D5).w
	jsr	$5222(a5)	; -> sub_1FE5A2
	pea.l	($D5).w
	jsr	$521A(a5)	; -> sub_1FE584
	lea.l	$10(a7),a7
	clr.w	$6C(a4)
	lea.l	sub_0DD060(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
