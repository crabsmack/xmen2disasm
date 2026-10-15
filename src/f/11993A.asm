; ---------------------------------------------------------------------------
; Synchronizer_ClearFlag - Synchronizer: clear bit $100 of its BBoard entry
; In:  8(a6) = this
; Out: none
; Evidence: method 5 of SYNCHRONIZER
; ---------------------------------------------------------------------------
Synchronizer_ClearFlag:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a0
	moveq	#$0,d0
	move.b	$37(a0),d0
	movea.l	g_BBoard(a5),a0
	add.l	d0,d0
	lea.l	$6(a0,d0.l),a4
	andi.w	#$FEFF,(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
