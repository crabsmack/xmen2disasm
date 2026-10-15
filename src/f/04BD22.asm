; ---------------------------------------------------------------------------
; Apocalypse_ActNextScriptChoice - APOCALYPSE script action: cycle +$B1 through 0-3, then pick that script
; In:  8(a6) = this
; Out: d0 = +4 & 8
; Evidence: next Apocalypse_ActPickScript
; ---------------------------------------------------------------------------
Apocalypse_ActNextScriptChoice:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	addq.b	#$1,$B1(a4)
	moveq	#$0,d0
	move.b	$B1(a4),d0
	cmpi.b	#$3,d0
	bls.s	loc_04BD40
	clr.b	$B1(a4)
loc_04BD40:
	clr.w	$6C(a4)
	lea.l	Apocalypse_ActPickScript(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
