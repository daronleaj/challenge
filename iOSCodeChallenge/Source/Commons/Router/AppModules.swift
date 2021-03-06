import Foundation
import UIKit

class AppModules: NSObject
{
    
    // MARK: - Home Step
    class func createList() -> UIViewController
    {
        return IDResultListConfigurator.createModule()
    }
    
    class func createDetail(item: IDResultModel) -> UIViewController
    {
        return IDResultDetailConfigurator.createModule(item: item)
    }
    
}
