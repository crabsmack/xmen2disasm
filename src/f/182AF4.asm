; ---------------------------------------------------------------------------
; Beast_Jump - BEAST slot +$82: XPLAYER jump, $100 higher while the bounce timer +$6E runs
; In:  8(a6) = player
; Out: none
; Evidence: parent +$82 via lea jt / 2(a0); vy = char +$10 (- $100 when +$6E != 0)
; ---------------------------------------------------------------------------
Beast_Jump:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	lea.l	$2B9A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$82(a0),a1
	jsr	(a1)
	tst.w	$6E(a4)
	beq.s	loc_182B2A
	movea.l	$8C(a4),a0
	move.w	$10(a0),d0
	sub.w	#$100,d0
	move.w	d0,$18(a4)
	bra.s	loc_182B34
loc_182B2A:
	movea.l	$8C(a4),a0
	move.w	$10(a0),$18(a4)
loc_182B34:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
