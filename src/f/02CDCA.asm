; ---------------------------------------------------------------------------
; Exodus_StateDescend - EXODUS: float down (vy $100, ay $14) to y $2A4 with its idle animation
; In:  8(a6) = this
; Out: d0 = +4 & 8
; Evidence: target y +$96 = $2A4; flags +$AC = 1; Obj_ChangeAnim jt $2DF2A; also re-entered by Exodus_StateRiseEnd; next Exodus_StateWaitLanded
; ---------------------------------------------------------------------------
Exodus_StateDescend:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	clr.b	$AC(a4)
	ori.b	#$1,$AC(a4)
	move.w	#$100,$18(a4)
	move.w	#$14,$20(a4)
	move.w	#$2A4,$96(a4)
	lea.l	$682(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	Exodus_StateWaitLanded(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
