; ---------------------------------------------------------------------------
; Magneto_TakeDamage - MAGNETO slot +$26: XPLAYER TakeDamage, and let go of a held flux bomb
; In:  8(a6) = player, $C..$1C(a6) = TakeDamage args
; Out: none
; Evidence: parent +$26; +$BE bomb -> its +$FE = 0
; ---------------------------------------------------------------------------
Magneto_TakeDamage:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$1E(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$1A(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.b	$17(a6),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	move.b	$13(a6),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$2BBA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$26(a0),a1
	jsr	(a1)
	tst.l	$BE(a4)
	beq.s	loc_1CEC20
	movea.l	$BE(a4),a0
	clr.b	$FE(a0)
loc_1CEC20:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
