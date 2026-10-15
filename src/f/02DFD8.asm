; ---------------------------------------------------------------------------
; ExodusBlast_StateLaunch - EXODUSBLAST: show the blast animation and pick the direction state from its kind (+$98: 1 right, 2/3 down-left/right, 4 down, 5/6 drop, 7 left)
; In:  8(a6) = this
; Out: d0
; Evidence: Obj_ChangeAnim jt $2E5F4; +6 &= ~$4000; switch on kind - 1
; ---------------------------------------------------------------------------
ExodusBlast_StateLaunch:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$6F2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	andi.w	#$BFFF,$6(a4)
	move.b	$98(a4),d0
	subq.b	#$1,d0
	addq.w	#$8,a7
	bcs.w	ExodusBlast_StateLaunch_part4
	cmpi.b	#$6,d0
	bhi.w	ExodusBlast_StateLaunch_part4
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	Sw_02DFD8(pc,d1.w),d1
	jmp	Sw_02DFD8-2(pc,d1.w)
