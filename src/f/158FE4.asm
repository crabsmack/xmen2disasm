; ---------------------------------------------------------------------------
; FluxBomb_StartHeld - Magneto's bomb: sound, animation, up to 45 frames of holding
; In:  8(a6) = bomb
; Out: d0 = +4 flag 8
; Evidence: +$6E = $2D, sound $7A, animation (jt $D8D0 thunk), state FluxBomb_StateHeld
; ---------------------------------------------------------------------------
FluxBomb_StartHeld:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$2D,$6E(a4)
	moveq	#$7A,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$7A,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	lea.l	$4782(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	lea.l	$10(a7),a7
	clr.w	$6C(a4)
	lea.l	FluxBomb_StateHeld(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
