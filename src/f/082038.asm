; ---------------------------------------------------------------------------
; CloneA2_CamAltTimerTask - task: when counter -$3AFA reaches 0, switch the camera back to CloneA2_CamHookNormal and end
; In:  8(a6) = task
; Out: none
; Evidence: calls CloneA2_CamHookNormal(g_Camera), camera slot +$3A, sets -$3892 := 1, sub_1F9D38(task) frees itself; started by CloneA2_StartCamAltMode
; ---------------------------------------------------------------------------
CloneA2_CamAltTimerTask:
	link.w	a6,#$0
	tst.w	-$3AFA(a5)
	bne.s	loc_082066
	move.l	g_Camera(a5),-(a7)
	jsr	CloneA2_CamHookNormal(pc)
	movea.l	g_Camera(a5),a0
	move.l	a0,-(a7)
	movea.l	(a0),a0
	movea.l	$3A(a0),a1
	jsr	(a1)
	move.b	#$1,-$3892(a5)
	move.l	$8(a6),-(a7)
	jsr	$4FEA(a5)	; -> Timer_Free
loc_082066:
	unlk	a6
	rts
