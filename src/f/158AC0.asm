; ---------------------------------------------------------------------------
; sub_158AC0	[jt 1983]
; ---------------------------------------------------------------------------
sub_158AC0:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	move.w	$E(a6),d7
	lea.l	-$1A68(a5),a4
	move.b	d7,$1(a4)
	cmpi.w	#$FF,d7
	beq.s	loc_158AEA
	moveq	#$0,d0
	move.b	$A(a4),d0
	cmp.w	d7,d0
	bne.s	loc_158AEA
	ori.b	#$20,(a4)
	bra.s	loc_158AEE
loc_158AEA:
	andi.b	#$DF,(a4)
loc_158AEE:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
