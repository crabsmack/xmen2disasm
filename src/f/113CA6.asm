; ---------------------------------------------------------------------------
; XNpc_Attack - hit a target: call its TakeDamage (+$26) with the damage (-1 = stats byte 0), then start this object's 30-frame hit cooldown +$6A (XNPC override of slot 7, +$22)
; In:  8(a6) = this  $C(a6) = target actor  $13(a6) = byte hit type  $17(a6) = byte damage (-1 = from stats +$8C byte 0)  $1A/$1E(a6) = words passed on
; Out: none
; Evidence: ACTOR Attack uses 10 frames, XNPC 30; method 7 of class descriptor $113A88 (name string "XNPC", parent ACTOR)
; ---------------------------------------------------------------------------
XNpc_Attack:
	link.w	a6,#$0
	movem.l	d3/d7/a3-a4,-(a7)
	move.b	$17(a6),d7
	movea.l	$C(a6),a3
	movea.l	$8(a6),a4
	move.w	$1E(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$1A(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	cmpi.b	#$FF,d7
	seq.b	d3
	neg.b	d3
	beq.s	loc_113CDC
	movea.l	$8C(a4),a0
	move.b	(a0),d0
	bra.s	loc_113CDE
loc_113CDC:
	move.b	d7,d0
loc_113CDE:
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	move.b	$13(a6),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	move.l	a3,-(a7)
	movea.l	(a3),a0
	movea.l	$26(a0),a1
	jsr	(a1)
	move.w	#$1E,$6A(a4)
	lea.l	$18(a7),a7
	movem.l	-$10(a6),d3/d7/a3-a4
	unlk	a6
	rts
