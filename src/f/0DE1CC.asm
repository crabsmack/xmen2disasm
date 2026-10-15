; ---------------------------------------------------------------------------
; ControlPanel_FireBlast - CONTROLPANEL slot +$76: fire a BLAST at (x, y) with its blast parameters
; In:  8(a6) = this, $C(a6) = long x, $10(a6) = long y
; Out: none
; Evidence: Blast_Spawn
; Found: jt 1195
; ---------------------------------------------------------------------------
ControlPanel_FireBlast:
	link.w	a6,#$FFF0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a3
	lea.l	-$10(a6),a4
	move.l	$C(a6),d0
	asr.l	#$8,d0
	move.w	d0,$2(a4)
	move.l	$10(a6),d0
	asr.l	#$8,d0
	move.w	d0,$4(a4)
	move.w	$98(a3),$6(a4)
	move.w	$A0(a3),$8(a4)
	moveq	#$0,d0
	move.b	$A2(a3),d0
	move.w	d0,$A(a4)
	clr.l	$C(a4)
	move.l	a4,-(a7)
	jsr	$247A(a5)	; -> Blast_Spawn
	movem.l	-$18(a6),a3-a4
	unlk	a6
	rts
