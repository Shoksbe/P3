//
//  main.swift
//  P3
//
//  Created by Gregory De knyf on 5/04/18.
//  Copyright © 2018 Gregory De knyf. All rights reserved.
//

import Foundation

///All nickname used in the game
var nicknameUsed = [String]()

/**
 Ask the player what name he wants to use and check if it's correct(more than 3 characters) and free.
 
 - returns: String, whit the nickname choose
 */
private func chooseNickname() -> String {

    /**
     Check if the chosen nickname is free
     - parameter nickname: The nickame chosen by the user
     - returns: A bool, *true* if used and *false* if isn't used
     */
    func nicknameIsAlreadyUsed(_ nickname: String) -> Bool {

        var nicknameIsAlreadyUsed = false

        //browse the nickname table to see if it's already used
        for name in nicknameUsed where name == nickname {
            nicknameIsAlreadyUsed = true
        }

        return nicknameIsAlreadyUsed
    }

    ///The nickname chosen by the player
    var nickname: String!

    ///To know if the nickname meets the conditions
    var choiceIsCorrect = false

    //while the choice of the nickname isn't possible
    repeat {

        //Verify if input text isn't empty
        if let nicknameChoosed = readLine() {

            //Nickname need min 3 characters and max 14
            if nicknameChoosed.count >= 3 && nicknameChoosed.count < 15 {

                //same nickname isn't permitted
                if !nicknameIsAlreadyUsed(nicknameChoosed) {
                    nickname = nicknameChoosed
                    nicknameUsed.append(nickname)
                    choiceIsCorrect = true

                } else {
                    print("This name is already used.")
                }
            } else {
                print("The name must have at least 3 characters and max 14.")
            }
        }
    }while(!choiceIsCorrect)

    return nickname
}
