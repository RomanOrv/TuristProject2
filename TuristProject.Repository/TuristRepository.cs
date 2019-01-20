using System;
using System.Collections.Generic;
using System.Data.Objects;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TuristProject.Entities;
using TuristProject.Repository.Interfaces;
using TuristProject.Web.Models.Shared;

namespace TuristProject.Repository
{
    public class TuristRepository : ITuristRepository
    {
        private readonly string _connectionString;
        public TuristRepository(string connectionString)
        {
            this._connectionString = connectionString;
        }

        public List<TuristData> GetTuristDataByType(int dataType)
        {
            using (ObjectContext context = new ObjectContext(_connectionString))
            {
                return context.CreateObjectSet<TuristData>().Where(x => x.TuristDataType == dataType).ToList();
            }
        }

        public List<TuristData> GetTuristDataByTuristType(int type, int dataType)
        {
            using (ObjectContext context = new ObjectContext(_connectionString))
            {
                return context.CreateObjectSet<TuristType>()
                    .Include("TuristTypeCompanies")
                    .Include("TuristTypeCompanies.Company")
                    .Include("TuristTypeCompanies.Company.TuristDatas").First(x => x.TuristTypeId == type).TuristTypeCompanies.Select(y => y.Company)
                                          .SelectMany(y => y.TuristDatas).Where(z => z.TuristDataType == dataType).ToList();
            }
        }

        public List<Company> GetCompanies()
        {
            using (ObjectContext context = new ObjectContext(_connectionString))
            {
                return context.CreateObjectSet<Company>().ToList();
            }
        }

        public List<int> GetCompaniesByTuristType(int tyristType)
        {
            using (ObjectContext context = new ObjectContext(_connectionString))
            {
                return context.CreateObjectSet<TuristType>().Include("TuristTypeCompanies")
                    .First(x => x.TuristTypeId == tyristType).TuristTypeCompanies.Select(y => y.CompanyId).ToList();
            }
        }

        public void EditCharacteristics(CarecteristicModel model)
        {
            using (ObjectContext context = new ObjectContext(_connectionString))
            {
                var turistTypeCompanyEntity = context.CreateObjectSet<TuristTypeCompany>().First(x =>
                    x.TuristTypeId == model.TuristType && x.CompanyId == model.OldCompanyNumber);
                turistTypeCompanyEntity.CompanyId = model.CompanyNumber;

                var turistData = context.CreateObjectSet<TuristData>().First(x =>
                    x.TuristDataType == model.TuristDataType && x.CompanyId == model.CompanyNumber);
                turistData.Residence = model.ResidenceCoefficient.Value;
                turistData.Food = model.FoodCoefficient.Value;
                turistData.Excursion = model.ExcursionCoefficient.Value;
                turistData.Transportation = model.TransportationCoefficient.Value;

                context.SaveChanges();
            }
        }
    }
}
