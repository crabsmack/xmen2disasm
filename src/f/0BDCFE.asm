; ---------------------------------------------------------------------------
; Barbarian_StateApproach - BARBARIAN state: attack when within $32 px of the target, else walk towards it
; In:  8(a6) = this
; Out: d0
; Evidence: +$BF = 1 (walking); next Barbarian_StateAttack or Barbarian_StateWalkStart
; Found: link-after-rts
; ---------------------------------------------------------------------------
Barbarian_StateApproach:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.b	#$1,$BF(a4)
	move.l	a4,-(a7)
	jsr	Barbarian_TargetClose(pc)
	tst.b	d0
	addq.w	#$4,a7
	beq.s	loc_0BDD34
	ori.w	#$4000,$6(a4)
	clr.w	$6C(a4)
	lea.l	Barbarian_StateAttack(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_0BDD4A
loc_0BDD34:
	clr.b	$BC(a4)
	clr.w	$6C(a4)
	lea.l	Barbarian_StateWalkStart(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0BDD4A:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
