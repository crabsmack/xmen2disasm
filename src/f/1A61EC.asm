; ---------------------------------------------------------------------------
; Nightcrawler_Jump - NIGHTCRAWLER slot +$82: XPLAYER jump with the record's jump velocity
; In:  8(a6) = player
; Out: none
; Evidence: parent +$82, vy = char +$10
; ---------------------------------------------------------------------------
Nightcrawler_Jump:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	lea.l	$2BA2(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$82(a0),a1
	jsr	(a1)
	movea.l	$8C(a4),a0
	move.w	$10(a0),$18(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
