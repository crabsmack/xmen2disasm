; ---------------------------------------------------------------------------
; TankLeft_StateDriveIn - drive in until the tank reaches mid-screen, then switch to its leaving script (Tbl_Tank_ScriptDrive, jt $3C82)
; In:  8(a6) = this
; Out: d0
; Evidence: after +$6E: x < g_CameraX + $A0 -> drive animation, vx = +/-$9E, AiScript_Set(+$94, Tbl_Tank_ScriptDrive (jt $3C82)); else next thunk
; ---------------------------------------------------------------------------
TankLeft_StateDriveIn:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.w	$6E(a4)
	bgt.w	loc_141FEE
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.w	g_CameraX(a5),d1
	ext.l	d1
	add.l	#$A0,d1
	cmp.l	d0,d1
	ble.s	loc_141FAE
	lea.l	$3C62(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_141F60
	move.w	$9E(a4),d0
	ext.l	d0
	neg.l	d0
	bra.s	loc_141F66
loc_141F60:
	move.w	$9E(a4),d0
	ext.l	d0
loc_141F66:
	move.w	d0,$16(a4)
	lea.l	$3C82(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$94(a4)
	jsr	$3ED2(a5)	; -> AiScript_Set
	tst.l	$96(a4)
	lea.l	$10(a7),a7
	bne.s	loc_141F90
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_142000
loc_141F90:
	clr.w	$94(a4)
	movea.l	$96(a4),a0
	addq.l	#$2,a0
	move.w	$94(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_142000
loc_141FAE:
	tst.l	$96(a4)
	bne.s	loc_141FC0
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_142000
loc_141FC0:
	addq.w	#$1,$94(a4)
	movea.l	$96(a4),a0
	move.w	$94(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_141FD4
	clr.w	$94(a4)
loc_141FD4:
	movea.l	$96(a4),a0
	addq.l	#$2,a0
	move.w	$94(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_142000
loc_141FEE:
	clr.w	$6C(a4)
	lea.l	TankLeft_StateDriveIn(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_142000:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
