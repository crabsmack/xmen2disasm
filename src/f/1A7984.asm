; ---------------------------------------------------------------------------
; Nightcrawler_AirSpecial - NIGHTCRAWLER slot +$C6: air special = teleport
; In:  8(a6) = player
; Out: none
; Evidence: +$5C = Nightcrawler_StartTeleport and calls it
; ---------------------------------------------------------------------------
Nightcrawler_AirSpecial:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	Nightcrawler_StartTeleport(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	Nightcrawler_StartTeleport(pc)
	addq.w	#$4,a7
	movea.l	-$4(a6),a4
	unlk	a6
	rts
