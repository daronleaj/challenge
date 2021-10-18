import Foundation

protocol AnalyticsAgentProvider
{
    func initProvider()
    
    func trackScreen(screenName: String, screenClass: String, dataSource: [String:Any])
    func trackEvent(eventName: String, dataSource: [String:Any])
}

final class AnalyticsAgent
{
    
    private static let provider: AnalyticsAgentProvider = FirebaseProvider()
    
    class func startAnalytics()
    {
        provider.initProvider()
    }
    
    class func trackView(screenName: ScreenName, screenClass: ScreenClass, dataSource: [String:Any])
    {
        provider.trackScreen(screenName: screenName.rawValue, screenClass: screenClass.rawValue, dataSource: dataSource)
    }
    
    class func trackEvent(nameEvent: Event, params:[String], dataSource: [String:Any])
    {
        var string = nameEvent.rawValue
        if string.contains("%@") {
            string = String(format: string, arguments: params)
        }
        provider.trackEvent(eventName: string, dataSource: dataSource)
    }
}
