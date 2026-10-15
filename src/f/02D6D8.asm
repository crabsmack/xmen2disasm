; ---------------------------------------------------------------------------
; Exodus_StateEndVulnerable - EXODUS: idle animation and sound $DF, then wait for its blasts
; In:  8(a6) = this
; Out: d0 = +4 & 8
; Evidence: Obj_ChangeAnim jt $2DF2A; +$6C = $1E; next Exodus_StateWaitBlastsGone
; ---------------------------------------------------------------------------
Exodus_StateEndVulnerable:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$682(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	pea.l	($DF).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($DF).w
	jsr	$521A(a5)	; -> Snd_Play
	lea.l	$10(a7),a7
	move.w	#$1E,$6C(a4)
	lea.l	Exodus_StateWaitBlastsGone(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
