; ---------------------------------------------------------------------------
; Apocalypse_ActRotateTo0 - APOCALYPSE script action: set angle 4 and turn until it reaches 0
; In:  8(a6) = this
; Out: d0 = +4 & 8
; Evidence: next Apocalypse_StateRotateTo0
; ---------------------------------------------------------------------------
Apocalypse_ActRotateTo0:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$4,$8E(a4)
	clr.w	$6C(a4)
	lea.l	Apocalypse_StateRotateTo0(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
