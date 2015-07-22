#lang s-exp framework/keybinding-lang
(keybinding "tab" (λ (editor event) (send editor auto-complete)))