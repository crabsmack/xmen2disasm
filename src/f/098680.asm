; ---------------------------------------------------------------------------
; EvilNightcrawler_StateLand - EVILNIGHTCRAWLER state: landing pose (move-set +$46), next step after 6 frames
; In:  8(a6) = this
; Out: none
; Evidence: end of the teleport sequence
; Found: link-after-rts
; ---------------------------------------------------------------------------
EvilNightcrawler_StateLand:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$AC(a4),a0
	movea.l	a0,a1
	adda.w	$46(a1),a0
	move.l	a0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	tst.l	$98(a4)
	addq.w	#$8,a7
	bne.s	loc_0986B2
	move.l	$64(a4),$5C(a4)
	move.w	#$6,$6C(a4)
	bra.s	loc_0986E0
loc_0986B2:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_0986C6
	clr.w	$96(a4)
loc_0986C6:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	move.w	#$6,$6C(a4)
loc_0986E0:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
