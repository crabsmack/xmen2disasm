; ---------------------------------------------------------------------------
; Exodus_StateNextAttack - EXODUS: run step +$A9 of attack pattern +$A8 (blasts in various directions or a swoop), or move to the next pattern
; In:  8(a6) = this
; Out: d0
; Evidence: nested switches; targets Exodus_AtkBlast*, Exodus_AtkSwoopA/B; Exodus_NextPattern when the pattern ends
; ---------------------------------------------------------------------------
Exodus_StateNextAttack:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.b	$A8(a4),d0
	cmpi.b	#$5,d0
	bhi.w	Exodus_StateNextAttack_part6
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	Sw_02CF04(pc,d1.w),d1
	jmp	Sw_02CF04-2(pc,d1.w)
