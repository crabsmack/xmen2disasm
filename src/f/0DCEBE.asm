; ---------------------------------------------------------------------------
; sub_0DCEBE	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0DCEBE:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$3F52(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> sub_1F6296
	pea.l	($D4).w
	jsr	$5222(a5)	; -> sub_1FE5A2
	pea.l	($D4).w
	jsr	$521A(a5)	; -> sub_1FE584
	move.w	$98(a4),$16(a4)
	lea.l	$10(a7),a7
	clr.w	$6C(a4)
	lea.l	sub_0DCF0A(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
