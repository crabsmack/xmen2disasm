; ---------------------------------------------------------------------------
; Mine_StateArm1 - mine arming step 1: faster blink for 20 frames
; In:  8(a6) = mine record
; Out: none
; Evidence: +$10 = Tbl_MineAnimArm1 (frame delay 4), +$1C = 20, +$18 = Mine_StateArm2
; ---------------------------------------------------------------------------
Mine_StateArm1:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$39DA(a5),a0
	movea.l	$2(a0),a0
	move.l	a0,$10(a4)
	moveq	#$0,d0
	move.b	$7(a0),d0
	move.w	d0,$E(a4)
	clr.l	$14(a4)
	lea.l	Mine_StateArm2(pc),a0
	move.l	a0,$18(a4)
	move.w	#$14,$1C(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
