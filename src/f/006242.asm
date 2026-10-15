; ---------------------------------------------------------------------------
; Player1_StartLife - give player 1 a new life: keep or randomly pick a character (not P2's), health $700, spend a life
; In:  none
; Out: d0 = 1 if started, 0 if -$3BBA is clear
; Evidence: jt 5, called from Siberia init SiberiaB1_InstallHooks and sub_15CAA4; random = sub_1600AA % 6 (Math_LModS); switch on index to Player1_Set*; stores g_P1CharIndex, decrements g_P1Lives (TAS RAM 9 -> 8 at frame 180)
; ---------------------------------------------------------------------------
Player1_StartLife:
	link.w	a6,#$0
	movem.l	d6-d7,-(a7)
	move.l	g_Player1(a5),-(a7)
	jsr	Player_CharIndexOf(pc)
	move.w	d0,d7
	move.l	g_Player2(a5),-(a7)
	jsr	Player_CharIndexOf(pc)
	move.w	d0,d6
	tst.b	-$3BBA(a5)
	addq.w	#$8,a7
	bne.s	loc_00626A
	moveq	#$0,d0
	bra.s	loc_0062DA
loc_00626A:
	cmpi.w	#$FFFF,d7
	bne.s	loc_006288
loc_006270:
	jsr	$417A(a5)	; -> sub_1600AA
	moveq	#$0,d1
	move.w	d0,d1
	move.l	d1,d0
	moveq	#$6,d1
	jsr	$3FAA(a5)	; -> Math_LModS
	ext.w	d0
	move.w	d0,d7
	cmp.w	d7,d6
	beq.s	loc_006270
loc_006288:
	move.w	#$700,g_P1Health(a5)
	move.w	d7,d0
	bmi.s	Player1_StartLife_Wolverine
	cmpi.w	#$5,d0
	bgt.s	Player1_StartLife_Wolverine
	add.w	d0,d0
	move.w	Sw_006242(pc,d0.w),d0
	jmp	Sw_006242-2(pc,d0.w)
