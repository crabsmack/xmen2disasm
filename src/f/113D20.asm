; ---------------------------------------------------------------------------
; XNpc_TakeHit - XNpc: receive a hit from an attacker: damage, hurt state, invulnerability timer (class slot 8, +$26)
; In:  8(a6) = this  $C(a6) = attacker  $13(a6) = byte hit type  $17(a6) = byte damage  $1A/$1E(a6) = words
; Out: none
; Evidence: method 8 of class descriptor $113A88 (name string "XNPC", parent ACTOR)
; ---------------------------------------------------------------------------
XNpc_TakeHit:
	link.w	a6,#$0
	movem.l	d3/d6-d7/a4,-(a7)
	move.b	$17(a6),d6
	move.b	$13(a6),d7
	movea.l	$8(a6),a4
	move.b	d7,d0
	subq.b	#$4,d0
	bmi.s	loc_113D64
	cmpi.b	#$8,d0
	bgt.s	loc_113D64
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	$113D4E(pc,d1.w),d1
	jmp	$113D4C(pc,d1.w)
