; ---------------------------------------------------------------------------
; sub_036AC6	[jt 245]
; ---------------------------------------------------------------------------
sub_036AC6:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	sub_03799C(pc),a0
	move.l	a0,$5C(a4)
	clr.w	$6C(a4)
	ori.w	#$4002,$6(a4)
	pea.l	-$1652(a5)
	move.l	$84(a4),-(a7)
	jsr	$406A(a5)	; -> List_Unlink
	moveq	#$0,d0
	move.l	d0,$84(a4)
	andi.w	#$FFBF,$6(a4)
	lea.l	$742(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	movea.l	-$4(a6),a4
	unlk	a6
	rts
