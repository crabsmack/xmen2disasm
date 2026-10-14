; ---------------------------------------------------------------------------
; sub_0EA02E	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0EA02E:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$96(a4),-(a7)
	jsr	$28C2(a5)	; -> sub_0EC740
	tst.b	d0
	addq.w	#$4,a7
	bne.s	loc_0EA066
	move.l	$96(a4),-(a7)
	jsr	$28CA(a5)	; -> sub_0EC7B0
	addq.w	#$4,a7
	clr.w	$6C(a4)
	lea.l	sub_0E9FF2(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_0EA08E
loc_0EA066:
	movea.l	$96(a4),a0
	move.l	$C(a0),d7
	cmpi.l	#$6400,d7
	bge.s	loc_0EA08E
	move.w	#$1,-$359A(a5)
	clr.w	$6C(a4)
	lea.l	sub_0EA098(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0EA08E:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
