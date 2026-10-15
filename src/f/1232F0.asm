; ---------------------------------------------------------------------------
; BigBio_StateDeathOrbs - BIGBIO death: orb shape jt $3692, 120-frame timer, then the orbs fall
; In:  8(a6) = this
; Out: d0 = flags & 8
; Evidence: next StateDying
; ---------------------------------------------------------------------------
BigBio_StateDeathOrbs:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	ori.w	#$8,$A2(a4)
	pea.l	($FF).w
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	lea.l	$3492(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	BigBio_SetOrbShape(pc)
	move.b	#$1,$B7(a4)
	move.w	#$78,$6E(a4)
	lea.l	$10(a7),a7
	clr.w	$6C(a4)
	lea.l	BigBio_StateDying(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
