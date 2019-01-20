using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TuristProject.Entities;
using TuristProject.Web.Models.Shared;

namespace TuristProject.Repository.Interfaces
{
    public interface ITuristRepository
    {
        List<TuristData> GetTuristDataByType(int dataType);
        List<TuristData> GetTuristDataByTuristType(int type, int dataType);
        List<Company> GetCompanies();
        List<int> GetCompaniesByTuristType(int tyristType);
        void EditCharacteristics(CarecteristicModel model);
    }
}
