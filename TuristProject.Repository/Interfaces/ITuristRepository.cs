using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TuristProject.Entities;

namespace TuristProject.Repository.Interfaces
{
    public interface ITuristRepository
    {
        List<TuristData> GetTuristDataByType(int dataType);
        List<TuristData> GetTuristDataByTuristType(int type, int dataType);
    }
}
