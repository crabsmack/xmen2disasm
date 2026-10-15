; ---------------------------------------------------------------------------
; Tuskette_StateExitDrop2 - TUSKETTE: drop again (vy $200, gravity 10)
; In:  8(a6) = this
; Out: d0 = +4 & 8
; Evidence: next Tuskette_StateExitFall2
; ---------------------------------------------------------------------------
Tuskette_StateExitDrop2:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$200,$18(a4)
	move.w	#$A,$20(a4)
	clr.w	$6C(a4)
	lea.l	Tuskette_StateExitFall2(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
