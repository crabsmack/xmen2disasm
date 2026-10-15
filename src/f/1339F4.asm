; ---------------------------------------------------------------------------
; BrainRocket_StateLaunch - BRAINROCKET first state: launch sound $E9, face left for angles 90-270
; In:  8(a6) = this
; Out: d0 = flags & 8
; Evidence: next BrainRocket_StateSetDirection
; ---------------------------------------------------------------------------
BrainRocket_StateLaunch:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	pea.l	($E9).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($E9).w
	jsr	$521A(a5)	; -> Snd_Play
	moveq	#$5A,d0
	cmp.w	$8C(a4),d0
	addq.w	#$8,a7
	bge.s	loc_133A26
	cmpi.w	#$10E,$8C(a4)
	bge.s	loc_133A26
	ori.b	#$10,$2E(a4)
loc_133A26:
	clr.w	$6C(a4)
	lea.l	BrainRocket_StateSetDirection(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
