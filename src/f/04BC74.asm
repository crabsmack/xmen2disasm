; ---------------------------------------------------------------------------
; Apocalypse_ActPickScript - APOCALYPSE script action: switch to one of four AI scripts by +$B1 (jt $C1A, $4B240, $C2A, $C32)
; In:  8(a6) = this
; Out: none
; Evidence: AiScript_Set(+$A2, ...); first step at once
; ---------------------------------------------------------------------------
Apocalypse_ActPickScript:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.b	$B1(a4),d0
	cmpi.b	#$3,d0
	bhi.s	Apocalypse_ActPickScript_part1
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	Sw_04BC74(pc,d1.w),d1
	jmp	Sw_04BC74-2(pc,d1.w)
