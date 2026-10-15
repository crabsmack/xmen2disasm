; ---------------------------------------------------------------------------
; Barbarian_StateLeap - BARBARIAN state: leap off (sound $AD)
; In:  8(a6) = this
; Out: d0
; Evidence: next Barbarian_StateLeapRise; TAS 28050
; Found: link-after-rts
; ---------------------------------------------------------------------------
Barbarian_StateLeap:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	pea.l	($AD).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($AD).w
	jsr	$521A(a5)	; -> Snd_Play
	moveq	#$0,d0
	move.l	d0,$44(a4)
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	Barbarian_StateLeapRise(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
