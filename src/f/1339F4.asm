; ---------------------------------------------------------------------------
; sub_1339F4	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1339F4:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	pea.l	($E9).w
	jsr	$5222(a5)	; -> sub_1FE5A2
	pea.l	($E9).w
	jsr	$521A(a5)	; -> sub_1FE584
	moveq	#$5A,d0
	cmp.w	$8C(a4),d0
	addq.w	#$8,a7
	bge.s	loc_133A26
	cmpi.w	#$10E,$8C(a4)
	bge.s	loc_133A26
	ori.b	#$10,$2E(a4)
loc_133A26:
	clr.w	$6C(a4)
	lea.l	sub_133A40(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
