; ---------------------------------------------------------------------------
; Player2_StartLife - give player 2 a new life: keep or randomly pick a character (not P1's), health $700, spend a life
; In:  none
; Out: d0 = 1 if started, 0 if -$3BBA is clear
; Evidence: jt 6, mirror of Player1_StartLife using g_Player2, g_P2Health, g_P2CharIndex, g_P2Lives; caller sub_15CAA4
; ---------------------------------------------------------------------------
Player2_StartLife:
	link.w	a6,#$0
	movem.l	d6-d7,-(a7)
	move.l	g_Player1(a5),-(a7)
	jsr	Player_CharIndexOf(pc)
	move.w	d0,d6
	move.l	g_Player2(a5),-(a7)
	jsr	Player_CharIndexOf(pc)
	move.w	d0,d7
	tst.b	-$3BBA(a5)
	addq.w	#$8,a7
	bne.s	loc_00630C
	moveq	#$0,d0
	bra.s	loc_00637C
loc_00630C:
	cmpi.w	#$FFFF,d7
	bne.s	loc_00632A
loc_006312:
	jsr	$417A(a5)	; -> Rand_Next
	moveq	#$0,d1
	move.w	d0,d1
	move.l	d1,d0
	moveq	#$6,d1
	jsr	$3FAA(a5)	; -> Math_LModS
	ext.w	d0
	move.w	d0,d7
	cmp.w	d6,d7
	beq.s	loc_006312
loc_00632A:
	move.w	#$700,g_P2Health(a5)
	move.w	d7,d0
	bmi.s	Player2_StartLife_Wolverine
	cmpi.w	#$5,d0
	bgt.s	Player2_StartLife_Wolverine
	add.w	d0,d0
	move.w	Sw_0062E4(pc,d0.w),d0
	jmp	Sw_0062E4-2(pc,d0.w)
