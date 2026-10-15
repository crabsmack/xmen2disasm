; ---------------------------------------------------------------------------
; sub_0BDB94	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0BDB94:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.w	$6E(a4)
	bne.s	loc_0BDBB8
	clr.w	$6C(a4)
	lea.l	sub_0BDBE2(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_0BDBDA
loc_0BDBB8:
	lea.l	$209A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	sub_0BDB04(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0BDBDA:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
