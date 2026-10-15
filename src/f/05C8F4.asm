; ---------------------------------------------------------------------------
; Tusk_AtkCharge - TUSK attack step: become hittable (+$9A = 19) and charge after 21 frames
; In:  8(a6) = this
; Out: d0 = 0
; Evidence: next Tusk_StateChargeStart
; ---------------------------------------------------------------------------
Tusk_AtkCharge:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	pea.l	g_HitListEnemyBody(a5)
	move.l	a4,-(a7)
	jsr	$4062(a5)	; -> HitList_Add
	move.l	d0,$84(a4)
	move.b	#$13,$9A(a4)
	lea.l	Tusk_StateChargeStart(pc),a0
	move.l	a0,$5C(a4)
	move.w	#$15,$6C(a4)
	moveq	#$0,d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
