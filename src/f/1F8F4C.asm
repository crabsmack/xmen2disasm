; ---------------------------------------------------------------------------
; sub_1F8F4C	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1F8F4C:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	-$1358(a5),a4
	lea.l	-$1108(a5),a3
	bra.s	loc_1F8F74
loc_1F8F5E:
	lea.l	$14(a4),a4
	cmpa.l	a4,a3
	bcc.s	loc_1F8F6A
	lea.l	-$134C(a5),a4
loc_1F8F6A:
	cmpa.l	-$1358(a5),a4
	bne.s	loc_1F8F74
	moveq	#$0,d0
	bra.s	loc_1F8F98
loc_1F8F74:
	moveq	#$0,d0
	move.w	$12(a4),d0
	tst.l	d0
	bne.s	loc_1F8F5E
	move.l	a4,d0
	moveq	#$14,d1
	add.l	d1,d0
	move.l	d0,-$1358(a5)
	cmpa.l	-$1358(a5),a3
	bcc.s	loc_1F8F96
	lea.l	-$134C(a5),a0
	move.l	a0,-$1358(a5)
loc_1F8F96:
	move.l	a4,d0
loc_1F8F98:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
