; ---------------------------------------------------------------------------
; LaserCannon_StateRetract - LaserCannon state: play the barrel-lower animation after a burst
; In:  8(a6) = this
; Out: d0 = flags & 8
; Evidence: Obj_ChangeAnim(Tbl_LaserCannonAnimRetract = frames 3-0), +$6C = $FF, +$5C = LaserCannon_StateReload
; ---------------------------------------------------------------------------
LaserCannon_StateRetract:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$38CA(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	addq.w	#$8,a7
	move.w	#$FF,$6C(a4)
	lea.l	LaserCannon_StateReload(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
