
import Firebase
import FirebaseAnalytics

private enum Keys
{
    case screenClass
    case screenName
    
    var stringValue: String {
        switch self {
        case .screenClass:
            return AnalyticsParameterScreenClass
        case .screenName:
            return AnalyticsParameterScreenName
        }
    }
}

extension AnalyticsAgent
{
    
    struct ScreenBlock
    {
        
        private(set) var screenClass: String
        private(set) var screenName: String

        var dictionary: [String:Any] {
            var dict = [Keys:Any]()

            dict[.screenClass] = screenClass
            dict[.screenName] = screenName

            return dict.reduce([String:Any](), { var d = $0; d[$1.key.stringValue] = $1.value; return d })
        }
        
        init(screenClass: ScreenClass, screenName: ScreenName)
        {
            self.screenClass = screenClass.rawValue
            self.screenName = screenName.rawValue
        }
    }
}
