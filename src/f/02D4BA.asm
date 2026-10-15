; ---------------------------------------------------------------------------
; Exodus_StateSwoopBlast - EXODUS: fire the swoop blast (kind +$A5), sound $E0, then rise after 30 frames
; In:  8(a6) = this
; Out: d0 = +4 & 8
; Evidence: Obj_ChangeAnim jt $2DF88; ExodusBlast_Spawn; next Exodus_StateRiseStart
; ---------------------------------------------------------------------------
Exodus_StateSwoopBlast:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$6AA(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	moveq	#$0,d0
	move.b	$A5(a4),d0
	move.l	d0,-(a7)
	move.l	$C(a4),d0
	sub.l	#$4600,d0
	move.l	d0,-(a7)
	move.l	$8(a4),-(a7)
	jsr	$6E2(a5)	; -> ExodusBlast_Spawn
	pea.l	($E0).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($E0).w
	jsr	$521A(a5)	; -> Snd_Play
	clr.b	$AC(a4)
	lea.l	$1C(a7),a7
	move.w	#$1E,$6C(a4)
	lea.l	Exodus_StateRiseStart(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
