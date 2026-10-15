; ---------------------------------------------------------------------------
; YoyoAcolyte_ActIdle100 - YOYOACOLYTE script action: idle animation (jt $1CA34) for 100 frames, then restart the script
; In:  8(a6) = this
; Out: d0 = +4 & 8
; Evidence: Obj_ChangeAnim; +$6E = 100; next YoyoAcolyte_StateIdleRestart
; ---------------------------------------------------------------------------
YoyoAcolyte_ActIdle100:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$482(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	move.w	#$64,$6E(a4)
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	YoyoAcolyte_StateIdleRestart(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
