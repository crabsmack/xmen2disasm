; ---------------------------------------------------------------------------
; DropRocket_StateLaunch - DROPROCKET first state: sound $E9, frame 0, start falling (gravity $300)
; In:  8(a6) = this
; Out: d0 = flags & 8
; Evidence: next DropRocket_StateDrop
; ---------------------------------------------------------------------------
DropRocket_StateLaunch:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	pea.l	($E9).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($E9).w
	jsr	$521A(a5)	; -> Snd_Play
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	moveq	#$5A,d0
	cmp.w	$8C(a4),d0
	lea.l	$10(a7),a7
	bge.s	loc_133BF4
	cmpi.w	#$10E,$8C(a4)
	bge.s	loc_133BF4
	ori.b	#$10,$2E(a4)
loc_133BF4:
	move.w	#$300,$18(a4)
	move.w	#$300,$20(a4)
	clr.w	$6C(a4)
	lea.l	DropRocket_StateDrop(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
