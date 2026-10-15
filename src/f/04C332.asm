; ---------------------------------------------------------------------------
; Apocalypse_StateVanish - APOCALYPSE defeated: hide, kill itself and spawn the object at (-10, -40) that ends the fight
; In:  8(a6) = this
; Out: none
; Evidence: slot $56 SetFrame($FF), slot $52 Kill, sub_04EAC8($F600, -$2800) (BEAMSCOOTER code)
; ---------------------------------------------------------------------------
Apocalypse_StateVanish:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	pea.l	($FF).w
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	move.l	#$FFFFD800,-(a7)
	move.l	#$F600,-(a7)
	jsr	$BEA(a5)	; -> sub_04EAC8
	movea.l	-$4(a6),a4
	unlk	a6
	rts
