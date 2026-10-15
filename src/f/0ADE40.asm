; ---------------------------------------------------------------------------
; TrapDoor_StateClosing - TRAPDOOR state: closing - tiles +$98 for 8 frames
; In:  8(a6) = this
; Out: d0
; Found: link-after-rts
; ---------------------------------------------------------------------------
TrapDoor_StateClosing:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$98(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$82(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	move.w	#$8,$6C(a4)
	lea.l	TrapDoor_StateClosed(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
