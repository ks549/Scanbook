using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(WebAppScanBook.Startup))]
namespace WebAppScanBook
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
