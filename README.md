# tictactoe

This is an app built with flutter

It has a homepage, a gamepage and a win/lose screen.

I have used Material UI for the design.

<img src="https://user-images.githubusercontent.com/68557696/117224899-b1d22500-ae2e-11eb-8ba0-8248e8081ffa.png" alt="Home Screen" width="270" height="600"/> <img src="https://user-images.githubusercontent.com/68557696/117224902-b3035200-ae2e-11eb-971e-d2ee06bbb62a.png" alt="Home Screen" width="270" height="600"/> <img src="https://user-images.githubusercontent.com/68557696/117224904-b4347f00-ae2e-11eb-831e-b676f2ff1036.png" alt="Home Screen" width="270" height="600"/> 

## pseudo code for contributors
game logic:
    home screen:
        - Variables are set. Player chooses if X or O.
        - onClick of play button, Navigator pops to gamePagev2.

    game screen:
        - UI: Grid, You are, Text.
        - Grid's items are text buttons. with default empty text.
        - onClick of a button:
            - await the function calls.
            - set state of board
            - whoIsWinner function is called and saved into a var
                - if board is empty, returns 0.
                - else if any possibility of win (verticals | horizontals | diagonals) = "X", return 1.
                - else if any possibility of win (verticals | horizontals | diagonals) = "O", return 2.
                - 012, 036, 147, 258, 345, 678, 048, 246
                - else if board is full ( tie breaker ), return 3
                - else return 0
            - call winCheck with the variable saved.
                - switch (whoIsWinner)
                    - 0 -> just break.
                    - 1 -> check who is "X" and call moveToWinner with params: "HUMAN" | "BOT"
                    - 2 -> check who is "O" and call moveToWinner with params: "HUMAN" | "BOT"
                    - 3 -> call moveToWinner with param: "TIE"
            - botPlay is called.
                - generate a random number
                - check if that random number's index is taken on the board, if yes generate again, if not continue.
                - delay 0.2 seconds.
                - setState of botplay
                - call whoIsWinner again and save it into a var
                - call winCheck with the variable saved.


humanLetter string var -> either "X" or "O"
botLetter string var -> opposite of humanLetter.

List<String> humanPlays -> dynamic list with indexes of human plays.
List<String> botPlays -> dynamic list with indexes of bot plays.
List<String> board -> list with 9 elements default "" changes to "X" or "O" after each play.

void clicked(int index)
int whoIsWinner()
void winCheck(int resultWhoIsWinner)
void botPlay()
