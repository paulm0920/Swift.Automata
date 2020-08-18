import Cocoa


//This DFA will take an input of a or b to decide the transition


struct State: Equatable{
    let name: String
    let isFinal: Bool
}

struct Transition{
    
    let fromState: State
    let input: String
    let toState: State
}

  let s1 = State(name: "S1", isFinal: false)
  let s2 = State(name: "S2", isFinal: false)
  let s3 = State(name: "S3", isFinal: false)
  let s4 = State(name: "S4", isFinal: true)


struct TransitionBrain {
    
    static var dynamics = [
        Transition(fromState: s1, input: "a", toState: s1),
        Transition(fromState: s1, input: "b", toState: s2),
        Transition(fromState: s2, input: "a", toState: s1),
        Transition(fromState: s2, input: "b", toState: s3),
        Transition(fromState: s3, input: "a", toState: s3),
        Transition(fromState: s3, input: "b", toState: s4),
        Transition(fromState: s4, input: "a", toState: s3),
        Transition(fromState: s4, input: "b", toState: s4),
    ]
    
}

struct Automata {
    
    var currentState: State = s1

    mutating func getState(_ testInput: String) -> State {
        
        
        for element in TransitionBrain.dynamics {

            if element.fromState == currentState && element.input == testInput{
                currentState = element.toState
                break
            }
        }
        return currentState
    }
    
     mutating func checkString(_ userString: String) -> Bool {
        
        var finalState = s1
        
        for character in userString {
            finalState = getState(String(character))
        }
        
        print("Final state is \(finalState.name)")
        
        if finalState.isFinal == true {
            print("Based on the input \(userString), the automata is acceptable")
            return true
        } else {
            print("Based on the input \(userString), the automata is not acceptable")
            return false
        }
    }
 
    }
 
var myDFA = Automata()

myDFA.checkString("ababababababababbababbabababababbababababababababba")


    


