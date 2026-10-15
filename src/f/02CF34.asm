; ---------------------------------------------------------------------------
; Exodus_StateNextAttack_part1 - part 1 of Exodus_StateNextAttack: switch case(s) split off by the code-flow tools (not a separate function)
; In:  registers/frame of Exodus_StateNextAttack
; Out: continues in Exodus_StateNextAttack
; Evidence: only reached by branches from Exodus_StateNextAttack
; ---------------------------------------------------------------------------
Exodus_StateNextAttack_part1:
	addq.b	#$1,$A9(a4)
	move.b	$A9(a4),d0
	subq.b	#$1,d0
	bcs.w	Exodus_StateNextAttack_part3
	cmpi.b	#$5,d0
	bhi.w	Exodus_StateNextAttack_part3
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	Sw_02CF34(pc,d1.w),d1
	jmp	Sw_02CF34-2(pc,d1.w)
