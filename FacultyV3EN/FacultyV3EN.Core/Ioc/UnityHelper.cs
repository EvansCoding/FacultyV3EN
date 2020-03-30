namespace FacultyV3EN.Core.Ioc
{
    using Data.Context;
    using Interfaces;
    using Interfaces.IServices;
    using Services;
    using System.Web.Mvc;
    using Unity;
    using Unity.Lifetime;

    /// <summary>
    ///     Bind the given interface in request scope
    /// </summary>
    public static class IocExtensions
    {
        public static void BindInRequestScope<T1, T2>(this IUnityContainer container) where T2 : T1
        {
            container.RegisterType<T1, T2>(new HierarchicalLifetimeManager());
        }
    }

    /// <summary>
    ///     The injection for Unity
    /// </summary>
    public static class UnityHelper
    {
        public static IUnityContainer Container;

        public static void InitialiseUnityContainer()
        {
            Container = new UnityContainer();
            DependencyResolver.SetResolver(new UnityDependencyResolver(Container));

            Container.BindInRequestScope<IConfigService, ConfigService>();
            Container.BindInRequestScope<ICacheService, CacheService>();
        }

        /// <summary>
        ///     Inject
        /// </summary>
        /// <returns></returns>
        public static void BuildUnityContainer()
        {
            Container.BindInRequestScope<IDataContext, DataContext>();
            Container.BindInRequestScope<IBannerService, BannerService>();
            Container.BindInRequestScope<IStickyService, StickyService>();
            Container.BindInRequestScope<IConfirgurationService, ConfirgurationService>();
            Container.BindInRequestScope<IContactService, ContactService>();
            Container.BindInRequestScope<ILecturerService, LecturerService>();
            Container.BindInRequestScope<IAccountService, AccountService>();
            Container.BindInRequestScope<IRoleService, RoleService>();
            Container.BindInRequestScope<INewsService, NewsService>();
            Container.BindInRequestScope<IEventsService, EventsService>();
            Container.BindInRequestScope<IGraduationService, GraduationService>();
        }
    }

}
