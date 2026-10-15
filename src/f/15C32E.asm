; ---------------------------------------------------------------------------
; Pause_ShowText - put the two PAUSE text sprites at the head of the hardware sprite table
; In:  none
; Out: none
; Evidence: g_SpriteTable entries 0/1: y $B4, sizes 5/$D, tiles $A794/$A798, x $100/$110; called by Pause_Check
; ---------------------------------------------------------------------------
Pause_ShowText:
	link.w	a6,#$0
	movem.l	d5-d7,-(a7)
	move.w	#$A0,d5
	moveq	#$54,d6
	move.w	#$794,d7
	ori.w	#$2000,d7
	ori.w	#$8000,d7
	move.w	d6,d0
	add.w	#$60,d0
	move.w	d0,g_SpriteTable(a5)
	move.b	#$5,-$1FD8(a5)
	move.w	d7,-$1FD6(a5)
	move.w	d5,d0
	add.w	#$60,d0
	move.w	d0,-$1FD4(a5)
	move.w	#$798,d7
	ori.w	#$2000,d7
	ori.w	#$8000,d7
	move.w	d6,d0
	add.w	#$60,d0
	move.w	d0,-$1FD2(a5)
	move.b	#$D,-$1FD0(a5)
	move.w	d7,-$1FCE(a5)
	move.w	d5,d0
	add.w	#$70,d0
	move.w	d0,-$1FCC(a5)
	movem.l	-$C(a6),d5-d7
	unlk	a6
	rts
