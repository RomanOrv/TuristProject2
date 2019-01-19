using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TuristProject.Web.Models.Shared
{
    public class GridModel
    {
        public int CompanyNumber { get; set; }

        [Required(ErrorMessage = "Це поле обов'язкове"), Display(Name = "Показник проживання")]
        public decimal ResidenceCoefficient { get; set; }

        [Required(ErrorMessage = "Це поле обов'язкове"), Display(Name = "Показник харчування")]
        public decimal FoodCoefficient { get; set; }

        [Required(ErrorMessage = "Це поле обов'язкове"), Display(Name = "Показник транспортних послуг")]
        public decimal TransportationCoefficient { get; set; }

        [Required(ErrorMessage = "Це поле обов'язкове"), Display(Name = "Показник екскурсійних послуг")]
        public decimal ExcursionCoefficient { get; set; }

        public decimal AverageRateCoefficient { get; set; }
    }
}
