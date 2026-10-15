; ---------------------------------------------------------------------------
; BioBalls_StartPath - BIOBALLS: start following a path (+$9A) with flags and an offset, waiting in BioBalls_WaitPathDone
; In:  8(a6) = this  $C(a6) = path  $13(a6) = byte flags  $16/$1A(a6) = word dx, dy
; Out: none
; Evidence: +$98 bits 1-3, +$9E/+$A0; 4 callers
; ---------------------------------------------------------------------------
BioBalls_StartPath:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	clr.b	$96(a4)
	move.l	$C(a6),$9A(a4)
	moveq	#-$F,d0
	and.w	$98(a4),d0
	moveq	#$E,d1
	and.b	$13(a6),d1
	moveq	#$0,d2
	move.b	d1,d2
	or.w	d0,d2
	move.w	d2,$98(a4)
	move.w	$16(a6),$9E(a4)
	move.w	$1A(a6),$A0(a4)
	lea.l	BioBalls_WaitPathDone(pc),a0
	move.l	a0,$5C(a4)
	clr.w	$6C(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
