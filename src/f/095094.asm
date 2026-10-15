; ---------------------------------------------------------------------------
; EvilDrop_ActOpen - EVILDROP script action: play the opening animation (+$AC, default jt[$183A]) and hand over to the BIOBALLS state BioBalls_WaitPathDone
; In:  8(a6) = this
; Out: none
; Evidence: BioBalls_SetPathCollapsed(this, anim); +$5C = BioBalls_WaitPathDone; jt 704
; Found: jt 704
; ---------------------------------------------------------------------------
EvilDrop_ActOpen:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.l	$AC(a4)
	beq.s	loc_0950B2
	move.l	$AC(a4),-(a7)
	move.l	a4,-(a7)
	jsr	$33A2(a5)	; -> BioBalls_SetPathCollapsed
	addq.w	#$8,a7
	bra.s	loc_0950C2
loc_0950B2:
	lea.l	$163A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$33A2(a5)	; -> BioBalls_SetPathCollapsed
	addq.w	#$8,a7
loc_0950C2:
	lea.l	$3352(a5),a0
	move.l	a0,$5C(a4)
	clr.w	$6C(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
