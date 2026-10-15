; ---------------------------------------------------------------------------
; MagnetoBoss_EnterSpinState - MAGNETOBOSS: stop being hittable and start the looping spin animation (jt $942)
; In:  8(a6) = this
; Out: none
; Evidence: jt 245, caller sub_037F26 (THRONEPHONE code); +6 |= $4002; List_Unlink(+$84, $FFEBAE); state MagnetoBoss_StateSpin
; ---------------------------------------------------------------------------
MagnetoBoss_EnterSpinState:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	MagnetoBoss_StateSpin(pc),a0
	move.l	a0,$5C(a4)
	clr.w	$6C(a4)
	ori.w	#$4002,$6(a4)
	pea.l	g_HitListEnemyBody(a5)
	move.l	$84(a4),-(a7)
	jsr	$406A(a5)	; -> List_Unlink
	moveq	#$0,d0
	move.l	d0,$84(a4)
	andi.w	#$FFBF,$6(a4)
	lea.l	$742(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	movea.l	-$4(a6),a4
	unlk	a6
	rts
