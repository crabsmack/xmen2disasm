; ---------------------------------------------------------------------------
; SavageMediumBio_StateAppear - SAVAGEMEDIUMBIO first state: appear (sound $F2, animation jt[$2032])
; In:  8(a6) = this
; Out: d0
; Evidence: next SavageMediumBio_StateReady; TAS 33560
; Found: link-after-rts
; ---------------------------------------------------------------------------
SavageMediumBio_StateAppear:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	pea.l	($F2).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($F2).w
	jsr	$521A(a5)	; -> Snd_Play
	lea.l	$1E32(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	lea.l	$10(a7),a7
	move.w	#$FF,$6C(a4)
	lea.l	SavageMediumBio_StateReady(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
