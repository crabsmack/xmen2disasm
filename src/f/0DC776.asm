; ---------------------------------------------------------------------------
; Barrier_Despawn - own despawn (no parent call): clear +4, swap the record's class to CLOSEDBARRIER (jt $2462) when closed (+$96), record state 5 at its current position, no object ($FF), free its timer (BARRIER override of slot +$36 Despawn)
; In:  8(a6) = this, $C(a6) = spawn record
; Out: none
; Evidence: slot +$36 of the BARRIER descriptor $0DCAAA; never runs in the corpus
; ---------------------------------------------------------------------------
Barrier_Despawn:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$C(a6),a3
	movea.l	$8(a6),a4
	clr.w	$4(a4)
	tst.b	$96(a4)
	beq.s	loc_0DC798
	lea.l	$2462(a5),a0
	move.l	$2(a0),(a3)
loc_0DC798:
	move.b	#$5,$4(a3)
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.w	d0,$6(a3)
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.w	d0,$8(a3)
	move.b	#$FF,$5(a3)
	move.l	$7C(a4),-(a7)
	jsr	$4FEA(a5)	; -> Timer_Free
	moveq	#$0,d0
	move.l	d0,$7C(a4)
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
