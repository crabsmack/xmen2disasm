; ---------------------------------------------------------------------------
; Exodus_StateNextAttack_part5 - part 5 of Exodus_StateNextAttack: code block split off by the code-flow tools (not a separate function)
; In:  registers/frame of Exodus_StateNextAttack
; Out: continues in Exodus_StateNextAttack
; Evidence: only reached by branches from Exodus_StateNextAttack
; ---------------------------------------------------------------------------
Exodus_StateNextAttack_part5:
	addq.b	#$1,$A9(a4)
	move.b	$A9(a4),d0
	subq.b	#$1,d0
	beq.s	loc_02D0CA
	subq.b	#$1,d0
	beq.s	loc_02D0DE
	bra.s	loc_02D0F2
loc_02D0CA:
	clr.w	$6C(a4)
	lea.l	Exodus_AtkBlast2(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	Exodus_StateNextAttack_part6
loc_02D0DE:
	clr.w	$6C(a4)
	lea.l	Exodus_AtkBlast3(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	Exodus_StateNextAttack_part6
loc_02D0F2:
	move.l	a4,-(a7)
	jsr	Exodus_NextPattern(pc)
	addq.w	#$4,a7
	bra.s	Exodus_StateNextAttack_part6
loc_02D0FC:
	addq.b	#$1,$A9(a4)
	move.b	$A9(a4),d0
	subq.b	#$1,d0
	beq.s	loc_02D10E
	subq.b	#$1,d0
	beq.s	loc_02D122
	bra.s	loc_02D136
loc_02D10E:
	clr.w	$6C(a4)
	lea.l	Exodus_AtkBlast4(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	Exodus_StateNextAttack_part6
loc_02D122:
	clr.w	$6C(a4)
	lea.l	Exodus_AtkBlast17(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	Exodus_StateNextAttack_part6
loc_02D136:
	move.l	a4,-(a7)
	jsr	Exodus_NextPattern(pc)
	addq.w	#$4,a7
