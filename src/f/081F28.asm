; ---------------------------------------------------------------------------
; CloneA2_InitCamera - create the CloneA2 camera (CAMERA +$0A New with CloneA2_CamHookNormal) unless g_Camera exists
; In:  none
; Out: none
; Evidence: class descriptor jt[2483] = CAMERA ($1F4960); result stored in g_Camera; TAS frame 47901
; ---------------------------------------------------------------------------
CloneA2_InitCamera:
	link.w	a6,#$0
	jsr	CloneA2_EmptyStub2(pc)
	tst.l	g_Camera(a5)
	bne.s	loc_081F56
	pea.l	CloneA2_CamHookNormal(pc)
	lea.l	$4DBA(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$4DBA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$A(a0),a1
	jsr	(a1)
	move.l	d0,g_Camera(a5)
	addq.w	#$8,a7
loc_081F56:
	unlk	a6
	rts
