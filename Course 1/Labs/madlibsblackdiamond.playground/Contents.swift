import UIKit

let randomStorySelection = Int.random(in: 1...3)
func generateMadLib0(adj: String, prep: String, noun: String, word: String, duration: String, adj2: String, v: String, noun1: String, event: String, noun2: String, v2: String, noun3: String, v3: String, noun4: String, v4: String, adj4: String, word2: String, v5: String, noun5: String, v6: String, noun6: String, saying: String, adj7: String, v7: String, noun8: String, noun9: String, noun10: String, adj8: String, futureDate: String, noun11: String) -> String {
    //add to a list?
    let wordList = [adj, prep, noun, word, duration, adj2, v, noun1, event, noun2, v2, noun3, v3, noun4, v4, adj4, word2, v5, noun5,
    v6, noun6, saying, adj7, v7, noun8, noun9, noun10, adj8, futureDate, noun11]
    for word in wordList {
        if word.isEmpty {
            return "Invalid Input"
        }
    }
    var nounList = [noun, noun1, noun2, noun3, noun4, noun5, noun6, noun8, noun9, noun10, noun11, word, word2, duration, futureDate].shuffled()
    var adjList = [adj, adj2, adj4, adj7, adj8].shuffled()
    var vList = [v, v2, v3, v4, v5, v6, v7].shuffled()
    
    switch randomStorySelection {
    case 1: return "It's a real \(adjList[0]) wonky evening \(prep) my \(nounList[0]). Grandma and \(nounList[1])pa are visiting for \(nounList[2]) and mum's \(adjList[1]) idea was to \(vList[0]) out together. I know this \(nounList[3]) will be a real \(event). \"Where my \(nounList[4]) at?\", \(vList[1])s the old \(nounList[5]) as she and \(nounList[1])pa finally \(vList[2]) waddle their \(nounList[6]) over. Together we \(vList[3]) up to this \(adjList[2])-as \(nounList[7]) diner. Then grandma immediately \(vList[4])s \(nounList[8]) in her pants. And \(nounList[1])pa forgot to \(vList[5]) his \(nounList[9]). Oh joy. But \(saying) cause my \(adjList[3]) dad \(vList[6])-ed his \(nounList[10]) at home. And just like that, our \(nounList[11])-ful family \(nounList[12])ing is \(adjList[4]) and ruined. Maybe \(nounList[13]) we'll get our \(nounList[14]) together."
    case 2: return "Have you ever taken a \(adjList[0]) walk \(prep) the town \(nounList[0])? \(nounList[1]) is a \(nounList[2])-old \(adjList[1]) monument you can come \(vList[0]) at. It's a popular \(nounList[3]) for \(event). It's shiny \(nounList[4]) was \(vList[1]) from old \(nounList[5]) called \(word) which is easy to \(vList[2]) its \(nounList[6]) over. Just last year I \(vList[3]) a report on the \(adjList[2]) \(nounList[7]) tribe. They are known for \(vList[4])ing \(nounList[8]) which is evident by the way the \(nounList[1]) \(vList[5])s all over the \(nounList[9]). Their motto is \(saying). I respect the \(adjList[3]) way they \(vList[6])-ed our \(nounList[10]) village here at home. Their \(nounList[11]) is the core \(nounList[12]) of our \(adjList[4]) lives. Maybe \(nounList[13]) we can see \(nounList[14]) together. :("
    case 3: return "There's \(adjList[0]) snow falling \(prep) the \(nounList[0])! We haven't seen this kind of \(nounList[1]) since \(nounList[2]) ago. This \(adjList[1]) event may just \(vList[0]) out the whole human \(noun1), like the \(event). This is the \(noun2)! The very end! People start \(v2)ing as they run for \(noun3) but the \(word) continues \(v3)ing on their \(noun4)s. As things \(v4)-alate up it gets more \(adj4)  around \(word2) square. Someone \(v5)s my \(noun5) with their foot. \"\(word)\", I shout and \(v6) to the \(noun6). \(saying) as they say. When I awake on the \(adj7) ground \(v7)-ed in \(noun8) and blood, the whole town is \(noun9)-ful without a \(noun10) in sight. My \(adj8) hurts but I need to make it to \(futureDate) for some \(noun11)."
    default: return "Wuuuuut"
        }
}

generateMadLib0(adj: "bad", prep: "over", noun: "boot", word: "ding", duration: "forever", adj2: "smelly", v: "kick", noun1: "string", event: "mass", noun2: "horn", v2: "horn", noun3: "bomb", v3: "bomb", noun4: "house", v4: "serve", adj4: "rachet", word2: "wow", v5: "throw", noun5: "pants", v6: "show", noun6: "finger", saying: "cat's out of the bag", adj7: "small", v7: "bite", noun8: "bat", noun9: "cow", noun10: "shoe", adj8: "ugly", futureDate: "tomorrow", noun11: "pile")
