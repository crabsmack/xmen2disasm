; ---------------------------------------------------------------------------
; BigAcBullet_Init - parent Init, then no gravity, state BigAcBullet_StateLaunch (+$5C/+$64), sprite set jt $20A, flags |= $AA, max/min speed $1000/$F000, no anchor (+$8E = 0, offsets +$92/+$96 = 0), frame $FF (BIGACBULLET override of slot +$12 Init)
; In:  8(a6) = this (BIGACBULLET object), $C(a6)/$10(a6) = x/y (8.8 fixed), $14(a6) = spawn param
; Out: none
; Evidence: class descriptor BIGACBULLET slot +$12 (tools/classes.py); TAS frames 13509-13648 (7 active)
; ---------------------------------------------------------------------------
BigAcBullet_Init:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$14(a6),-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$1C2(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	clr.w	$20(a4)
	lea.l	BigAcBullet_StateLaunch(pc),a0
	move.l	a0,$64(a4)
	move.l	a0,$5C(a4)
	lea.l	$20A(a5),a0
	move.l	$2(a0),$30(a4)
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$3,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
	move.b	#$1,$70(a4)
	ori.w	#$AA,$6(a4)
	move.b	#$60,$42(a4)
	move.w	#$1000,$22(a4)
	move.w	#$F000,$26(a4)
	moveq	#$0,d0
	move.l	d0,$8E(a4)
	move.l	d0,$92(a4)
	move.l	d0,$96(a4)
	pea.l	($FF).w
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
