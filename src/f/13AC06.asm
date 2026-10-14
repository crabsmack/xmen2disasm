; ---------------------------------------------------------------------------
; sub_13AC06	[link-after-rts]
; ---------------------------------------------------------------------------
sub_13AC06:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	$4EB2(a5)	; -> sub_1F6A32
	move.l	d0,$20(a4)
	movea.l	d0,a3
	move.l	a3,d0
	addq.w	#$4,a7
	beq.s	loc_13AC36
	move.w	#$3C,$1E(a4)
	lea.l	sub_13AC40(pc),a0
	move.l	a0,$18(a4)
	clr.w	$1C(a4)
loc_13AC36:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
