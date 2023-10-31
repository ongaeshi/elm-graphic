module Lesson1 exposing (main)

import GraphicSVG exposing (..)
import GraphicSVG.EllieApp exposing (GetKeyState,gameApp)

init = { time = 0 }

type Msg = Tick Float GetKeyState
  
update msg model =
    case msg of
        Tick t _ -> { model | time = t }

myShapes model = [
    triangle 40
        |> filled darkRed
        |> rotate (degrees 30)
        |> scaleY 0.7
    ,
    circle 20
        |> filled darkRed
        |> move (17, 24)
    ,
    circle 20
    |> filled darkRed
    |> move (-17, 24)
    ]

view model =
    collage 320 240 (myShapes model)

main =
    gameApp
        Tick
        { 
            model = init
        ,   view = view
        ,   update = update
        ,   title = "Ellie Example" -- This is the title of the browser window / tab
        }
