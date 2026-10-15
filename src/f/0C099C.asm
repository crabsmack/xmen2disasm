; ---------------------------------------------------------------------------
; SwampFly_StatePickPath - SWAMPFLY state: target the nearest player and start the flight path for its type +$B2 (6 tables)
; In:  8(a6) = this
; Out: d0
; Evidence: paths $0C00D6/$0C0312/$0C050C/$0C064A/$0C0788/jt[$24B2] {word count; byte dx, dy pairs}; starts halfway; next SwampFly_StateFly; switch Sw_0C099C
; Found: link-after-rts
; ---------------------------------------------------------------------------
SwampFly_StatePickPath:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	$4EAA(a5)	; -> Player_Nearest
	move.l	d0,$96(a4)
	move.b	$B2(a4),d0
	cmpi.b	#$5,d0
	addq.w	#$4,a7
	bhi.s	SwampFly_StatePickPath_Default
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	Sw_0C099C(pc,d1.w),d1
	jmp	Sw_0C099C-2(pc,d1.w)
