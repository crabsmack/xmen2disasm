; ---------------------------------------------------------------------------
; sub_122398	[jt 1696]
; ---------------------------------------------------------------------------
sub_122398:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$348A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	move.w	#$3,$B4(a4)
	addq.w	#$8,a7
	move.w	#$FF,$6C(a4)
	lea.l	sub_122362(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
