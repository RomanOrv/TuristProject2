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


        public ActionResult AllData()
        {
            return View();
        }

        [HttpGet]
        public ActionResult EditCharacteristics(int turistType, int dataType, int companyNumber)
        {
          var turistData = _turistRepository.GetTuristDataByType(dataType).Select(y =>
              new CarecteristicModel
              {
                  CompanyNumber = y.CompanyId,
                  ResidenceCoefficient = y.Residence,
                  FoodCoefficient = y.Food,
                  TransportationCoefficient = y.Transportation,
                  ExcursionCoefficient = y.Excursion,
                  TuristDataType = y.TuristDataType,
                  TuristType = turistType,
                  OldCompanyNumber = y.CompanyId,
              }).ToList();
            var companyTuristData = turistData.First(x => x.CompanyNumber == companyNumber);
            var companies = _turistRepository.GetCompanies();
            var companiesByTuristType = _turistRepository.GetCompaniesByTuristType(turistType);
            var companiesForDropdown = companies.Where(x => !companiesByTuristType.Contains(x.CompanyId) || (companiesByTuristType.Contains(x.CompanyId) && x.CompanyId == companyNumber)).ToList();
            ViewBag.Companies = companiesForDropdown.Select(x => new BaseDictionaryDropdownModel{Id = x.CompanyId, Name = x.CompanyNumber.ToString()});
            ViewBag.TuristData = turistData;

            var turistTypeText = string.Empty;
            var backAction = string.Empty;
            switch ((ETuristType)turistType)
            {
                case ETuristType.Child:
                    turistTypeText = "Туристи з дітьми";
                    backAction = "Index";
                    break;
                case ETuristType.Young:
                    turistTypeText = "Молодь";
                    backAction = "Young";
                    break;
                case ETuristType.MiddleAge:
                    turistTypeText = "Середній вік";
                    backAction = "MiddleAge";
                    break;
                case ETuristType.OldAge:
                    turistTypeText = "Третій вік";
                    backAction = "OldAge";
                    break;
            }
            ViewBag.TuristType = turistTypeText;
            ViewBag.BackAction = backAction;

            var turistDataTypeText = string.Empty;
            switch ((ETuristDataType)dataType)
            {
                case ETuristDataType.Safety:
                    turistDataTypeText = "Безпека";
                    break;
                case ETuristDataType.Comfort:
                    turistDataTypeText = "Комфорт";
                    break;
                case ETuristDataType.Informative:
                    turistDataTypeText = "Інформативність";
                    break;
                case ETuristDataType.StaffQualification:
                    turistDataTypeText = "Кваліфікованість персоналу";
                    break;
            }
            ViewBag.TurisDataType = turistDataTypeText;

            return View(companyTuristData);
        }


        [HttpPost]
        public ActionResult EditCharacteristics(CarecteristicModel model)
        {
            _turistRepository.EditCharacteristics(model);
            var action = string.Empty;

            switch ((ETuristType)model.TuristType)
            {
                case ETuristType.Child:
                    action = "Index";
                    break;
                case ETuristType.Young:
                    action = "Young";
                    break;
                case ETuristType.MiddleAge:
                    action = "MiddleAge";
                    break;
                case ETuristType.OldAge:
                    action = "OldAge";
                    break;
            }

            return RedirectToAction(action);
        }

        public ActionResult GetGridAllData([DataSourceRequest] DataSourceRequest request, int dataType)
        {
            var models =
                this._turistRepository.GetTuristDataByType(dataType).Select(y =>
                    new GridModel
                    {
                        CompanyNumber = y.CompanyId,
                        ResidenceCoefficient = y.Residence,
                        FoodCoefficient = y.Food,
                        TransportationCoefficient = y.Transportation,
                        ExcursionCoefficient = y.Excursion,
                        AverageRateCoefficient = Math.Round((y.Residence + y.Food + y.Transportation + y.Excursion) / 4, 2)
                    }).ToList();

            return Json(models.OrderBy(x => x.CompanyNumber).ToDataSourceResult(request));
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
                        TuristDataType = y.TuristDataType,
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
                chart.name = $"Туристичне підприємство №{m.CompanyNumber}.";
                var data = new List<decimal>();
                data.Add(m.AverageRateCoefficient);
                data.Add(m.FoodCoefficient.Value);
                data.Add(m.TransportationCoefficient.Value);
                data.Add(m.ExcursionCoefficient.Value);
                data.Add(m.ResidenceCoefficient.Value);
                chart.data.AddRange(data);
                chartsData.Add(chart);
            }

            return chartsData;
        }

    }
}