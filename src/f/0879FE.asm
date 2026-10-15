; ---------------------------------------------------------------------------
; BroodBoss_StateHurt - BROODBOSS hurt state (+$60): sound $37, unhittable, flash palette line 2, hurt animation; defeated at 0 health
; In:  8(a6) = this
; Out: d0
; Evidence: set by BroodBoss_Init as +$60 (ACTOR TakeDamage switches to it); saves palette line 2 to $FFEE58 and writes a bright palette (unless already); health +$68 < 1 -> BroodBoss_Defeat; +$6A = $1E; animation $088A1C; next BroodBoss_StateHurtEnd
; Found: link-after-rts
; ---------------------------------------------------------------------------
BroodBoss_StateHurt:
	link.w	a6,#$0
	movem.l	d3/d7/a3-a4,-(a7)
	lea.l	-$13A8(a5),a3
	lea.l	g_PalBase+$40(a5),a4
	movea.l	$8(a6),a0
	ori.w	#$2,$6(a0)
	moveq	#$37,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$37,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	pea.l	g_HitListEnemyBody(a5)
	movea.l	$8(a6),a0
	move.l	$84(a0),-(a7)
	jsr	$406A(a5)	; -> List_Unlink
	movea.l	$8(a6),a0
	moveq	#$0,d0
	move.l	d0,$84(a0)
	movea.l	$8(a6),a0
	tst.l	$96(a0)
	lea.l	$10(a7),a7
	beq.s	loc_087A72
	movea.l	$96(a0),a0
	clr.w	$16(a0)
	movea.l	$8(a6),a0
	movea.l	$96(a0),a0
	clr.b	$90(a0)
	movea.l	$8(a6),a0
	movea.l	$96(a0),a0
	moveq	#$0,d0
	move.l	d0,$92(a0)
loc_087A72:
	cmpi.w	#$424,g_PalBase+$44(a5)
	beq.s	loc_087ACA
	clr.b	d7
	moveq	#$10,d3
loc_087A7E:
	move.w	(a4)+,(a3)+
	move.b	d7,d0
	addq.b	#$1,d7
	cmp.b	d7,d3
	bgt.s	loc_087A7E
	lea.l	g_PalBase+$44(a5),a4
	move.w	#$424,(a4)+
	move.w	#$646,(a4)+
	move.w	#$848,(a4)+
	move.w	#$A6A,(a4)+
	move.w	#$C8C,(a4)+
	move.w	#$EAE,(a4)+
	move.w	#$ECE,(a4)+
	move.w	#$EEE,(a4)+
	move.w	#$464,(a4)+
	move.w	#$486,(a4)+
	move.w	#$6CA,(a4)+
	move.w	#$8EE,(a4)+
	move.w	#$E6E,(a4)+
	move.w	#$426,(a4)+
	move.b	#$1,g_PalBaseDirty(a5)
loc_087ACA:
	movea.l	$8(a6),a0
	tst.w	$68(a0)
	bgt.s	loc_087ADC
	move.l	a0,-(a7)
	jsr	BroodBoss_Defeat(pc)
	addq.w	#$4,a7
loc_087ADC:
	movea.l	$8(a6),a0
	move.w	#$1E,$6A(a0)
	lea.l	$149A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	$8(a6),-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	addq.w	#$8,a7
	movea.l	$8(a6),a0
	move.w	#$5,$6C(a0)
	lea.l	BroodBoss_StateHurtEnd(pc),a0
	movea.l	$8(a6),a1
	move.l	a0,$5C(a1)
	movea.l	$8(a6),a0
	moveq	#$8,d0
	and.w	$4(a0),d0
	movem.l	-$10(a6),d3/d7/a3-a4
	unlk	a6
	rts
