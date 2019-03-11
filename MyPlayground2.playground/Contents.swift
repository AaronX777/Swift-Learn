import UIKit

var emojiDict=["👻":"鬼","🤖":"機器人","😤":"生氣","🤓":"書呆子","👾":"外星人"]

var wordToLookup = "🤓"
var meaning = emojiDict[wordToLookup]

let containerView=UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
containerView.backgroundColor=UIColor.orange

let emojiLabel = UILabel(frame: CGRect(x: 95, y: 20, width: 150, height: 150))
emojiLabel.text = wordToLookup
emojiLabel.font = UIFont.systemFont(ofSize: 100.0)

containerView.addSubview(emojiLabel)

let meaningLavel = UILabel(frame: CGRect(x: 110, y: 100 , width: 150, height: 150))
meaningLavel.text = meaning
meaningLavel.font = UIFont.systemFont(ofSize: 30.0)
meaningLavel.textColor = UIColor.white

containerView.addSubview(meaningLavel)
