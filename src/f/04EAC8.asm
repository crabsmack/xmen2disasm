; ---------------------------------------------------------------------------
; BeamScooter_Spawn - create the BEAMSCOOTER at (x, y)
; In:  8(a6) = long x, $C(a6) = long y
; Out: none
; Evidence: Tbl_BeamScooter_vtable +$0E New; caller Apocalypse_StateVanish
; ---------------------------------------------------------------------------
BeamScooter_Spawn:
	link.w	a6,#$0
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	$C(a6),-(a7)
	move.l	$8(a6),-(a7)
	lea.l	$C0A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d0,-(a7)
	lea.l	$C0A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$E(a0),a1
	jsr	(a1)
	unlk	a6
	rts
