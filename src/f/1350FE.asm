; ---------------------------------------------------------------------------
; FlyBrood_StateFacePlayer - FLYBROOD: keep facing the nearest player
; In:  8(a6) = this
; Out: none
; Evidence: state set by FlyBrood_ActHoverForever
; ---------------------------------------------------------------------------
FlyBrood_StateFacePlayer:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	$4EAA(a5)	; -> Player_Nearest
	movea.l	d0,a3
	move.l	$8(a3),d0
	cmp.l	$8(a4),d0
	bge.s	loc_135124
	ori.b	#$10,$2E(a4)
	bra.s	loc_13512A
loc_135124:
	andi.b	#$EF,$2E(a4)
loc_13512A:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
