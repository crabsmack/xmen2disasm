; ---------------------------------------------------------------------------
; sub_098236	[jt 772]
; ---------------------------------------------------------------------------
sub_098236:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.l	$24(a4)
	beq.s	loc_09825E
	move.l	$24(a4),-(a7)
	jsr	$4FE2(a5)	; -> Timer_Stop
	move.l	$24(a4),-(a7)
	jsr	$4FEA(a5)	; -> Timer_Free
	moveq	#$0,d0
	move.l	d0,$24(a4)
	addq.w	#$8,a7
loc_09825E:
	moveq	#-$1,d0
	cmp.w	$28(a4),d0
	bge.s	loc_09827A
	move.w	$28(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	$4F72(a5)	; -> DrawList_Remove
	move.w	#$FFFF,$28(a4)
	addq.w	#$4,a7
loc_09827A:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
