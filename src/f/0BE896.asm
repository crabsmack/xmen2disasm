; ---------------------------------------------------------------------------
; Launcher_StateFrame0 - LAUNCHER state: frame 0 for +$8B frames
; In:  8(a6) = this
; Out: d0
; Evidence: next Launcher_StateFrame1
; Found: link-after-rts
; ---------------------------------------------------------------------------
Launcher_StateFrame0:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	moveq	#$0,d0
	move.b	$8B(a4),d0
	cmpi.w	#$FFFF,d0
	addq.w	#$8,a7
	bne.s	loc_0BE8CE
	lea.l	Launcher_StateFrame1(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	Launcher_StateFrame1(pc)
	addq.w	#$4,a7
	bra.s	loc_0BE8E6
loc_0BE8CE:
	moveq	#$0,d0
	move.b	$8B(a4),d0
	move.w	d0,$6C(a4)
	lea.l	Launcher_StateFrame1(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0BE8E6:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
