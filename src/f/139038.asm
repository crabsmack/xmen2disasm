; ---------------------------------------------------------------------------
; MaintRobot_StateChase_Case1 - segment type $22 case of MaintRobot_StateChase: move toward the player in x with the sign reversed
; In:  a3 = player  a4 = this  d7 = speed
; Out: none
; Evidence: switch table Sw_138F1E entry 1 (+$16 = -speed when the player is right)
; ---------------------------------------------------------------------------
MaintRobot_StateChase_Case1:
	move.w	$4E(a3),d0
	cmp.w	$52(a4),d0
	sgt.b	d3
	neg.b	d3
	beq.s	loc_13904E
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
	bra.s	loc_139064
loc_13904E:
	move.w	$52(a3),d0
	cmp.w	$4E(a4),d0
	slt.b	d3
	neg.b	d3
	beq.s	loc_139060
	move.w	d7,d0
	bra.s	loc_139062
loc_139060:
	moveq	#$0,d0
loc_139062:
	ext.l	d0
loc_139064:
	move.w	d0,$16(a4)
	bra.s	MaintRobot_StateChase_End
