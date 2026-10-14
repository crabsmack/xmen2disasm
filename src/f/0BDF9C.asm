; ---------------------------------------------------------------------------
; sub_0BDF9C	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0BDF9C:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	pea.l	($AD).w
	jsr	$5222(a5)	; -> sub_1FE5A2
	pea.l	($AD).w
	jsr	$521A(a5)	; -> sub_1FE584
	moveq	#$0,d0
	move.l	d0,$44(a4)
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	sub_0BDFD8(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
