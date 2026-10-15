; ---------------------------------------------------------------------------
; CoreShields_StateAllDown - CoreShields: all 8 shields are gone: camera shake, start the hologram's death, explosion
; In:  8(a6) = this
; Out: none
; Evidence: g_CamShake, Hologram_BeginDying, ExplodeFx_ChainRepeat explosion; TAS frame 9083
; ---------------------------------------------------------------------------
CoreShields_StateAllDown:
	link.w	a6,#$0
	lea.l	$2632(a5),a0
	move.l	$2(a0),g_CamShake(a5)
	jsr	$274A(a5)	; -> Hologram_BeginDying
	moveq	#$4,d0
	move.l	d0,-(a7)
	moveq	#-$10,d1
	move.l	d1,-(a7)
	move.l	d1,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$28AA(a5),a0
	move.l	$2(a0),-(a7)
	move.l	$8(a6),-(a7)
	jsr	$3AFA(a5)	; -> ExplodeFx_ChainRepeat
	unlk	a6
	rts
