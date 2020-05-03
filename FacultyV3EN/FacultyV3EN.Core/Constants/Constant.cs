using System.Collections.Generic;

namespace FacultyV3EN.Core.Constants
{
    public class Constant
    {
        // View Bag / Temp Data Constants
        public const string MessageViewBagName = "Message";

        // Session login
        public const string USER_SESSION = "USER_SESSION";

        // Category
        public const string CATEGORY_NEWS = "NEWS";
        public const string CATEGORY_EVENTS = "EVENTS";

        // Confirguration
        public const string MESSENGER_NAME = "Messenger";
        public const string META_KEYWORDS = "Meta_Keywords";
        public const string META_DESCRIPTION = "Meta_Description";
        public const string TOTAL_ACCESS = "TotalAccess";
        public const string SESSION_CREDENTIAL = "SESSION_CREDENTIAL";

        //Role
        public const string ADMIN = "ADMIN";
        public const string POSTER = "POSTER";

        public const string NEWS = "NEWS";
        public const string EVENTS = "EVENTS";

        public static IDictionary<string, string> ListActionPage = new Dictionary<string, string>() {

            { "NEWS", "news" },
            { "EVENTS", "events" },
        };
    }
}
