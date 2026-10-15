; ---------------------------------------------------------------------------
; Apocalypse_StateDefeated - APOCALYPSE defeated: stop being hittable, float to the centre (256, 96) with the defeat animation
; In:  8(a6) = this
; Out: d0 = +4 & 8
; Evidence: List_Unlink(+$84, $FFEBAE); Apocalypse_MoveTo($10000, $6000, 5); Obj_ChangeAnim jt $4B0FC; next Apocalypse_StateDefeatedWait
; ---------------------------------------------------------------------------
Apocalypse_StateDefeated:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	ori.w	#$2,$6(a4)
	pea.l	g_HitListEnemyBody(a5)
	move.l	$84(a4),-(a7)
	jsr	$406A(a5)	; -> List_Unlink
	moveq	#$0,d0
	move.l	d0,$84(a4)
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	moveq	#$5,d0
	move.l	d0,-(a7)
	pea.l	($6000).w
	move.l	#$10000,-(a7)
	move.l	a4,-(a7)
	jsr	Apocalypse_MoveTo(pc)
	lea.l	$9CA(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	lea.l	$20(a7),a7
	clr.w	$6C(a4)
	lea.l	Apocalypse_StateDefeatedWait(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
