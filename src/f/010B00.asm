; ---------------------------------------------------------------------------
; BigAcolyte_DieEndScene - BIGACOLYTE death: end the scene after 200 frames and spawn its death effect
; In:  8(a6) = this
; Out: none
; Evidence: g_SceneExitTimer = 200; sub_13EEFA(this, jt $3D42, 0, 0, height); called from BigAcolyte_TakeDamage and BigAcolyte_OutsideActiveWindow (same body as BigAcolyte_OnDeath)
; ---------------------------------------------------------------------------
BigAcolyte_DieEndScene:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$C8,g_SceneExitTimer(a5)
	move.w	$4C(a4),d0
	ext.l	d0
	move.l	$C(a4),d1
	asr.l	#$8,d1
	sub.l	d1,d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	lea.l	$3B42(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$3AF2(a5)	; -> sub_13EEFA
	movea.l	-$4(a6),a4
	unlk	a6
	rts
