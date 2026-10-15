; ---------------------------------------------------------------------------
; Tusk_HurtFlash - TUSK hit: sound $36, stop being hittable, flash for 50 frames
; In:  8(a6) = this
; Out: d0 = 0
; Evidence: called from Tusk_TakeDamage; List_Unlink(+$84); next Tusk_StateHurtFlash
; ---------------------------------------------------------------------------
Tusk_HurtFlash:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$36,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$36,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	pea.l	g_HitListEnemyBody(a5)
	move.l	$84(a4),-(a7)
	jsr	$406A(a5)	; -> List_Unlink
	moveq	#$0,d0
	move.l	d0,$84(a4)
	clr.b	$9A(a4)
	move.w	#$32,$6E(a4)
	lea.l	Tusk_StateHurtFlash(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$0,d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
