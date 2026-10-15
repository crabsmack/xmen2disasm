; ---------------------------------------------------------------------------
; sub_0BE946	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0BE946:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$8E(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	sub_0BE814(pc)
	move.w	$8E(a4),d0
	ext.l	d0
	neg.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	sub_0BE814(pc)
	pea.l	($BA).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($BA).w
	jsr	$521A(a5)	; -> Snd_Play
	lea.l	$18(a7),a7
	clr.w	$6C(a4)
	lea.l	sub_0BE896(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
