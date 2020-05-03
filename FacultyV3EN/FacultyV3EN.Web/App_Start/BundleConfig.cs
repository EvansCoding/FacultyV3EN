using System.Web.Optimization;

namespace FacultyV3EN.Web
{
    public class BundleConfig
    {
        // For more information on bundling, visit https://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/script/Admin").Include(
                    "~/Content/Admin/assets/js/vendor.min.js",
                    "~/Scripts/sweetalert.min.js",
                     "~/Content/Admin/assets/js/pages/sweet-alerts.init.js",
                     "~/Content/Admin/assets/libs/toastr/toastr.min.js",
                     "~/Content/Admin/assets/js/app.min.js",
                     "~/Content/jquery-3.4.1.min.js"
                    ));

            bundles.Add(new StyleBundle("~/css/Admin").Include(
                    "~/Content/Admin/assets/libs/toastr/toastr.min.css",
                      "~/Content/Admin/assets/css/bootstrap.min.css",
                      "~/Content/Admin/assets/css/app.min.css")
                      .Include("~/Content/Admin/assets/css/icons.min.css"));

            bundles.Add(new ScriptBundle("~/script/jquery").Include(
                "~/Content/Client/assets/js/jquery.min.js"
            ));

            bundles.Add(new StyleBundle("~/login/css").Include(
                    "~/Content/Admin/assets/css/bootstrap.min.css",
                    "~/Content/Admin/assets/css/icons.min.css",
                    "~/Content/Admin/assets/css/app.min.css"
                ));

            bundles.Add(new ScriptBundle("~/login/scripts").Include(
                    "~/Content/Admin/assets/js/vendor.min.js",
                    "~/Content/Admin/assets/js/app.min.js"
                ));



            // Client Layout
            bundles.Add(new ScriptBundle("~/client/script").Include(
                    "~/Content/Client/styles/bootstrap4/popper.js",
                    "~/Content/Client/styles/bootstrap4/bootstrap.min.js",
                    "~/Content/Client/plugins/greensock/TweenMax.min.js",
                    "~/Content/Client/plugins/greensock/TimelineMax.min.js",
                    "~/Content/Client/plugins/scrollmagic/ScrollMagic.min.js",
                    "~/Content/Client/plugins/greensock/animation.gsap.min.js",
                    "~/Content/Client/plugins/greensock/ScrollToPlugin.min.js",
                    "~/Content/Client/plugins/OwlCarousel2-2.2.1/owl.carousel.js",
                    "~/Content/Client/plugins/scrollTo/jquery.scrollTo.min.js",
                    "~/Content/Client/plugins/easing/easing.js"
                ));

            bundles.Add(new StyleBundle("~/client/css").Include(
                "~/Content/Client/styles/bootstrap4/bootstrap.min.css",
                "~/Content/Client/styles/style.css"
            ));
            /*--------------------------------------------------------------*/

            // Client Home
            bundles.Add(new ScriptBundle("~/client/home/script").Include(
                    "~/Content/Client/js/jquery-3.2.1.min.js",
                    "~/Content/Client/js/custom.js"
                ));

            bundles.Add(new StyleBundle("~/client/home/css").Include(
                "~/Content/Client/plugins/OwlCarousel2-2.2.1/owl.carousel.css",
                "~/Content/Client/plugins/OwlCarousel2-2.2.1/owl.theme.default.css",
                "~/Content/Client/plugins/OwlCarousel2-2.2.1/animate.css",
                "~/Content/Client/styles/home.css",
                "~/Content/Client/styles/responsive.css"
            ));
            /*--------------------------------------------------------------*/

            // Client Contact
            bundles.Add(new ScriptBundle("~/client/contact/script").Include(
                    "~/Content/Client/js/jquery-3.2.1.min.js",
                    "~/Content/Client/js/contact_custom.js"
                ));

            bundles.Add(new StyleBundle("~/client/contact/css").Include(
                "~/Content/Client/styles/contact.css",
                "~/Content/Client/styles/contact_responsive.css"
            ));
            /*--------------------------------------------------------------*/

            // Client News
            bundles.Add(new ScriptBundle("~/client/news/script").Include(
                    "~/Content/Client/js/jquery-3.2.1.min.js",
                    "~/Content/Client/js/news_custom.js"
                ));

            bundles.Add(new StyleBundle("~/client/news/css").Include(
                "~/Content/Client/styles/news.css",
                "~/Content/Client/styles/news_responsive.css"
            ));
            /*--------------------------------------------------------------*/

            // Client news post
            bundles.Add(new ScriptBundle("~/client/news_post/script").Include(
                    "~/Content/Client/js/jquery-3.2.1.min.js",
                    "~/Content/Client/js/news_post_custom.js"
                ));

            bundles.Add(new StyleBundle("~/client/news_post/css").Include(
                "~/Content/Client/styles/news_post.css",
                "~/Content/Client/styles/news_post_responsive.css"
            ));
            /*--------------------------------------------------------------*/

            // Client teacher
            bundles.Add(new ScriptBundle("~/client/teacher/script").Include(
                    "~/Content/Client/js/jquery-3.2.1.min.js",
                    "~/Content/Client/js/teachers_custom.js"
                ));

            bundles.Add(new StyleBundle("~/client/teacher/css").Include(
                "~/Content/Client/styles/teachers.css",
                "~/Content/Client/styles/teachers_responsive.css"
            ));
            /*--------------------------------------------------------------*/
            BundleTable.EnableOptimizations = true;
        }
    }
}
