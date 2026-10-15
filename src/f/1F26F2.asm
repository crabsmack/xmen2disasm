; ---------------------------------------------------------------------------
; sub_1F26F2	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1F26F2:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	-$3AFA(a5),$24(a4)
	movea.l	$8C(a4),a0
	movea.l	a0,a1
	adda.w	$5A(a1),a0
	move.l	a0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	lea.l	sub_1F2572(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	sub_1F2572(pc)
	lea.l	$C(a7),a7
	movea.l	-$4(a6),a4
	unlk	a6
	rts
