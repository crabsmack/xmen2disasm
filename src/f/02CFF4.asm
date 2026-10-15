; ---------------------------------------------------------------------------
; Exodus_StateNextAttack_part4 - part 4 of Exodus_StateNextAttack: code block split off by the code-flow tools (not a separate function)
; In:  registers/frame of Exodus_StateNextAttack
; Out: continues in Exodus_StateNextAttack
; Evidence: only reached by branches from Exodus_StateNextAttack
; ---------------------------------------------------------------------------
Exodus_StateNextAttack_part4:
	addq.b	#$1,$A9(a4)
	move.b	$A9(a4),d0
	subq.b	#$1,d0
	beq.s	loc_02D002
	bra.s	loc_02D018
loc_02D002:
	clr.w	$6C(a4)
	lea.l	Exodus_AtkBlast17(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	Exodus_StateNextAttack_part6
loc_02D018:
	move.l	a4,-(a7)
	jsr	Exodus_NextPattern(pc)
	addq.w	#$4,a7
	bra.w	Exodus_StateNextAttack_part6
loc_02D024:
	addq.b	#$1,$A9(a4)
	move.b	$A9(a4),d0
	subq.b	#$1,d0
	beq.s	loc_02D036
	subq.b	#$1,d0
	beq.s	loc_02D04C
	bra.s	loc_02D062
loc_02D036:
	clr.w	$6C(a4)
	lea.l	Exodus_AtkBlast4(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	Exodus_StateNextAttack_part6
loc_02D04C:
	clr.w	$6C(a4)
	lea.l	Exodus_AtkBlast2(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	Exodus_StateNextAttack_part6
loc_02D062:
	move.l	a4,-(a7)
	jsr	Exodus_NextPattern(pc)
	addq.w	#$4,a7
	bra.w	Exodus_StateNextAttack_part6
loc_02D06E:
	addq.b	#$1,$A9(a4)
	move.b	$A9(a4),d0
	subq.b	#$1,d0
	beq.s	loc_02D080
	subq.b	#$1,d0
	beq.s	loc_02D096
	bra.s	loc_02D0AC
loc_02D080:
	clr.w	$6C(a4)
	lea.l	Exodus_AtkBlast4(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	Exodus_StateNextAttack_part6
loc_02D096:
	clr.w	$6C(a4)
	lea.l	Exodus_AtkBlast3(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.w	Exodus_StateNextAttack_part6
loc_02D0AC:
	move.l	a4,-(a7)
	jsr	Exodus_NextPattern(pc)
	addq.w	#$4,a7
	bra.w	Exodus_StateNextAttack_part6
