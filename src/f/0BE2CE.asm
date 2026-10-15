; ---------------------------------------------------------------------------
; Barbarian_StateAttack - BARBARIAN state: attack (sound $AC) - cycle through five attack animations (+$BE)
; In:  8(a6) = this
; Out: d0
; Evidence: 5-case switch -> Barbarian_StateAttack0..4; TAS 28451-33093
; Found: link-after-rts
; ---------------------------------------------------------------------------
Barbarian_StateAttack:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	pea.l	($AC).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($AC).w
	jsr	$521A(a5)	; -> Snd_Play
	addq.b	#$1,$BE(a4)
	move.b	$BE(a4),d0
	cmpi.b	#$4,d0
	addq.w	#$8,a7
	bhi.s	Barbarian_StateAttack_Reset
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	Sw_0BE2CE(pc,d1.w),d1
	jmp	Sw_0BE2CE-2(pc,d1.w)
