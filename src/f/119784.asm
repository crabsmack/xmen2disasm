; ---------------------------------------------------------------------------
; BBoard_CalcSize - BBoard: bytes needed for N entries = N*2 + 6
; In:  8(a6) = class  $E(a6) = word count
; Out: d0 = size
; Evidence: method 3 of BBOARD; used by BBoard_New
; ---------------------------------------------------------------------------
BBoard_CalcSize:
	link.w	a6,#$0
	move.w	$E(a6),d0
	ext.l	d0
	add.l	d0,d0
	addq.l	#$6,d0
	unlk	a6
	rts
