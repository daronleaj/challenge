import Foundation
import UIKit

protocol Router
{
    
    // MARK: - Home Step
    func navigateToResultDetail(item: IDResultModel)

    //MARK: - Assistant
    func goBack()
}
