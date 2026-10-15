; ---------------------------------------------------------------------------
; Synchronizer_Destroy - Synchronizer: ClearFlag, Free the pool slot, release the handle
; In:  8(a6) = this
; Out: none
; Evidence: method 6 of SYNCHRONIZER; vtable +$1A and +$22; called at the end of Synchronizer_DespawnMembers
; ---------------------------------------------------------------------------
Synchronizer_Destroy:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$1A(a0),a1
	jsr	(a1)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$22(a0),a1
	jsr	(a1)
	move.l	g_TimerCurrent(a5),-(a7)
	jsr	$4FEA(a5)	; -> Timer_Free
	movea.l	-$4(a6),a4
	unlk	a6
	rts
