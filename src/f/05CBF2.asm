; ---------------------------------------------------------------------------
; sub_05CBF2	[link-after-rts]
; ---------------------------------------------------------------------------
sub_05CBF2:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$36,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$36,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	pea.l	-$1652(a5)
	move.l	$84(a4),-(a7)
	jsr	$406A(a5)	; -> List_Unlink
	moveq	#$0,d0
	move.l	d0,$84(a4)
	clr.b	$9A(a4)
	move.w	#$32,$6E(a4)
	lea.l	sub_05CC3A(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$0,d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
