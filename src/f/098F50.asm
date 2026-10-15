; ---------------------------------------------------------------------------
; loc_098F50	[runtime: executed in tas]
; ---------------------------------------------------------------------------
loc_098F50:
	move.l	a4,-(a7)
	move.w	$4(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,-(a7)
	move.w	$2(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,-(a7)
	lea.l	$1942(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$1942(a5),a0
	movea.l	$2(a0),a0
	movea.l	$E(a0),a1
	jsr	(a1)
	movea.l	d0,a3
	lea.l	$14(a7),a7
