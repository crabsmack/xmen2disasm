; ---------------------------------------------------------------------------
; sub_084C62	[jt 593]
; ---------------------------------------------------------------------------
sub_084C62:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	$4EAA(a5)	; -> sub_1F694A
	movea.l	d0,a3
	move.l	$8(a3),d0
	cmp.l	$8(a4),d0
	addq.w	#$4,a7
	bge.s	loc_084C8A
	ori.b	#$10,$2E(a4)
	bra.s	loc_084C90
loc_084C8A:
	andi.b	#$EF,$2E(a4)
loc_084C90:
	clr.w	$1E(a4)
	clr.w	$16(a4)
	lea.l	$11F2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> sub_1F6296
	addq.w	#$8,a7
	move.w	#$FF,$6C(a4)
	lea.l	sub_084CC6(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
