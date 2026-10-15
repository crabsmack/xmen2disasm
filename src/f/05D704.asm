; ---------------------------------------------------------------------------
; Tuskette_StateHitTarget - TUSKETTE chaser: hit the target (ExplodeFx_BurstSmall)
; In:  8(a6) = this
; Out: none
; Evidence: single call
; ---------------------------------------------------------------------------
Tuskette_StateHitTarget:
	link.w	a6,#$0
	move.l	$8(a6),-(a7)
	jsr	$3AD2(a5)	; -> ExplodeFx_BurstSmall
	unlk	a6
	rts
