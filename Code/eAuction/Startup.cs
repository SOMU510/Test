using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(eAuction.Startup))]
namespace eAuction
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
