; ---------------------------------------------------------------------------
; CloneA2_BgPalTask_Case0 - switch cases of CloneA2_BgPalTask: select background palette 0-3 (jt[549]/[548]/[547]/[546])
; Evidence: targets of the 4-entry switch at $081FAC; fall into CloneA2_BgPalTask_Copy
; ---------------------------------------------------------------------------
CloneA2_BgPalTask_Case0:
	lea.l	$114A(a5),a0
	movea.l	$2(a0),a4
	bra.s	CloneA2_BgPalTask_Copy
loc_081FBE:
	lea.l	$1142(a5),a0
	movea.l	$2(a0),a4
	bra.s	CloneA2_BgPalTask_Copy
loc_081FC8:
	lea.l	$113A(a5),a0
	movea.l	$2(a0),a4
	bra.s	CloneA2_BgPalTask_Copy
loc_081FD2:
	lea.l	$1132(a5),a0
	movea.l	$2(a0),a4
