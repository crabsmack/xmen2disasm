; ---------------------------------------------------------------------------
; sub_11E36E	[jt 1619]
; ---------------------------------------------------------------------------
sub_11E36E:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$14(a6),-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$32E2(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	lea.l	$32AA(a5),a0
	move.l	$2(a0),$30(a4)
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$1,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
	ori.w	#$2,$6(a4)
	ori.w	#$1,$6(a4)
	move.b	#$60,$42(a4)
	moveq	#$7E,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$7E,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	movea.l	-$4(a6),a4
	unlk	a6
	rts
