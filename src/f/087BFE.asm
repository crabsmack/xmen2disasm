; ---------------------------------------------------------------------------
; BroodBoss_StateDeathSlide - BROODBOSS state: slide until the boss offset reaches $1B2, then stop and spawn a death effect actor
; In:  8(a6) = this
; Out: d0
; Evidence: plain ACTOR New at the boss position with sub_13EFA0(effect, jt[$16DA], 0, -$10, -$10, 0); next BroodBoss_StateDeathAnim; TAS 50614-50629
; Found: link-after-rts
; ---------------------------------------------------------------------------
BroodBoss_StateDeathSlide:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	-$3C44(a5),d0
	asr.l	#$8,d0
	cmpi.l	#$1B2,d0
	bge.s	loc_087C2C
	clr.w	$6C(a4)
	lea.l	BroodBoss_StateDeathSlide(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_087CAA
loc_087C2C:
	movea.l	$96(a4),a0
	clr.w	$16(a0)
	movea.l	$96(a4),a0
	clr.b	$90(a0)
	movea.l	$96(a4),a0
	moveq	#$0,d0
	move.l	d0,$92(a0)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	$C(a4),-(a7)
	move.l	$8(a4),-(a7)
	lea.l	$4DC2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d0,-(a7)
	lea.l	$4DC2(a5),a0
	movea.l	$2(a0),a0
	movea.l	$E(a0),a1
	jsr	(a1)
	movea.l	d0,a3
	move.l	a3,d0
	lea.l	$14(a7),a7
	beq.s	loc_087C98
	ori.b	#$4,$2E(a3)
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#-$10,d1
	move.l	d1,-(a7)
	move.l	d1,-(a7)
	move.l	d0,-(a7)
	lea.l	$14DA(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a3,-(a7)
	jsr	$3AFA(a5)	; -> sub_13EFA0
	lea.l	$18(a7),a7
loc_087C98:
	clr.w	$6C(a4)
	lea.l	BroodBoss_StateDeathAnim(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_087CAA:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
