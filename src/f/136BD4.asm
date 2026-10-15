; ---------------------------------------------------------------------------
; Hornet_StateShotLoop - Hornet state: start the next shot of the volley (aim animation) or go back to the attack delay
; In:  8(a6) = this
; Out: d0 = flags & 8 (unused)
; Evidence: +$A8 = 0 -> +$5C = Hornet_StateAttackDelay; else +$A8 -= 1, Obj_ChangeAnim(Tbl_HornetAnimAim), +$6C = $FF, +$5C = Hornet_StateFire
; ---------------------------------------------------------------------------
Hornet_StateShotLoop:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.w	$A8(a4)
	bne.s	loc_136BF8
	clr.w	$6C(a4)
	lea.l	Hornet_StateAttackDelay(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_136C20
loc_136BF8:
	subq.w	#$1,$A8(a4)
	lea.l	$37D2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	addq.w	#$8,a7
	move.w	#$FF,$6C(a4)
	lea.l	Hornet_StateFire(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_136C20:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
