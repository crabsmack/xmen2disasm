; ---------------------------------------------------------------------------
; sub_0C130A	[jt 1119]
; ---------------------------------------------------------------------------
sub_0C130A:
	link.w	a6,#$0
	jsr	sub_0C0DBA(pc)
	jsr	sub_0C1258(pc)
	jsr	sub_0C0EE0(pc)
	jsr	$5242(a5)	; -> Snd_StopAll
	moveq	#$47,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$47,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	moveq	#$51,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$51,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	moveq	#$48,d0
	move.l	d0,-(a7)
	jsr	sub_0C1478(pc)
	jsr	$21F2(a5)	; -> sub_0BF898
	jsr	sub_0C12DE(pc)
	jsr	sub_0C0ED4(pc)
	jsr	sub_0C12F6(pc)
	pea.l	($282).w
	pea.l	($282).w
	moveq	#$0,d0
	move.l	d0,-(a7)
	jsr	sub_0C0DC2(pc)
	jsr	$5002(a5)	; -> sub_1FA6FE
	jsr	sub_0C14B4(pc)
	unlk	a6
	rts
