
import Firebase
import FirebaseAnalytics

private enum Keys
{
    case spacePropertyCode

    var stringValue: String
    {
        switch self {
        case .spacePropertyCode:
            return "spaceCode"
        }
    }
}

extension AnalyticsAgent
{
    
    struct SpaceBlock
    {
        
        private(set) var spacePropertyCode: String
        
        var dictionary: [String:Any]
        {
            var dict = [Keys:Any]()
            
            dict[.spacePropertyCode] = spacePropertyCode
            
            return dict.reduce([String:Any](), { var d = $0; d[$1.key.stringValue] = $1.value; return d })
        }
        
        init(spacePropertyCode: String)
        {
            self.spacePropertyCode = spacePropertyCode
        }
    }
}
