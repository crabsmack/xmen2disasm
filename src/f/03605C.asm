; ---------------------------------------------------------------------------
; MagnetoBoss_ClassInit - per-level class setup: SprDef_Add sprite set jt $822 into -$3CAC, keep the class index in -$3CAE and Mem_StackAlloc a $800-byte buffer into g_ClassData[class index] (MAGNETOBOSS override of slot +$5E ClassInit)
; In:  8(a6) = this, $C(a6) = class index
; Out: none
; Evidence: class descriptor MAGNETOBOSS slot +$5E (tools/classes.py); TAS frames 18539-18539 (1 active)
; ---------------------------------------------------------------------------
MagnetoBoss_ClassInit:
	link.w	a6,#$0
	move.l	d7,-(a7)
	move.w	$E(a6),d7
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$822(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> SprDef_Add
	move.w	d0,g_MagnetoBossSprDef(a5)
	move.w	d7,-$3CAE(a5)
	pea.l	Str_Empty_0360A4(pc)
	pea.l	($800).w
	jsr	$5032(a5)	; -> Mem_StackAlloc
	ext.l	d7
	movea.l	g_ClassData(a5),a0
	move.l	d7,d1
	asl.l	#$2,d1
	move.l	d0,(a0,d1.l)
	lea.l	$10(a7),a7
	move.l	-$4(a6),d7
	unlk	a6
	rts
