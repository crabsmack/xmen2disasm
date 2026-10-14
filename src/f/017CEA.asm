; ---------------------------------------------------------------------------
; sub_017CEA	[link-after-rts]
; ---------------------------------------------------------------------------
sub_017CEA:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$76(a0),a1
	jsr	(a1)
	lea.l	$C(a7),a7
	move.w	#$4,$6C(a4)
	lea.l	sub_017D2C(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
