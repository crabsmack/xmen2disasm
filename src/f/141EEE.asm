; ---------------------------------------------------------------------------
; TankLeft_ActWaitDrive - tank script action: wait the pause time, then drive (Tank_StateWaitDrive)
; In:  8(a6) = this
; Out: d0 = +4 flag 8
; Evidence: +$6E = +$A0, state TankLeft_StateWaitDrive
; ---------------------------------------------------------------------------
TankLeft_ActWaitDrive:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$A0(a4),$6E(a4)
	clr.w	$6C(a4)
	lea.l	TankLeft_StateWaitDrive(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
