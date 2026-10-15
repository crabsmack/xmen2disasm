; ---------------------------------------------------------------------------
; TrapDoor_StateArm - TRAPDOOR state: re-arm (clear +6 bit $1000)
; In:  8(a6) = this
; Out: d0
; Evidence: next TrapDoor_StateWaitPlayer; 2 callers
; Found: link-after-rts
; ---------------------------------------------------------------------------
TrapDoor_StateArm:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	andi.w	#$EFFF,$6(a4)
	clr.w	$6C(a4)
	lea.l	TrapDoor_StateWaitPlayer(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
