; ---------------------------------------------------------------------------
; CloneA2_StartCamAltMode - put the CloneA2 camera in its alternate mode for $300 frames
; In:  none
; Out: none
; Evidence: creates the CloneA2_CamAltTimer timer (period 1), -$3AFA := $300, calls CloneA2_CamHookAlt(g_Camera); jt 554; called from CloneA2_StartCamera
; ---------------------------------------------------------------------------
CloneA2_StartCamAltMode:
	link.w	a6,#$0
	move.l	a4,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	moveq	#$1,d1
	move.l	d1,-(a7)
	pea.l	CloneA2_CamAltTimer(pc)
	jsr	$4FD2(a5)	; -> Timer_Create
	movea.l	d0,a4
	move.w	#$300,g_FloatFallSpeed(a5)
	move.l	a4,d0
	lea.l	$10(a7),a7
	beq.s	loc_0820A6
	move.l	a4,$10(a4)
	move.l	a4,-(a7)
	jsr	$4FDA(a5)	; -> Timer_Start
	move.l	g_Camera(a5),-(a7)
	jsr	CloneA2_CamHookAlt(pc)
	addq.w	#$8,a7
loc_0820A6:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
