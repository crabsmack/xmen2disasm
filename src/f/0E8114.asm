; ---------------------------------------------------------------------------
; HoloBolt_StateB - HoloBolt second state: animation jt $292A, become active (clear +6 bit $4000), sound $CE, then StateC after 255 frames
; In:  8(a6) = this
; Out: d0 = flags & 8
; Evidence: Snd_Stop/Snd_Play($CE)
; ---------------------------------------------------------------------------
HoloBolt_StateB:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$272A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	andi.w	#$BFFF,$6(a4)
	pea.l	($CE).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($CE).w
	jsr	$521A(a5)	; -> Snd_Play
	lea.l	$10(a7),a7
	move.w	#$FF,$6C(a4)
	lea.l	HoloBolt_StateC(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
