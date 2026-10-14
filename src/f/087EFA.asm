; ---------------------------------------------------------------------------
; sub_087EFA	[link-after-rts]
; ---------------------------------------------------------------------------
sub_087EFA:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$96(a4),a0
	move.w	#$100,$16(a0)
	movea.l	$96(a4),a0
	clr.b	$90(a0)
	lea.l	$1A6A(a5),a0
	movea.l	$96(a4),a1
	move.l	a0,$92(a1)
	clr.w	$6C(a4)
	lea.l	sub_087F3C(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
