; ---------------------------------------------------------------------------
; sub_15DAD8	[link-after-rts]
; ---------------------------------------------------------------------------
sub_15DAD8:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.w	$68(a4)
	bgt.s	loc_15DB18
	clr.w	$68(a4)
	move.l	a4,-(a7)
	jsr	$4E7A(a5)	; -> Obj_Detach
	clr.w	$1E(a4)
	move.w	#$64,$20(a4)
	ori.w	#$80,$6(a4)
	addq.w	#$4,a7
	clr.w	$6C(a4)
	lea.l	sub_15DA90(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_15DB1E
loc_15DB18:
	move.l	$64(a4),$5C(a4)
loc_15DB1E:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
