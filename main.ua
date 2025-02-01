# Experimental!
I ~ "../libs/iris/lib" ~ Draw Key T

Valid ← ⌵ ⊜∘⊸≠@\n&fras"./words.txt"
Word  ← ⌵ ⊜∘⊸≠@\n&fras"./answers.txt"

Hex    ← I~Color~Hex
Yellow ← Hex "#b59f3b"
Green  ← Hex "#538d4e"
Gray   ← Hex "#3a3a3c"
Black  ← Hex "#121213"

Width  ← 700
Height ← 900
Size   ← 100
Gap    ← 20
Margin ← ÷₂ -×₄Gap -×₅Size Width
Top    ← 40

Pos    ← +ℂMargin Top ×+Size Gap
Write  ← Draw!⬚Centered Text White ×0.8Size +˙ℂ÷₂Size Pos °T~Coords
Square ← Draw~Square ⊙(Size Pos)

I~Open ℂWidth Height "Wordle"
I~Screen!°FPS 30

{""}

I~Loop!(
  Draw~Background Black

  ⍜⊣⍚(▽⊸∊+@A⇡26⍜⧻↧₅⌵ Key~Input)

  # Key!Pressed‼Enter Submit

  ⊸⊃(
    Write °⊡ ∵□ ⬚@ ≡°□
  | Square ⊢ ⊙(∵₁/ℂ⇡5_5) ¤Green
  )
)
