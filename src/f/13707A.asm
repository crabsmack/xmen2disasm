; ---------------------------------------------------------------------------
; Hornet_Move - call the motion function in +$94 (Hornet_Move* swing/dive steps), if any (HORNET override of slot 18, +$4E; no velocity integration here)
; In:  8(a6) = this  $C(a6) = word frame step (1, or 2 when the game runs at half rate)
; Out: d0 = its result or 0
; Evidence: method 18 of class descriptor $137252 (name string "HORNET", parent XNPC)
; ---------------------------------------------------------------------------
Hornet_Move:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$94(a4),a3
	move.l	a3,d0
	beq.s	loc_137094
	move.l	a4,-(a7)
	jsr	(a3)
	addq.w	#$4,a7
loc_137094:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
