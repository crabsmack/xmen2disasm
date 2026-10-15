; ---------------------------------------------------------------------------
; Exodus_AtkBlast2 - EXODUS attack: one blast of kind 2 (down-left), sound $E0
; In:  8(a6) = this
; Out: d0 = +4 & 8
; Evidence: animation jt $892; ExodusBlast_Spawn(.., 2); next Exodus_StateVulnerable
; ---------------------------------------------------------------------------
Exodus_AtkBlast2:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$692(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	moveq	#$2,d0
	move.l	d0,-(a7)
	move.l	$C(a4),d1
	sub.l	#$4600,d1
	move.l	d1,-(a7)
	move.l	$8(a4),-(a7)
	jsr	$6E2(a5)	; -> ExodusBlast_Spawn
	pea.l	($E0).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($E0).w
	jsr	$521A(a5)	; -> Snd_Play
	lea.l	$1C(a7),a7
	clr.w	$6C(a4)
	lea.l	Exodus_StateVulnerable(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
