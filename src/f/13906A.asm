; ---------------------------------------------------------------------------
; MaintRobot_StateChase_Case3 - segment type $24 case of MaintRobot_StateChase: move toward the player in y (reversed sign)
; In:  a3 = player  a4 = this  d7 = speed
; Out: none
; Evidence: switch table Sw_138F1E entry 3, compares y-$30 with the player box +/-$10
; ---------------------------------------------------------------------------
MaintRobot_StateChase_Case3:
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.l	d0,d6
	moveq	#-$30,d0
	add.l	d0,d6
	move.w	$50(a3),d1
	ext.l	d1
	moveq	#$10,d2
	sub.l	d2,d1
	cmp.l	d1,d6
	sgt.b	d3
	neg.b	d3
	beq.s	loc_139090
	ext.l	d7
	move.l	d7,d1
	neg.l	d1
	bra.s	loc_1390AC
loc_139090:
	move.w	$4C(a3),d0
	ext.l	d0
	moveq	#$10,d1
	add.l	d1,d0
	cmp.l	d0,d6
	slt.b	d3
	neg.b	d3
	beq.s	loc_1390A6
	move.w	d7,d0
	bra.s	loc_1390A8
loc_1390A6:
	moveq	#$0,d0
loc_1390A8:
	ext.l	d0
	move.l	d0,d1
loc_1390AC:
	move.w	d1,$16(a4)
