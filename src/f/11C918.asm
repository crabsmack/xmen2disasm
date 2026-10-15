; ---------------------------------------------------------------------------
; BabyBio_ActWaitParam - BABYBIO script action: next entry after the spawn-record delay +$B6 (default 120)
; In:  8(a6) = this
; Out: none
; Evidence: +$B6 set by BabyBio_Init from spawn word +$C
; ---------------------------------------------------------------------------
BabyBio_ActWaitParam:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.l	$98(a4)
	bne.s	loc_11C93A
	move.l	$64(a4),$5C(a4)
	moveq	#$0,d0
	move.b	$B6(a4),d0
	move.w	d0,$6C(a4)
	bra.s	loc_11C96C
loc_11C93A:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_11C94E
	clr.w	$96(a4)
loc_11C94E:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	moveq	#$0,d0
	move.b	$B6(a4),d0
	move.w	d0,$6C(a4)
loc_11C96C:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
