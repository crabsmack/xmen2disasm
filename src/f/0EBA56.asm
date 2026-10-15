; ---------------------------------------------------------------------------
; CoreShields_Move - rotate the shield ring instead of moving: each time the +$6E move timer runs out, reset it to 20 and step the phase +$91 (0-2), carrying into the rotation index +$90 (0-7) (CoreShields override of slot 18 Move; no velocity)
; In:  8(a6) = this  $C(a6) = word frame step (unused)
; Out: none
; Evidence: Actor_Update counts +$6E down; +$90/+$91 are read by CoreShields_Draw and CoreShields_TakeDamage; method 18 of class descriptor $0EBE7E (name string "CORESHIELDS", parent ACTOR)
; ---------------------------------------------------------------------------
CoreShields_Move:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.w	$6E(a4)
	bgt.s	loc_0EBA8C
	move.w	#$14,$6E(a4)
	addq.b	#$1,$91(a4)
	moveq	#$2,d0
	cmp.b	$91(a4),d0
	bge.s	loc_0EBA8C
	clr.b	$91(a4)
	addq.b	#$1,$90(a4)
	moveq	#$8,d0
	cmp.b	$90(a4),d0
	bgt.s	loc_0EBA8C
	clr.b	$90(a4)
loc_0EBA8C:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
