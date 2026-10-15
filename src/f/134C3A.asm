; ---------------------------------------------------------------------------
; FlyBrood_Deactivate - FlyBrood: deactivate: release sprite/collision resources, leave object lists (class slot 16, +$46)
; In:  8(a6) = this
; Out: none
; Evidence: method 16 of class descriptor $134518 (name string "FLYBROOD", parent ACTOR)
; ---------------------------------------------------------------------------
FlyBrood_Deactivate:
	link.w	a6,#$0
	move.l	$8(a6),-(a7)
	lea.l	$3732(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$46(a0),a1
	jsr	(a1)
	move.w	-$1A86(a5),d0
	subq.w	#$1,-$1A86(a5)
	unlk	a6
	rts
