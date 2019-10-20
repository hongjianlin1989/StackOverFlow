
import Foundation
import UIKit

extension String {
    func localize(_ args: CVarArg...) -> String  {
        var result = String(format: NSLocalizedString(self, comment: ""), arguments: args)
        if result == self {
            result = Bundle.main.localizedString(forKey: self, value: nil, table: "Accessibility")
        }
        return result
    }
}
