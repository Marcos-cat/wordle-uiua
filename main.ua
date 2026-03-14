# Experimental!
I ~ "git: github.com/Marcos-cat/iris" ~ Color Draw Key T

Valid  ← ⌵ ≡(▽¬⊸=@\r) ⊜∘⊸≠@\n&fras"words.txt"
Word   ← ⌵ ≡(▽¬⊸=@\r) ⊜∘⊸≠@\n&fras"answers.txt"
Width  ← 700
Height ← ×1.3Width
Font   ← "RobotoMono-Medium.ttf"
Size   ← ×0.1Width
Top    ← ×0.1Height
Gap    ← ×0.2Size
Side   ← ÷2 -×4Gap -×5Size Width
Pos    ← +˙ℂ÷2 Size +ℂSide Top ×+Gap Size /˜ℂ°⍉⇡△₂

Submit ← ⍜⊣(⍥(˜⊂□"")×⊃(=5⧻|∊Valid)⊸°□)
Clean  ← ▽⊸∊+@A⇡26 ⌵ ⍜⧻↧₅
Print  ← Draw~Text!(°⊸Centered1 °⊸Font) Font White ×1.2Size⊸Pos ≡₀¤ ⬚@\s≡°□
Colors ← (
  ⬚@\s↙◡⋅⧻
  ⍥÷₂˜∊@\s ⟜(
    +=@-˜∧(⍜▽(⍥⍜⊢⋅@-±⊸⧻)⊸=) ⤚∩⌞⍜▽⋅@-◡=
    ˜⊏ Color~Hex "#3a3a3c"_"#b59f3b"_"#538d4e"
  )
)
Squares ← Draw~Square!°⊸Centered1 ⊙Size ⟜Pos ≡⌟◇Colors ⬚""↙6 ↘₋₁
Message ← Draw~Text!(°⊸Centered1 °⊸Font) Font White ×0.7Size ÷2ℂWidth Top

Won     ← ◇≍⬚""⊣↘₋₁
Lost    ← ×⊃(>6⧻|¬Won)
Playing ← ×⊃(¬Lost|¬Won)

New ← {""} (⊢°⍆Word)

I~Open ℂWidth Height "Wordle"
I~Window!°FPS 30

New

I~Loop!(
  Draw~Background "#121213"

  Key!Pressed‼Enter Submit
  ⍥⍜⊣⍚(Clean Key~Input)◡Playing

  Draw~Text!°⊸Font Font White ×0.5Size ℂ÷2Side -Size Height "Ctrl+R to Restart"
  ⍥⋅⋅New /× Key~Down {Key~LeftControl @R}

  ◡⊃(
    Print | Squares
  | ⍥(Message "You Guessed It!") Won
  | ⍥(Message ⊂"The Word Was ") ⊸Lost
  )
)
