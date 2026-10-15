; ---------------------------------------------------------------------------
; Launcher_StateFrame1 - LAUNCHER state: frame 1 for +$8C frames
; In:  8(a6) = this
; Out: d0
; Evidence: next Launcher_StateFire
; Found: link-after-rts
; ---------------------------------------------------------------------------
Launcher_StateFrame1:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	moveq	#$0,d0
	move.b	$8C(a4),d0
	cmpi.w	#$FFFF,d0
	addq.w	#$8,a7
	bne.s	loc_0BE926
	lea.l	Launcher_StateFire(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	Launcher_StateFire(pc)
	addq.w	#$4,a7
	bra.s	loc_0BE93E
loc_0BE926:
	moveq	#$0,d0
	move.b	$8C(a4),d0
	move.w	d0,$6C(a4)
	lea.l	Launcher_StateFire(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0BE93E:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
