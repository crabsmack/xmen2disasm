; ---------------------------------------------------------------------------
; Actor_StateFallDead - state function: fall off screen after death (integrate velocity and acceleration with no collision, re-arm itself every frame)
; In:  8(a6) = this
; Out: d0 = +4 flag 8
; Evidence: x += vx, y += vy, vx += ax, vy += ay; +$6C = 0; +$5C = itself; installed by Actor_StateHurt when health <= 0
; ---------------------------------------------------------------------------
Actor_StateFallDead:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$16(a4),d0
	ext.l	d0
	add.l	d0,$8(a4)
	move.w	$18(a4),d0
	ext.l	d0
	add.l	d0,$C(a4)
	move.w	$1E(a4),d0
	add.w	d0,$16(a4)
	move.w	$20(a4),d0
	add.w	d0,$18(a4)
	clr.w	$6C(a4)
	lea.l	Actor_StateFallDead(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
