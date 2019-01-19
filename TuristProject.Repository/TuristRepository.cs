using System;
using System.Collections.Generic;
using System.Data.Objects;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TuristProject.Entities;
using TuristProject.Repository.Interfaces;

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
    }
}
