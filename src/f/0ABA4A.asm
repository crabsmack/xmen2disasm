; ---------------------------------------------------------------------------
; sub_0ABA4A	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0ABA4A:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$F,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	pea.l	($BA).w
	jsr	$5222(a5)	; -> sub_1FE5A2
	pea.l	($BA).w
	jsr	$521A(a5)	; -> sub_1FE584
	lea.l	$10(a7),a7
	move.w	#$6,$6C(a4)
	lea.l	sub_0ABA92(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
