; ---------------------------------------------------------------------------
; Nightcrawler_DropThrough - NIGHTCRAWLER slot +$86: XPLAYER drop-through, then fall at $14A
; In:  8(a6) = player
; Out: none
; Evidence: parent +$86, vy = $14A
; ---------------------------------------------------------------------------
Nightcrawler_DropThrough:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	lea.l	$2BA2(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$86(a0),a1
	jsr	(a1)
	move.w	#$14A,$18(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
