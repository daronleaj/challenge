// Used: https://github.com/SteveKChiu/ios-res-tool
import Foundation

struct R
{
    
    static var language: String? // es,en,...
    
    enum string : String
    {
        // Spaces
        case saleFlat
        case rentFlat
        case salePenthouse
        case rentPenthouse
        case saleStudio
        case rentStudio
        case saleChalet
        case rentChalet
        case saleDuplex
        case rentDuplex

        // List
        case titleList
        case pullToRefreshTable
    }

    enum arguments
    {
        case example_(value:String)

        var string : String {
            switch self {
            case .example_(let value):
                return localize(key: "example_",value)
            }
        }
    }
    
    // MARK: arras
    enum array : String
    {
        case example

        subscript(index: Int) -> String {
            return values.count>index ? values[index] : ""
        }
        var values : [String] {
            return R.arrays[self.rawValue] ?? []
        }
    }

    fileprivate static var arrays: [String : [String]] =
    {
        let path = Bundle.main.path(forResource: "LocalizableArray", ofType: "strings")!
        let dict = NSDictionary(contentsOfFile: path)!
        var map = [String : [String]]()
        for (k, v) in dict {
            let list = v as! [String]
            map[k as! String] = list
        }
        return map
    }()

}

postfix operator ^

postfix func ^ (key: R.string) -> String
{
    return localize(key: key.rawValue)
}

postfix func ^ (key: R.array) -> [String]
{
    return R.arrays[key.rawValue]!
}

func localize(key: String) -> String
{
    
    guard let languageCode = R.language, let bundle = Bundle.main.path(forResource: languageCode, ofType: "lproj") else {
      return NSLocalizedString(key, comment: "")
    }

    let langBundle = Bundle(path: bundle)
    return NSLocalizedString(key, tableName: nil, bundle: langBundle!, comment: "")
}

func localize(key: String, _ args: CVarArg...) -> String
{
    
    guard let languageCode = R.language, let bundle = Bundle.main.path(forResource: languageCode, ofType: "lproj") else {
        let format = NSLocalizedString(key, comment: "")
        return String(format: format, arguments: args)
    }

    let langBundle = Bundle(path: bundle)
    let format =  NSLocalizedString(key, tableName: nil, bundle: langBundle!, comment: "")
    return String(format: format, arguments: args)
}

