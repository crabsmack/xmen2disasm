; ---------------------------------------------------------------------------
; TankLeft_Deactivate - TANKLEFT slot +$46: once driving away (script jt $3E82) remove it for good, else the parent Deactivate
; In:  8(a6) = this
; Out: none
; Evidence: +$96 == jt $3E82 -> $1F66F0(this); else TANK +$46
; ---------------------------------------------------------------------------
TankLeft_Deactivate:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$3C82(a5),a0
	move.l	$96(a4),d0
	cmp.l	$2(a0),d0
	bne.s	loc_141DCA
	move.l	a4,-(a7)
	jsr	$4E8A(a5)	; -> Actor_DeactivateFree
	addq.w	#$4,a7
	bra.s	loc_141DE0
loc_141DCA:
	move.l	a4,-(a7)
	lea.l	$3C52(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$46(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
loc_141DE0:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
