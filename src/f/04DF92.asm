; ---------------------------------------------------------------------------
; ApocBomb_StartAccelTimer - create and start the bomb-speed timer, speed and increase 0
; In:  none
; Out: none
; Evidence: Timer_Create(ApocBomb_AccelTimer, 1, 0, 0) -> -$3B20; Timer_Start
; ---------------------------------------------------------------------------
ApocBomb_StartAccelTimer:
	link.w	a6,#$0
	move.l	a4,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	moveq	#$1,d1
	move.l	d1,-(a7)
	pea.l	ApocBomb_AccelTimer(pc)
	jsr	$4FD2(a5)	; -> Timer_Create
	movea.l	d0,a4
	move.l	a4,d0
	lea.l	$10(a7),a7
	beq.s	loc_04DFCE
	move.l	a4,$10(a4)
	move.l	a4,-(a7)
	jsr	$4FDA(a5)	; -> Timer_Start
	move.l	a4,-$3B20(a5)
	clr.w	g_ApocBombSpeed(a5)
	clr.w	g_ApocBombAccel(a5)
	addq.w	#$4,a7
	bra.s	loc_04DFD4
loc_04DFCE:
	moveq	#$0,d0
	move.l	d0,-$3B20(a5)
loc_04DFD4:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
