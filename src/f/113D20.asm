; ---------------------------------------------------------------------------
; XNpc_TakeDamage - hit types 9-12 (type 4 counts as 12): health -= damage, hurt flag, hurt frame (stats byte 7) and hurt sound (stats byte 1, default 99); dead -> cooldown 10000 and OnDeath (+$72), else cooldown 30 and OnHurt (+$6E); other hit types go to ACTOR TakeDamage (XNPC override of slot 8, +$26)
; In:  8(a6) = this  $C(a6) = attacker  $13(a6) = byte hit type  $17(a6) = byte damage  $1A/$1E(a6) = words
; Out: none
; Evidence: switch cases XNpc_TakeDamage_Type4/_Hurt/_Default; stats record +$8C; method 8 of class descriptor $113A88 (name string "XNPC", parent ACTOR)
; ---------------------------------------------------------------------------
XNpc_TakeDamage:
	link.w	a6,#$0
	movem.l	d3/d6-d7/a4,-(a7)
	move.b	$17(a6),d6
	move.b	$13(a6),d7
	movea.l	$8(a6),a4
	move.b	d7,d0
	subq.b	#$4,d0
	bmi.s	XNpc_TakeDamage_Default
	cmpi.b	#$8,d0
	bgt.s	XNpc_TakeDamage_Default
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	Sw_113D20(pc,d1.w),d1
	jmp	Sw_113D20-2(pc,d1.w)
