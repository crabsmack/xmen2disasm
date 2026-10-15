; ---------------------------------------------------------------------------
; FlyBrood_ActHover90 - FLYBROOD script action: hover in place (MovePath) for 90 frames facing the player
; In:  8(a6) = this
; Out: d0 = flags & 8
; Evidence: next FlyBrood_StateHoverFacePlayer
; ---------------------------------------------------------------------------
FlyBrood_ActHover90:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	FlyBrood_MovePath(pc),a0
	move.l	a0,$9E(a4)
	lea.l	$36EA(a5),a0
	move.l	$2(a0),$A2(a4)
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.w	d0,$9A(a4)
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.w	d0,$9C(a4)
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	move.w	#$5A,$6E(a4)
	clr.w	$6C(a4)
	lea.l	FlyBrood_StateHoverFacePlayer(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
