; ---------------------------------------------------------------------------
; sub_13D8F6
; ---------------------------------------------------------------------------
sub_13D8F6:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.l	$8(a4)
	beq.s	loc_13D910
	move.l	$8(a4),-(a7)
	jsr	$4FE2(a5)	; -> Timer_Stop
	addq.w	#$4,a7
loc_13D910:
	tst.l	$8(a4)
	beq.s	loc_13D926
	move.l	$8(a4),-(a7)
	jsr	$4FEA(a5)	; -> Timer_Free
	moveq	#$0,d0
	move.l	d0,$8(a4)
	addq.w	#$4,a7
loc_13D926:
	moveq	#-$1,d0
	cmp.w	$6(a4),d0
	bge.s	loc_13D942
	move.w	$6(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	$4F72(a5)	; -> DrawList_Remove
	move.w	#$FFFF,$6(a4)
	addq.w	#$4,a7
loc_13D942:
	clr.w	$4(a4)
	move.b	$C(a4),$15(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
