; ---------------------------------------------------------------------------
; Nightcrawler_TeleportDown - teleport down through a thin floor: drop $28 px and one layer, then vanish
; In:  8(a6) = player
; Out: none
; Evidence: y += $2800, +$42 -= 1, state Nightcrawler_TeleportVanish
; ---------------------------------------------------------------------------
Nightcrawler_TeleportDown:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	addi.l	#$2800,$C(a4)
	subq.b	#$1,$42(a4)
	lea.l	Nightcrawler_TeleportVanish(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	Nightcrawler_TeleportVanish(pc)
	addq.w	#$4,a7
	movea.l	-$4(a6),a4
	unlk	a6
	rts
