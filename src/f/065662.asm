; ---------------------------------------------------------------------------
; Cerebro_TextOpPlaySound - text script ops 5/6: play or stop sound N
; In:  a4 = script pointer
; Out: none
; Evidence: cases 5 and 6 of Sw_065532: jt $521A (Snd_Play) / jt $5222 (Snd_Stop) with the word argument
; ---------------------------------------------------------------------------
Cerebro_TextOpPlaySound:
	move.w	(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> sub_1FE584
	addq.l	#$2,a4
	addq.w	#$4,a7
	bra.s	loc_06569A
Cerebro_TextOpStopSound:
	move.w	(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> sub_1FE5A2
	addq.l	#$2,a4
	addq.w	#$4,a7
	bra.s	loc_06569A
