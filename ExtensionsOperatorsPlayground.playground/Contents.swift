/* Here's some code based on my blod (http://publicstaticvoidbrain.tumblr.com/post/119551147489/extensions-and-operators-in-swift). Feel free to define some of your own extensions and operators in this playground. I've included couple of each to give you an idea of how to do it yourself. I hope it's some fun.
    
    To find out more about extensions: https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Extensions.html#//apple_ref/doc/uid/TP40014097-CH24-ID151
    To find out more about custom operators: https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/AdvancedOperators.html#//apple_ref/doc/uid/TP40014097-CH27-ID41
*/
import UIKit

/*------------------------/
/------ Extensions -------/
/------------------------*/
extension Int {
    // Here's a Swfit-like implementation of Ruby's Fixnum#times
    func times(task: () -> ()) {
        for _ in 0..<self {
            task()
        }
    }

    // Here's a similar implementation to Rubys Fixnum#upto
    func upto(other: Int, step: Int) -> [Int] {
        return [Int](self...other).filter({ $0 % step == 0 })
    }
}

// times (
var fourFoo = ""
4.times({
    fourFoo += "foo "
})
fourFoo

// upto
let minRange = 10.upto(20, step: 2)
let highRange = 30.upto(60, step: 5)

/*------------------------/
/---- Custom Operators ---/
/------------------------*/

// multiply each number in an array by the left operand
infix operator *** { associativity left }

func ***(mult: Int, xs: [Int]) -> [Int] {
    return xs.map({ $0 * mult })
}
8 *** [1, 4, 2]
90 *** [1, 2, 3]

// A reimplementation of Ruby's Array#<<
infix operator << { associativity left }
func << (xs: [Int], el: Int) -> [Int] {
    return xs + [el]
}

[1, 2, 3] << 9



