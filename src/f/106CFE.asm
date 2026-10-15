; ---------------------------------------------------------------------------
; Platform1_Init_Common - Platform1_Init default case and common tail: frame 2, actor flags, speed from spawn +$C (default $200), ride mode from spawn +$E
; In:  a4 = this, a3 = spawn record (inside Platform1_Init)
; Out: -
; Evidence: +$94 speed, +$90 mode bits 0-1, +$92 saved speed, +$6E cooldown 10; reached also by Sw_106BF0 out-of-range types
; ---------------------------------------------------------------------------
Platform1_Init_Common:
	moveq	#$2,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	ori.w	#$80,$6(a4)
	ori.w	#$1,$6(a4)
	ori.w	#$2,$6(a4)
	ori.w	#$200,$6(a4)
	move.l	a4,-(a7)
	jsr	$4EC2(a5)	; -> Obj_StandOnSegHere
	clr.w	$90(a4)
	tst.w	$C(a3)
	beq.s	loc_106D40
	move.w	$C(a3),d0
	ext.l	d0
	lsl.l	#$8,d0
	bra.s	loc_106D46
loc_106D40:
	move.l	#$200,d0
loc_106D46:
	move.w	d0,$94(a4)
	clr.w	$92(a4)
	move.w	$E(a3),d0
	addq.w	#$4,a7
	beq.s	loc_106D60
	subq.w	#$1,d0
	beq.s	loc_106D6E
	subq.w	#$1,d0
	beq.s	loc_106D8C
	bra.s	loc_106DAA
loc_106D60:
	andi.w	#$FFFC,$90(a4)
	ori.w	#$0,$90(a4)
	bra.s	loc_106DB6
loc_106D6E:
	andi.w	#$FFFC,$90(a4)
	ori.w	#$1,$90(a4)
	move.w	$16(a4),$92(a4)
	clr.w	$16(a4)
	move.w	#$A,$6E(a4)
	bra.s	loc_106DB6
loc_106D8C:
	andi.w	#$FFFC,$90(a4)
	ori.w	#$2,$90(a4)
	move.w	$16(a4),$92(a4)
	clr.w	$16(a4)
	move.w	#$A,$6E(a4)
	bra.s	loc_106DB6
loc_106DAA:
	andi.w	#$FFFC,$90(a4)
	ori.w	#$0,$90(a4)
loc_106DB6:
	movem.l	-$C(a6),d3/a3-a4
	unlk	a6
	rts
