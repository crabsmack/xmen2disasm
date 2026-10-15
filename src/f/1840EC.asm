; ---------------------------------------------------------------------------
; Beast_Attack - BEAST slot +$22: XPLAYER Attack; a hit while diving ends the dive with an impact
; In:  8(a6) = player, $C(a6) = target, $10..$1C(a6) = Attack args
; Out: d0
; Evidence: parent +$22; airborne with +$90 bit 1 -> Beast_DiveImpact
; ---------------------------------------------------------------------------
Beast_Attack:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$1E(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$1A(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.b	$17(a6),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	move.b	$13(a6),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$2B9A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$22(a0),a1
	jsr	(a1)
	move.w	#$1000,d0
	and.w	$4(a4),d0
	lea.l	$18(a7),a7
	beq.s	loc_184150
	moveq	#$1,d0
	and.l	$90(a4),d0
	beq.s	loc_184150
	move.l	a4,-(a7)
	jsr	Beast_DiveImpact(pc)
	addq.w	#$4,a7
loc_184150:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
