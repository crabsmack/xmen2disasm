; ---------------------------------------------------------------------------
; Scroll_Init - reset all scroll/camera state and set the plane size to 64x32 cells
; In:  none
; Out: none
; Evidence: VDP reg $90 = 1; clears the scroll request flags -$3A56..-$3A5C and ~40 camera/scroll words in -$3AD8..-$3490; called last by Sys_InitHardware
; ---------------------------------------------------------------------------
Scroll_Init:
	link.w	a6,#$0
	movem.l	d6-d7,-(a7)
	move.w	#$9001,($C00004).l
	clr.b	-$3AB2(a5)
	clr.b	-$3ABA(a5)
	clr.b	-$3AB8(a5)
	clr.b	-$3AC0(a5)
	clr.w	-$3ABC(a5)
	clr.w	-$3ABE(a5)
	clr.b	-$3A56(a5)
	clr.b	-$3A58(a5)
	clr.b	-$3A5A(a5)
	clr.b	-$3A5C(a5)
	move.w	#$100,-$3492(a5)
	move.w	#$100,-$3494(a5)
	clr.w	-$3496(a5)
	clr.w	-$3498(a5)
	clr.w	-$349A(a5)
	clr.w	-$349E(a5)
	clr.w	-$349C(a5)
	clr.w	-$34A0(a5)
	clr.w	-$348E(a5)
	clr.w	-$3490(a5)
	clr.w	-$3A5E(a5)
	clr.w	-$3A60(a5)
	clr.w	-$3A8E(a5)
	clr.w	-$3A96(a5)
	clr.w	-$3A90(a5)
	clr.w	-$3A98(a5)
	clr.w	-$3A92(a5)
	clr.w	-$3A9A(a5)
	clr.w	-$3A94(a5)
	clr.w	-$3A9C(a5)
	move.w	-$348E(a5),d6
	move.w	d6,-$3AC2(a5)
	move.w	-$3490(a5),d7
	move.w	d7,-$3AC4(a5)
	move.w	d6,-$3AC6(a5)
	move.w	d7,-$3AC8(a5)
	clr.w	-$3ACA(a5)
	clr.w	-$3ACC(a5)
	clr.w	-$3ACE(a5)
	clr.w	-$3AD0(a5)
	clr.w	-$3AD2(a5)
	clr.w	-$3AD4(a5)
	clr.w	-$3AD6(a5)
	clr.w	-$3AD8(a5)
	clr.w	-$3A6E(a5)
	clr.w	-$3A78(a5)
	move.w	#$1,-$3A9E(a5)
	clr.b	-$3A64(a5)
	clr.b	-$3AB4(a5)
	clr.b	-$3AB6(a5)
	clr.b	-$3A62(a5)
	movem.l	-$8(a6),d6-d7
	unlk	a6
	rts
