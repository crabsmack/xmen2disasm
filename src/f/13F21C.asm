; ---------------------------------------------------------------------------
; Pop_FxChainPath - POP state, type 4: chain explosion along the path at jt 1963 ($144F2E), damaging when +$70 is set
; In:  8(a6) = this
; Out: none
; Evidence: ExplodeFx_Chain(this, jt $3D7A data, +$70, 0, 0)
; ---------------------------------------------------------------------------
Pop_FxChainPath:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.b	$70(a4),d1
	ext.w	d1
	ext.l	d1
	move.l	d1,-(a7)
	lea.l	$3D7A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	ExplodeFx_Chain(pc)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
