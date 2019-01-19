using System.Configuration;
using System.Web.Mvc;
using Microsoft.Practices.Unity;
using TuristProject.Repository;
using TuristProject.Repository.Interfaces;
using Unity.Mvc5;

namespace TuristProject.Web
{
    public static class UnityConfig
    {
        public static void RegisterComponents()
        {
			var container = new UnityContainer();
            string connectionString = ConfigurationManager.ConnectionStrings["turist2Entities"].ConnectionString;
            container.RegisterType<ITuristRepository, TuristRepository>(new InjectionConstructor(connectionString));
            // register all your components with the container here
            // it is NOT necessary to register your controllers

            // e.g. container.RegisterType<ITestService, TestService>();

            DependencyResolver.SetResolver(new UnityDependencyResolver(container));
        }
    }
}