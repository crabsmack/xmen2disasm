; ---------------------------------------------------------------------------
; Apocalypse_StateResumeScript - APOCALYPSE: continue its AI script at the current entry
; In:  8(a6) = this
; Out: none
; Evidence: +$5C = script +$A4 entry +$A2
; ---------------------------------------------------------------------------
Apocalypse_StateResumeScript:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$A4(a4),a0
	addq.l	#$2,a0
	move.w	$A2(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
