; ---------------------------------------------------------------------------
; Switch_ClassInit - create the BBOARD switch board g_BBoard (100 entries) if there is none yet, allocate a 16-byte work block into $FFC632 and clear byte $FFC636 (static, class slot 22, +$5E; does not call the parent)
; In:  8(a6) = 0  $C(a6) = class index in the level class list
; Out: none
; Evidence: BBOARD descriptor slot +$0A New(desc, 100); Mem_StackAlloc($10); method 22 of class descriptor $107A3E (name string "SWITCH", parent ACTOR)
; ---------------------------------------------------------------------------
Switch_ClassInit:
	link.w	a6,#$0
	tst.l	g_BBoard(a5)
	bne.s	loc_1077E4
	moveq	#$64,d0
	move.l	d0,-(a7)
	lea.l	$2EC2(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$2EC2(a5),a0
	movea.l	$2(a0),a0
	movea.l	$A(a0),a1
	jsr	(a1)
	move.l	d0,g_BBoard(a5)
	addq.w	#$8,a7
loc_1077E4:
	pea.l	Str_Empty_1077FE(pc)
	moveq	#$10,d0
	move.l	d0,-(a7)
	jsr	$5032(a5)	; -> Mem_StackAlloc
	move.l	d0,g_SwitchSearchRec(a5)
	clr.b	g_SwitchSearchBusy(a5)
	addq.w	#$8,a7
	unlk	a6
	rts
