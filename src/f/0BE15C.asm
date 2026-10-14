; ---------------------------------------------------------------------------
; sub_0BE15C	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0BE15C:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$AA(a4),-(a7)
	move.l	a4,-(a7)
	jsr	sub_0BD6E2(pc)
	move.b	$BD(a4),d0
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	sub_0BDAC4(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
