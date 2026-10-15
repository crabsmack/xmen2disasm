; ---------------------------------------------------------------------------
; YoyoAcolyte_ActIdle - YOYOACOLYTE script action: idle facing the target for +$B6 frames (spawn parameter, default $50)
; In:  8(a6) = this
; Out: d0 = +4 & 8
; Evidence: +$6E = +$B6; next YoyoAcolyte_StateIdleNext
; ---------------------------------------------------------------------------
YoyoAcolyte_ActIdle:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$B6(a4),$6E(a4)
	clr.w	$6C(a4)
	lea.l	YoyoAcolyte_StateIdleNext(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
