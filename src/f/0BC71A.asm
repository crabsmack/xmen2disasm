; ---------------------------------------------------------------------------
; sub_0BC71A	[jt 1017]
; ---------------------------------------------------------------------------
sub_0BC71A:
	link.w	a6,#$0
	movem.l	d5-d7/a4,-(a7)
	movea.l	$8(a6),a4
	clr.b	d6
	clr.w	d5
	move.w	#$E0,d7
	moveq	#$8,d0
	and.b	$2E(a4),d0
	bne.s	loc_0BC73E
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
	move.w	d0,d7
loc_0BC73E:
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_0BC74A
	ori.b	#$2,d6
loc_0BC74A:
	moveq	#$8,d0
	and.b	$2E(a4),d0
	bne.s	loc_0BC756
	ori.b	#$4,d6
loc_0BC756:
	ext.l	d7
	move.l	d7,-(a7)
	ext.l	d5
	move.l	d5,-(a7)
	moveq	#$0,d0
	move.b	d6,d0
	move.l	d0,-(a7)
	lea.l	$1E92(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$339A(a5)	; -> BioBalls_StartPath
	pea.l	($EF).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($EF).w
	jsr	$521A(a5)	; -> Snd_Play
	lea.l	$1C(a7),a7
	clr.w	$6C(a4)
	lea.l	$3352(a5),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movem.l	-$10(a6),d5-d7/a4
	unlk	a6
	rts
