; ---------------------------------------------------------------------------
; SavageA2_InitFlood - SavageA2: start the flood line below the bottom camera limit and install its raster hook
; In:  none
; Out: none
; Evidence: level = (max y + $E0) << 8; sub_0C0DC2(3, level+1, level+1); -$38F4 := sub_0C0FD2; jt 895
; Found: jt 895
; ---------------------------------------------------------------------------
SavageA2_InitFlood:
	link.w	a6,#$0
	move.w	-$3A92(a5),d0
	ext.l	d0
	add.l	#$E0,d0
	lsl.l	#$8,d0
	move.l	d0,-$3C32(a5)
	asr.l	#$8,d0
	move.w	d0,-$38BC(a5)
	ext.l	d0
	addq.l	#$1,d0
	move.l	d0,-(a7)
	move.w	-$38BC(a5),d0
	ext.l	d0
	addq.l	#$1,d0
	move.l	d0,-(a7)
	moveq	#$3,d0
	move.l	d0,-(a7)
	jsr	$2302(a5)	; -> sub_0C0DC2
	lea.l	$230A(a5),a0
	move.l	a0,-$38F4(a5)
	unlk	a6
	rts
