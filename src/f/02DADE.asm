; ---------------------------------------------------------------------------
; Exodus_TakeDamage - 90-frame blinking cooldown, sound $D8, health -= damage (floor 0); at 0 (no exit pending) Scene_EndAfter(40) and the death effect picked by +$A6 (Kill, ExplodeFx_BurstMedium/BurstSmall/Bounce/TrailArc); otherwise at health <= 10 / <= 20 switch once to Exodus_AtkSwoopB / Exodus_AtkSwoopA (EXODUS override of slot +$26 TakeDamage; does not call the parent)
; In:  8(a6) = this (EXODUS object), $C(a6) = attacker, $17(a6) = byte damage
; Out: none
; Evidence: class descriptor EXODUS slot +$26 (tools/classes.py); switch Sw_02DADE and Exodus_TakeDamage_part1-5; TAS frames 17303-18216 (4 active)
; ---------------------------------------------------------------------------
Exodus_TakeDamage:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$5A,$6A(a4)
	move.b	$6B(a4),$A7(a4)
	ori.w	#$40,$6(a4)
	pea.l	($DF).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($D8).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($D8).w
	jsr	$521A(a5)	; -> Snd_Play
	move.b	$17(a6),d0
	ext.w	d0
	sub.w	d0,$68(a4)
	tst.w	$68(a4)
	lea.l	$C(a7),a7
	bge.s	loc_02DB2A
	clr.w	$68(a4)
loc_02DB2A:
	tst.w	$68(a4)
	bne.s	Exodus_TakeDamage_part5
	tst.w	g_SceneExitTimer(a5)
	bne.s	Exodus_TakeDamage_part5
	moveq	#$28,d0
	move.l	d0,-(a7)
	jsr	$4F8A(a5)	; -> Scene_EndAfter
	move.b	$A6(a4),d0
	cmpi.b	#$4,d0
	addq.w	#$4,a7
	bhi.s	Exodus_TakeDamage_part1
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	Sw_02DADE(pc,d1.w),d1
	jmp	Sw_02DADE-2(pc,d1.w)
