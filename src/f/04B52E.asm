; ---------------------------------------------------------------------------
; Apocalypse_StateEntrance - APOCALYPSE script action: enter from the top-left (sound $79) and move to (256, 96)
; In:  8(a6) = this
; Out: d0 = +4 & 8
; Evidence: start (-10, -20) px, frame $82; Apocalypse_MoveTo($10000, $6000, 5); next Apocalypse_StateWaitEntrance
; ---------------------------------------------------------------------------
Apocalypse_StateEntrance:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	#$F600,$8(a4)
	move.l	#$FFFFEC00,$C(a4)
	ori.b	#$10,$2E(a4)
	pea.l	($82).w
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	moveq	#$79,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$79,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	moveq	#$5,d0
	move.l	d0,-(a7)
	pea.l	($6000).w
	move.l	#$10000,-(a7)
	move.l	a4,-(a7)
	jsr	Apocalypse_MoveTo(pc)
	lea.l	$20(a7),a7
	clr.w	$6C(a4)
	lea.l	Apocalypse_StateWaitEntrance(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
