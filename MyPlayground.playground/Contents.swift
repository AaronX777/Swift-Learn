import UIKit

var emojiDict:[String: String]=["👻":"Ghost",
                                "💩":"Poop",
                                "😤":"Angry",
                                "👾":"Alien monster"]
var wordToLookup="👻"
var meaning = emojiDict[wordToLookup]

if let meaning=meaning{
print(meaning)
}

wordToLookup = "😤"
meaning = emojiDict[wordToLookup]

if let meaning=meaning {
print(meaning)
}
