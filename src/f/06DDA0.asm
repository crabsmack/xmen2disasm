; ---------------------------------------------------------------------------
; sub_06DDA0	[link-after-rts]
; ---------------------------------------------------------------------------
sub_06DDA0:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$FEA(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	move.w	#$4,$B4(a4)
	move.w	#$14,$6E(a4)
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	sub_06DDE0(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
