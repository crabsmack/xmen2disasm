; ---------------------------------------------------------------------------
; Ninja_Deactivate - Ninja: deactivate: release sprite/collision resources, leave object lists (class slot 16, +$46)
; In:  8(a6) = this
; Out: none
; Evidence: method 16 of class descriptor $13D7FE (name string "NINJA", parent BIONPC)
; ---------------------------------------------------------------------------
Ninja_Deactivate:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$3AB2(a5),a0
	move.l	$98(a4),d0
	cmp.l	$2(a0),d0
	bne.s	loc_13D282
	move.l	a4,-(a7)
	jsr	$4E8A(a5)	; -> sub_1F66F0
	addq.w	#$4,a7
	bra.s	loc_13D298
loc_13D282:
	move.l	a4,-(a7)
	lea.l	$3A72(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$46(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
loc_13D298:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
