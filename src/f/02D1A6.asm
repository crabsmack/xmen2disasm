; ---------------------------------------------------------------------------
; sub_02D1A6	[link-after-rts]
; ---------------------------------------------------------------------------
sub_02D1A6:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$68A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.l	$C(a4),d1
	sub.l	#$4600,d1
	move.l	d1,-(a7)
	move.l	$8(a4),-(a7)
	jsr	$6E2(a5)	; -> sub_02E526
	moveq	#$7,d0
	move.l	d0,-(a7)
	move.l	$C(a4),d1
	sub.l	#$4600,d1
	move.l	d1,-(a7)
	move.l	$8(a4),-(a7)
	jsr	$6E2(a5)	; -> sub_02E526
	pea.l	($E0).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($E0).w
	jsr	$521A(a5)	; -> Snd_Play
	lea.l	$28(a7),a7
	clr.w	$6C(a4)
	lea.l	sub_02D658(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
