; ---------------------------------------------------------------------------
; Hornet_StatePickPattern_StartAttack - tail of Hornet_StatePickPattern: schedule Hornet_StateFacePlayer after the attack delay +$A6
; In:  a4 = this
; Out: d0 = flags & 8 (unused)
; Evidence: same code as Hornet_StateAttackDelay, reached by every switch case
; ---------------------------------------------------------------------------
Hornet_StatePickPattern_StartAttack:
	moveq	#-$1,d0
	cmp.w	$A6(a4),d0
	bne.s	loc_136E1E
	lea.l	Hornet_StateFacePlayer(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	Hornet_StateFacePlayer(pc)
	addq.w	#$4,a7
	bra.s	loc_136E32
loc_136E1E:
	move.w	$A6(a4),$6C(a4)
	lea.l	Hornet_StateFacePlayer(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_136E32:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
