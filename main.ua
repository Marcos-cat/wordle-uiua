# Experimental!
I ~ "../libs/iris/lib" ~ Color Draw Key T

Valid ← ⌵ ⊜∘⊸≠@\n&fras"./words.txt"
Word  ← ⌵ ⊜∘⊸≠@\n&fras"./answers.txt"

Width  ← 700
Height ← 900

Size   ← 70
Top    ← 50
Gap    ← 10
Side   ← ÷2 -×4Gap -×5Size Width
Margin ← ℂSide Top

Submit ← ⍜⊣(⍥(⊂:□"")=5⊸◇⧻)                                                             # ? Guesses
Clean  ← ▽⊸∊+@A⇡26 ⌵ ⍜⧻↧₅                                                              # ? Input
Print  ← Draw~Centered~Text White Size +ℂ.÷2 Size +Margin ×+Gap Size T~Grid ∵¤ ⬚@\s≡°□ # ? Guesses

# ? Guess Word
Colors ← (
  ⤚∩⌞⍜▽⋅@-◡=
  ◌∧(⊃(⨬◌⍜⊏⋅@-|⊂:⊙⋅⋅∘)×⊸⊓(≠@-|≠∞)⟜⊸⬚∞⊗) ⊙⊙[]
  ˜⊏ ≡Color~Hex "#3a3a3c"_"#b59f3b"_"#538d4e" +⊃×₂(×¬):
)

I~Open ℂWidth Height "Wordle"
I~Screen!°FPS 30

{""} "SIGMA"

I~Loop!(
  Draw~Background Color~Hex "#121213"

  Key!Pressed‼Enter Submit

  ◡(⍥(Draw~Square ⊙Size : +Margin ×+Gap Size T~Grid ≡⌟◇Colors)±⊸⧻ ↘₋₁)

  ⍜⊣⍚(Clean Key~Input)

  ⊸Print
)
