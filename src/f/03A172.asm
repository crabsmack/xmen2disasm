; ---------------------------------------------------------------------------
; BanimazaDoor_Shatter - BANIMAZADOOR destroyed: sound $35, hide, stop being hittable and solid, throw debris away from the attacker
; In:  8(a6) = this
; Out: d0 = 0
; Evidence: called from BanimazaDoor_TakeDamage; List_Unlink(+$84); segment flag $40 set; BanimazaDoor_InitDebris(+$8C, +$90, ...); next BanimazaDoor_StateShattered
; ---------------------------------------------------------------------------
BanimazaDoor_Shatter:
	link.w	a6,#$0
	movem.l	d3/d7/a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$92(a4),a0
	move.l	$8(a0),d0
	cmp.l	$8(a4),d0
	sgt.b	d3
	neg.b	d3
	move.b	d3,d7
	moveq	#$35,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$35,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	ori.w	#$4000,$6(a4)
	pea.l	g_HitListEnemyBody(a5)
	move.l	$84(a4),-(a7)
	jsr	$406A(a5)	; -> List_Unlink
	moveq	#$0,d0
	move.l	d0,$84(a4)
	moveq	#$0,d1
	move.b	$7A(a4),d1
	ext.l	d1
	lsl.l	#$2,d1
	move.l	d1,d2
	lsl.l	#$2,d1
	add.l	d2,d1
	lea.l	g_Segs(a5),a0
	ori.b	#$40,(a0,d1.w)
	moveq	#$0,d0
	move.b	d7,d0
	move.l	d0,-(a7)
	move.w	$98(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,-(a7)
	move.w	$96(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,-(a7)
	move.w	$90(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	$8C(a4),-(a7)
	jsr	BanimazaDoor_InitDebris(pc)
	lea.l	BanimazaDoor_StateShattered(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$0,d0
	movem.l	-$C(a6),d3/d7/a4
	unlk	a6
	rts
