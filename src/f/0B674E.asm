; ---------------------------------------------------------------------------
; BrainBabyBio_Init - vtable +$12 constructor: run the parent's Init, then set up a BRAINBABYBIO
; In:  8(a6) = this, $C(a6) = long x, $10(a6) = long y (8 fraction bits), $14(a6) = spawn parameter
; Evidence: slot +$12 of the BRAINBABYBIO descriptor $0B7B1C; TAS frames 33537-33537 (1 frames active); calls parent BABYBIO slot +$12
; ---------------------------------------------------------------------------
BrainBabyBio_Init:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$14(a6),-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$1D7A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	jsr	sub_0B7B14(pc)
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$3,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
	move.w	#$60,$AC(a4)
	move.w	#$220,$AE(a4)
	move.w	#$60,$B2(a4)
	move.w	#$140,$B0(a4)
	movea.l	-$3B14(a5),a0
	move.b	#$4,$2(a0)
	movea.l	-$3B14(a5),a0
	move.l	a0,$8C(a4)
	moveq	#$0,d0
	move.b	$2(a0),d0
	move.w	d0,$68(a4)
	lea.l	$1DA2(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$96(a4)
	jsr	$3ED2(a5)	; -> AiScript_Set
	lea.l	sub_0B68B8(pc),a0
	move.l	a0,$64(a4)
	move.l	a0,$5C(a4)
	ori.w	#$1000,$6(a4)
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.w	d0,$BC(a4)
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.w	d0,$BE(a4)
	moveq	#$4,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	move.l	a4,-(a7)
	jsr	$4DD2(a5)	; -> Obj_UpdateBoxes
	moveq	#$46,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$46,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	move.l	a4,-$3B20(a5)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
