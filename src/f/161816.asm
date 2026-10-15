; ---------------------------------------------------------------------------
; Cam_DefaultUpdate - default camera update (+4): save the old position, then run tracking (+8), offset easing (+$10), shake (+$14), look (+$18) and apply (+$C)
; In:  8(a6) = this
; Out: none
; Evidence: +$34/+$36 = old y/x; byte $FFC970 = 1 unless no player is alive and $FFC746 is clear
; ---------------------------------------------------------------------------
Cam_DefaultUpdate:
	link.w	a6,#$0
	movem.l	d3/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$32(a4),$34(a4)
	move.w	$30(a4),$36(a4)
	movea.l	$8(a4),a3
	move.l	a3,d0
	beq.s	loc_16183C
	move.l	a4,-(a7)
	jsr	(a3)
	addq.w	#$4,a7
loc_16183C:
	movea.l	$10(a4),a3
	move.l	a3,d0
	beq.s	loc_16184A
	move.l	a4,-(a7)
	jsr	(a3)
	addq.w	#$4,a7
loc_16184A:
	movea.l	$14(a4),a3
	move.l	a3,d0
	beq.s	loc_161858
	move.l	a4,-(a7)
	jsr	(a3)
	addq.w	#$4,a7
loc_161858:
	movea.l	$18(a4),a3
	move.l	a3,d0
	beq.s	loc_161866
	move.l	a4,-(a7)
	jsr	(a3)
	addq.w	#$4,a7
loc_161866:
	movea.l	$C(a4),a3
	move.l	a3,d0
	beq.s	loc_161874
	move.l	a4,-(a7)
	jsr	(a3)
	addq.w	#$4,a7
loc_161874:
	moveq	#$1,d3
	move.w	g_Player1+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	beq.s	loc_1618AE
	move.w	g_Player2+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	beq.s	loc_1618AE
	tst.b	g_BgLockToObj(a5)
	bne.s	loc_1618AE
	moveq	#$0,d3
loc_1618AE:
	move.b	d3,g_CamActive(a5)
	movem.l	-$C(a6),d3/a3-a4
	unlk	a6
	rts
