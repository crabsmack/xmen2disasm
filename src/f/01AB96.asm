; ---------------------------------------------------------------------------
; Tower_StateIdle - TOWER state: do nothing, re-arm itself every 255 frames
; In:  8(a6) = this
; Out: d0 = +4 & 8
; Evidence: installed by Tower_Init; +$6C = $FF, +$5C = itself
; ---------------------------------------------------------------------------
Tower_StateIdle:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$FF,$6C(a4)
	lea.l	Tower_StateIdle(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
