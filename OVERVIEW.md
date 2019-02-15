# Pokemon (Tom Version)
## Project Aim
1. Incorporate all aspect of CRUD into our project.
2. Access and manipulate API's to gain access to information necessary to the program
3. Enrich the user experience with music, animation and easy-to-use interface.
4. Attempt to implement core mechanics of the Pokemon games.
5. Do 1 ~ 4 while still enjoying ourselves.

## Requirements To Run
1. Require gems
```ruby
$ bundle install
$ rake db:migrate
$ rake db:seed
$ ruby bin/run.rb
```

## Game Mechanics
This game's mechanics is loosly based on the Pokemon game series where each individual of the 15 Pokemon types have strength and weakness to the other 14. Not to delve too deep into the original series mechanics; this game will be based corely on the Pokemon's type. The Player/User will be able to:
1. Battle, and through those battle gain the opportunity to catch the Pokemon they are currently using, through winning the battle.
2. Pick out from their list of captured Pokemon (maximum party of 6), which they will use to battle Trainers/Players at random that are fetched from the User database.
3. Personalize and customize their player experience by giving their captured Pokemon a "nickname". As well as have the option to change their own name after creation.
4. View a list of their captured and non-captured Pokemon and the stat associated with each individual Pokemon.
5. Through playing learn the experience and fatigue system incorporated with normal and trainer battles.
 * Further information regarding the game's mechanic and type, select "How to Play" in the Main Menu.

## Load Pokemon Gens 2 - 7
  ```ruby
  $ atom db/seeds.rb
    # Inside #load_pokemon set dex_entry to National Dex num
    # loop until end of Generation Num
  ```


  **Resource:** [Ascii Art](http://patorjk.com/software/taag/#p=display&f=Graffiti&t=Type%20Something%20), [Tty-Prompt](https://github.com/piotrmurach/tty-prompt), [PokeAPI](https://pokeapi.co/), [Soundtrack](https://downloads.khinsider.com/game-soundtracks/album/pokemon-original-game-soundtrack), [DIY-Terminal Animation](https://sammysteiner.github.io/blog/2017/04/13/bringing-terminal-applications-to-life-cli-animations-with-ruby/)
---

Many thanks to everyones in the "Tom" cohort, and the TCFs for the help, knowledge and the laughs that made this Module One Project possible and also fun, cheers!
