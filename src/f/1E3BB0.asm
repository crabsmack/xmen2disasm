; ---------------------------------------------------------------------------
; Cyclops_Draw - CYCLOPS slot +$1A: draw the optic beam, then the player (XPLAYER Draw), then hit-test the beam
; In:  8(a6) = player
; Out: none
; Evidence: Cyclops_DrawBeam(this, +$BC), parent +$1A, Cyclops_BeamHitEnemies while +$E0
; ---------------------------------------------------------------------------
Cyclops_Draw:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	pea.l	$BC(a4)
	move.l	a4,-(a7)
	jsr	$49D2(a5)	; -> Cyclops_DrawBeam
	move.l	a4,-(a7)
	lea.l	$2BCA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$1A(a0),a1
	jsr	(a1)
	tst.b	$E0(a4)
	lea.l	$C(a7),a7
	beq.s	loc_1E3BEA
	move.l	a4,-(a7)
	jsr	Cyclops_BeamHitEnemies(pc)
	addq.w	#$4,a7
loc_1E3BEA:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
