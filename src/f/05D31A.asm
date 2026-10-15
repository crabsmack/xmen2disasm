; ---------------------------------------------------------------------------
; Tuskette_StateHopIdle - TUSKETTE hopper: idle animation, then wait for a player
; In:  8(a6) = this
; Out: d0 = +4 & 8
; Evidence: next Tuskette_StateHopWait
; ---------------------------------------------------------------------------
Tuskette_StateHopIdle:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$C5A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	Tuskette_StateHopWait(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
