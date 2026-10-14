; ---------------------------------------------------------------------------
; sub_010D76	[jt 40]
; ---------------------------------------------------------------------------
sub_010D76:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	pea.l	($1B12).w
	move.l	a4,-(a7)
	jsr	sub_01091E(pc)
	pea.l	($3D2).w
	move.l	a4,-(a7)
	jsr	sub_0108CE(pc)
	lea.l	$10(a7),a7
	clr.w	$6C(a4)
	lea.l	sub_010DB2(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
