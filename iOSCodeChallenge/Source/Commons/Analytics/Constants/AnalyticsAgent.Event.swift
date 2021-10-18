import Firebase
import FirebaseAnalytics

extension AnalyticsAgent
{

    enum Event: String
    {
        //Space
        case selectSpace = "select_space"
        case addSpace    = "add_favorite_space"
        case removeSpace = "remove_favorite_space"
    }
    
}
