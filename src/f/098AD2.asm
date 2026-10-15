; ---------------------------------------------------------------------------
; EvilPsylocke_ActBallsPath - EVILPSYLOCKE script action: send the BIOBALLS child along path jt[$1BF2] (motion sub_11FEE4)
; In:  8(a6) = this
; Out: d0
; Evidence: same as EvilGambit_ActBallsPath with another path; jt 787
; Found: jt 787
; ---------------------------------------------------------------------------
EvilPsylocke_ActBallsPath:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$9C(a4),a3
	move.l	a3,d0
	beq.s	loc_098AFC
	lea.l	$19F2(a5),a0
	move.l	$2(a0),$9A(a3)
	lea.l	$33DA(a5),a0
	move.l	a0,$A2(a3)
	clr.l	$A6(a3)
loc_098AFC:
	tst.l	$98(a4)
	bne.s	loc_098B0E
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_098B3A
loc_098B0E:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_098B22
	clr.w	$96(a4)
loc_098B22:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_098B3A:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
