# Experimental!
I ~ "git:https://github.com/Marcos-cat/iris" ~ Color Draw Key T

Valid ← ⌵ ⊜∘⊸≠@\n&fras"./words.txt"
Word  ← ⌵ ⊜∘⊸≠@\n&fras"./answers.txt"

Width  ← 700
Height ← 900

Size ← 70
Top  ← 120
Gap  ← 10
Side ← ÷2 -×4Gap -×5Size Width
Pos  ← +˙ℂ÷2 Size +ℂSide Top ×+Gap Size T~Grid

Submit ← ⍜⊣(⍥(⊂:□"")×⊃(=5⧻|∊Valid)⊸°□)                # ? Guesses
Clean  ← ▽⊸∊+@A⇡26 ⌵ ⍜⧻↧₅                             # ? Input
Print  ← Draw~Centered~Text White Size Pos ∵¤ ⬚@\s≡°□ # ? Guesses
# ? Guess Word
Colors ← (
  ⤚∩⌞⍜▽⋅@-◡=
  ◌∧(⊃(⨬◌⍜⊏⋅@-|⊂:⊙⋅⋅∘)×⊸⊓(≠@-|≠∞)⟜⊸⬚∞⊗) ⊙⊙[]
  ˜⊏ Color~Hex "#3a3a3c"_"#b59f3b"_"#538d4e" +⊃×₂(×¬):
)
Squares ← ⍥(Draw~Centered~Square ⊙Size : Pos ≡⌟◇Colors)±⊸⧻↘₋₁
Message ← Draw~Centered~Text White ×0.7Size ÷2ℂWidth Top

Won  ← ◇≍⬚""⊣↘₋₁
Lost ← ×⊃(>6⧻|¬Won)

New ← {""} (⊢°⍆Word)

I~Open ℂWidth Height "Wordle"
I~Screen!°FPS 30

New

I~Loop!(
  Draw~Background Color~Hex "#121213"

  Key!Pressed‼Enter Submit
  ⍥⍜⊣⍚(Clean Key~Input)×◡⊃(¬Lost|¬Won)

  Draw~Text White ×0.3Size ℂ÷2Side -Size Height "Ctrl-r to Restart"
  ⍥⋅⋅New /× Key~Down {Key~LeftControl @R}

  ◡⊃(
    Print
  | Squares
  | ⍥(Message "You Guessed It!") Won
  | ⍥(Message ⊂"The Word Was ") ⊃Lost⋅∘
  )
)
