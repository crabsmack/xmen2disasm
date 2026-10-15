; ---------------------------------------------------------------------------
; Launcher_AddShot - LAUNCHER: put a shot in the first free slot, 10 px to the side and 16 px up, moving at vx
; In:  8(a6) = this, $E(a6) = word vx
; Out: none
; Evidence: slots {long x, long y, word vx} at +$90..+$B8; caller Launcher_StateFire
; Found: link-after-rts
; ---------------------------------------------------------------------------
Launcher_AddShot:
	link.w	a6,#$0
	movem.l	d3/d7/a3-a4,-(a7)
	move.w	$E(a6),d7
	movea.l	$8(a6),a3
	lea.l	$90(a3),a4
	bra.s	loc_0BE860
loc_0BE82A:
	tst.l	(a4)
	bne.s	loc_0BE85C
	tst.w	d7
	sgt.b	d3
	neg.b	d3
	beq.s	loc_0BE83C
	move.w	#$A00,d0
	bra.s	loc_0BE840
loc_0BE83C:
	move.w	#$F600,d0
loc_0BE840:
	ext.l	d0
	add.l	$8(a3),d0
	move.l	d0,(a4)
	move.l	$C(a3),d0
	sub.l	#$1000,d0
	move.l	d0,$4(a4)
	move.w	d7,$8(a4)
	bra.s	loc_0BE868
loc_0BE85C:
	lea.l	$A(a4),a4
loc_0BE860:
	lea.l	$B8(a3),a0
	cmpa.l	a4,a0
	bhi.s	loc_0BE82A
loc_0BE868:
	movem.l	-$10(a6),d3/d7/a3-a4
	unlk	a6
	rts
