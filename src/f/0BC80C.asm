; ---------------------------------------------------------------------------
; SavageBioBalls_ActMotion - BIOBALLS companion action: motion BioBalls_MotionRing ($600) for $96 frames
; In:  8(a6) = the BIOBALLS object
; Out: d0
; Evidence: BioBalls_FillFromFirst; +$A0 = -$20; flag +$98 |= $100; next SavageBioBalls_StateWait; TAS 33962
; Found: jt 1018
; ---------------------------------------------------------------------------
SavageBioBalls_ActMotion:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	$33AA(a5)	; -> BioBalls_FillFromFirst
	move.w	#$FFE0,$A0(a4)
	lea.l	$33CA(a5),a0
	move.l	a0,$A2(a4)
	clr.w	$A6(a4)
	move.w	#$600,$A8(a4)
	ori.w	#$100,$98(a4)
	move.w	#$96,$6E(a4)
	addq.w	#$4,a7
	clr.w	$6C(a4)
	lea.l	SavageBioBalls_StateWait(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
