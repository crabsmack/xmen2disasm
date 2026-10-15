; ---------------------------------------------------------------------------
; CloneA2_StartBgPalTimer - start CloneA2_BgPalTimer as a 1-frame timer
; In:  none
; Out: none
; Evidence: Timer_Create(CloneA2_BgPalTimer, period 1, 0, 0), stores the timer as its own argument (+$10), Timer_Start, -$3B02 := 0; TAS frame 47901
; ---------------------------------------------------------------------------
CloneA2_StartBgPalTimer:
	link.w	a6,#$0
	move.l	a4,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	moveq	#$1,d1
	move.l	d1,-(a7)
	pea.l	CloneA2_BgPalTimer(pc)
	jsr	$4FD2(a5)	; -> Timer_Create
	movea.l	d0,a4
	move.l	a4,d0
	lea.l	$10(a7),a7
	beq.s	loc_082030
	move.l	a4,$10(a4)
	move.l	a4,-(a7)
	jsr	$4FDA(a5)	; -> Timer_Start
	clr.w	-$3B02(a5)
	addq.w	#$4,a7
loc_082030:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
