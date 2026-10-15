; ---------------------------------------------------------------------------
; BroodBossArm_Draw - vtable +$1A: draw a BROODBOSSARM
; In:  8(a6) = this
; Evidence: slot +$1A of the BROODBOSSARM descriptor $088C74; TAS frames 49292-51071 (1131 frames active); calls parent BROODBOSSPARTS slot +$1A
; ---------------------------------------------------------------------------
BroodBossArm_Draw:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.b	$2F(a4),d0
	cmp.w	-$3B10(a5),d0
	beq.s	loc_0862A0
	andi.b	#$DF,$2E(a4)
	move.b	-$3B0F(a5),$2F(a4)
loc_0862A0:
	moveq	#$0,d0
	move.b	$2F(a4),d0
	cmpi.w	#$FF,d0
	beq.s	loc_0862C2
	move.l	a4,-(a7)
	lea.l	$14FA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$1A(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
loc_0862C2:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
