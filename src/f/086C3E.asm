; ---------------------------------------------------------------------------
; sub_086C3E	[link-after-rts]
; ---------------------------------------------------------------------------
sub_086C3E:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$96(a4),a0
	move.w	#$FE00,$16(a0)
	movea.l	$96(a4),a0
	clr.b	$90(a0)
	lea.l	$1A6A(a5),a0
	movea.l	$96(a4),a1
	move.l	a0,$92(a1)
	moveq	#$30,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$30,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.w	$12(a4),d1
	ext.l	d1
	lsl.l	#$8,d1
	move.l	d1,-(a7)
	move.w	$10(a4),d1
	ext.l	d1
	lsl.l	#$8,d1
	move.l	d1,-(a7)
	lea.l	$1502(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d0,-(a7)
	lea.l	$1502(a5),a0
	movea.l	$2(a0),a0
	movea.l	$E(a0),a1
	jsr	(a1)
	lea.l	$1C(a7),a7
	clr.w	$6C(a4)
	lea.l	sub_086CC4(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
