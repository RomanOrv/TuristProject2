using Kendo.Mvc.Extensions;
using Kendo.Mvc.UI;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TuristProject.Common.Enums;
using TuristProject.Repository.Interfaces;
using TuristProject.Web.Models.Shared;

namespace TuristProject.Web.Controllers
{
    public class HomeController : Controller
    {

        private readonly ITuristRepository _turistRepository;
        public HomeController(ITuristRepository turistRepository)
        {
            this._turistRepository = turistRepository;
        }

        public ActionResult Index()
        {
            ViewBag.ChartSafetyData = GetChartData((int)ETuristType.Child, (int)ETuristDataType.Safety);
            ViewBag.ChartComfortData = GetChartData((int)ETuristType.Child, (int)ETuristDataType.Comfort);
            ViewBag.ChartInformativeData = GetChartData((int)ETuristType.Child, (int)ETuristDataType.Informative);
            ViewBag.ChartStaffQualificationData = GetChartData((int)ETuristType.Child, (int)ETuristDataType.StaffQualification);
            return View();
        }

        public ActionResult Young()
        {
            ViewBag.ChartSafetyData = GetChartData((int)ETuristType.Young, (int)ETuristDataType.Safety);
            ViewBag.ChartComfortData = GetChartData((int)ETuristType.Young, (int)ETuristDataType.Comfort);
            ViewBag.ChartInformativeData = GetChartData((int)ETuristType.Young, (int)ETuristDataType.Informative);
            ViewBag.ChartStaffQualificationData = GetChartData((int)ETuristType.Young, (int)ETuristDataType.StaffQualification);
            return View();
        }

        public ActionResult MiddleAge()
        {
            ViewBag.ChartSafetyData = GetChartData((int)ETuristType.MiddleAge, (int)ETuristDataType.Safety);
            ViewBag.ChartComfortData = GetChartData((int)ETuristType.MiddleAge, (int)ETuristDataType.Comfort);
            ViewBag.ChartInformativeData = GetChartData((int)ETuristType.MiddleAge, (int)ETuristDataType.Informative);
            ViewBag.ChartStaffQualificationData = GetChartData((int)ETuristType.MiddleAge, (int)ETuristDataType.StaffQualification);
            return View();
        }


        public ActionResult OldAge()
        {
            ViewBag.ChartSafetyData = GetChartData((int)ETuristType.OldAge, (int)ETuristDataType.Safety);
            ViewBag.ChartComfortData = GetChartData((int)ETuristType.OldAge, (int)ETuristDataType.Comfort);
            ViewBag.ChartInformativeData = GetChartData((int)ETuristType.OldAge, (int)ETuristDataType.Informative);
            ViewBag.ChartStaffQualificationData = GetChartData((int)ETuristType.OldAge, (int)ETuristDataType.StaffQualification);
            return View();
        }

        public ActionResult GetGridTuristData([DataSourceRequest] DataSourceRequest request, int turistType, int dataType)
        {
            var models =
                this._turistRepository.GetTuristDataByTuristType(turistType, dataType).Select(y =>
                    new GridModel
                    {
                        CompanyNumber = y.CompanyId,
                        ResidenceCoefficient = y.Residence,
                        FoodCoefficient = y.Food,
                        TransportationCoefficient = y.Transportation,
                        ExcursionCoefficient = y.Excursion,
                        AverageRateCoefficient = Math.Round((y.Residence + y.Food + y.Transportation + y.Excursion)/4, 2)
                    }).ToList();

            return Json(models.OrderBy(x => x.CompanyNumber).ToDataSourceResult(request));
        }


        private List<CyclogramChartModel> GetChartData(int turistType, int dataType)
        {
            var models =
                this._turistRepository.GetTuristDataByTuristType(turistType, dataType).Select(y =>
                    new GridModel
                    {
                        CompanyNumber = y.CompanyId,
                        ResidenceCoefficient = y.Residence,
                        FoodCoefficient = y.Food,
                        TransportationCoefficient = y.Transportation,
                        ExcursionCoefficient = y.Excursion,
                        AverageRateCoefficient = Math.Round((y.Residence + y.Food + y.Transportation + y.Excursion) / 4, 2)
                    }).ToList();

            return CreateCyclogramChartModels(models);
        }


        private List<CyclogramChartModel> CreateCyclogramChartModels(List<GridModel> models)
        {
            var chartsData = new List<CyclogramChartModel>();
            foreach (var m in models)
            {
                var chart = new CyclogramChartModel();
                chart.name = $"Туристична організація №{m.CompanyNumber}.";
                var data = new List<decimal>();
                data.Add(m.AverageRateCoefficient);
                data.Add(m.FoodCoefficient);
                data.Add(m.TransportationCoefficient);
                data.Add(m.ExcursionCoefficient);
                data.Add(m.ResidenceCoefficient);
                chart.data.AddRange(data);
                chartsData.Add(chart);
            }

            return chartsData;
        }

    }
}