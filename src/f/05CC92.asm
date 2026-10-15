; ---------------------------------------------------------------------------
; sub_05CC92	[link-after-rts]
; ---------------------------------------------------------------------------
sub_05CC92:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	pea.l	-$1652(a5)
	move.l	$84(a4),-(a7)
	jsr	$406A(a5)	; -> List_Unlink
	moveq	#$0,d0
	move.l	d0,$84(a4)
	clr.b	$9A(a4)
	pea.l	($E5).w
	jsr	$5222(a5)	; -> sub_1FE5A2
	pea.l	($E5).w
	jsr	$521A(a5)	; -> sub_1FE584
	lea.l	sub_05C92A(pc),a0
	move.l	a0,$5C(a4)
	move.w	#$32,$6C(a4)
	moveq	#$0,d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
