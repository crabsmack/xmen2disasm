; ---------------------------------------------------------------------------
; LaserCannon_StateExtend - LaserCannon state: play the barrel-raise animation before a burst
; In:  8(a6) = this
; Out: d0 = flags & 8
; Evidence: Obj_ChangeAnim(Tbl_LaserCannonAnimExtend = frames 0-3), +$6C = $FF, +$5C = LaserCannon_StateLoadBurst
; ---------------------------------------------------------------------------
LaserCannon_StateExtend:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$38C2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	addq.w	#$8,a7
	move.w	#$FF,$6C(a4)
	lea.l	LaserCannon_StateLoadBurst(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
