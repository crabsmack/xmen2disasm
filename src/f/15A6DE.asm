; ---------------------------------------------------------------------------
; AiScript_Set - point an object's AI script cursor at a script table and rewind it
; In:  8(a6) = script cursor {word index; long table} (null ignored)   $C(a6) = script table (word count, then 4-byte jmp thunks)
; Out: none
; Evidence: cursor+0 = 0, cursor+2 = table; 71 callers, mostly class Init methods passing &obj+$8C or +$96 and a jt-exported table (NOTES AI scripts)
; ---------------------------------------------------------------------------
AiScript_Set:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,d0
	beq.s	loc_15A6F4
	clr.w	(a4)
	move.l	$C(a6),$2(a4)
loc_15A6F4:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
