namespace FacultyV3EN.Core
{
    using Core.Ioc;
    using Interfaces.IServices;
    using Unity;

    public class FacultyV3ENConfirguration
    {
        private string _originVersion;

        public string OriginVersion
        {
            get
            {
                if (string.IsNullOrEmpty(_originVersion))
                {
                    _originVersion = GetConfig("FacultyV3ENVersion");
                }
                return _originVersion;
            }
        }

        // Database Connection Key
        public string OriginContext => GetConfig("DataContext");

        #region Singleton

        private static FacultyV3ENConfirguration _instance;
        private static readonly object InstanceLock = new object();
        private static IConfigService _configService;

        private FacultyV3ENConfirguration(IConfigService configService)
        {
            _configService = configService;
        }

        public static FacultyV3ENConfirguration Instance
        {
            get
            {
                if (_instance == null)
                {
                    lock (InstanceLock)
                    {
                        if (_instance == null)
                        {
                            var configService = UnityHelper.Container.Resolve<IConfigService>();
                            _instance = new FacultyV3ENConfirguration(configService);
                        }
                    }
                }
                return _instance;
            }
        }

        #endregion

        #region Generic Get
        public string GetConfig(string key)
        {
            var dict = _configService.GetConfig();
            if (!string.IsNullOrWhiteSpace(key) && dict.ContainsKey(key))
            {
                return dict[key];
            }
            return string.Empty;
        }
        #endregion
    }
}
