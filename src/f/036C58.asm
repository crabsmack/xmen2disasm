; ---------------------------------------------------------------------------
; sub_036C58	[link-after-rts]
; ---------------------------------------------------------------------------
sub_036C58:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$752(a5),a0
	move.l	$2(a0),-$38A4(a5)
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$A,d1
	move.l	d1,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	jsr	sub_0369F0(pc)
	lea.l	$10(a7),a7
	clr.w	$6C(a4)
	lea.l	sub_036C9E(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
