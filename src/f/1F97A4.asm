; ---------------------------------------------------------------------------
; Music_Play - switch the music to track N (stop everything, command $20 $0A, play N) and remember it
; In:  8(a6) = word: track id ($FFFF = only record, play nothing)
; Out: none
; Evidence: stores the id in word -$38D2(a5); if not -1: Snd_StopAll, unk_Snd_1FE5B4($A), Snd_Play(id)
; ---------------------------------------------------------------------------
Music_Play:
	link.w	a6,#$0
	move.l	d7,-(a7)
	move.w	$A(a6),d7
	move.w	d7,-$38D2(a5)
	moveq	#-$1,d0
	cmp.w	-$38D2(a5),d0
	beq.s	loc_1F97D6
	jsr	$5242(a5)	; -> Snd_StopAll
	moveq	#$A,d0
	move.l	d0,-(a7)
	jsr	$522A(a5)	; -> unk_Snd_1FE5B4
	move.w	d7,-$38D2(a5)
	move.w	d7,d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	addq.w	#$8,a7
loc_1F97D6:
	move.l	-$4(a6),d7
	unlk	a6
	rts
