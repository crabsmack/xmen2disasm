; ---------------------------------------------------------------------------
; Mine_StateArm4 - mine arming step 4: fastest blink for 13 frames, then explode
; In:  8(a6) = mine record
; Out: none
; Evidence: +$10 = Tbl_MineAnimArm4 (frame delay 1), +$1C = 13, +$18 = Mine_Explode
; ---------------------------------------------------------------------------
Mine_StateArm4:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$39F2(a5),a0
	movea.l	$2(a0),a0
	move.l	a0,$10(a4)
	moveq	#$0,d0
	move.b	$7(a0),d0
	move.w	d0,$E(a4)
	clr.l	$14(a4)
	lea.l	Mine_Explode(pc),a0
	move.l	a0,$18(a4)
	move.w	#$D,$1C(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
