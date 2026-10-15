; ---------------------------------------------------------------------------
; Tuskette_StateHitTarget - TUSKETTE chaser: hit the target (sub_13DE4A)
; In:  8(a6) = this
; Out: none
; Evidence: single call
; ---------------------------------------------------------------------------
Tuskette_StateHitTarget:
	link.w	a6,#$0
	move.l	$8(a6),-(a7)
	jsr	$3AD2(a5)	; -> sub_13DE4A
	unlk	a6
	rts
