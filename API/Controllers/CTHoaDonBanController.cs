using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using BLL.Interfaces;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Model;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CTHoaDonBanController : ControllerBase
    {
        private string _path;
        private ICTHoaDonBanBusiness _itemBusiness;
        public CTHoaDonBanController(ICTHoaDonBanBusiness itemBusiness, IConfiguration configuration)
        {
            _itemBusiness = itemBusiness;
            _path = configuration["AppSettings:PATH"];

        }
        public string SaveFileFromBase64String(string RelativePathFileName, string dataFromBase64String)
        {
            if (dataFromBase64String.Contains("base64,"))
            {
                dataFromBase64String = dataFromBase64String.Substring(dataFromBase64String.IndexOf("base64,", 0) + 7);
            }
            return WriteFileToAuthAccessFolder(RelativePathFileName, dataFromBase64String);
        }
        public string WriteFileToAuthAccessFolder(string RelativePathFileName, string base64StringData)
        {
            try
            {
                string result = "";
                string serverRootPathFolder = _path;
                string fullPathFile = $@"{serverRootPathFolder}\{RelativePathFileName}";
                string fullPathFolder = System.IO.Path.GetDirectoryName(fullPathFile);
                if (!Directory.Exists(fullPathFolder))
                    Directory.CreateDirectory(fullPathFolder);
                System.IO.File.WriteAllBytes(fullPathFile, Convert.FromBase64String(base64StringData));
                return result;
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }


        [Route("delete-item")]
        [HttpPost]
        public IActionResult DeleteItem([FromBody] Dictionary<string, object> formData)
        {
            string Mahdb = "";

            if (formData.Keys.Contains("Mahdb") && !string.IsNullOrEmpty(Convert.ToString(formData["Mahdb"]))) { Mahdb = Convert.ToString(formData["Mahdb"]); }
            _itemBusiness.Delete(Mahdb);
            return Ok();
        }


        [Route("create-item")]
        [HttpPost]
        public CTHoaDonBanModel CreateItem([FromBody] CTHoaDonBanModel model)
        {
            if (model.Macthdb != null)
            {
                var arrData = model.Macthdb.Split(';');
                if (arrData.Length == 3)
                {
                    var savePath = $@"assets/images/{arrData[0]}";
                    model.Macthdb = $"{savePath}";
                    SaveFileFromBase64String(savePath, arrData[2]);
                }
            }

            model.Macthdb = Guid.NewGuid().ToString();

            _itemBusiness.Create(model);

            return model;
        }


        [Route("update-item")]
        [HttpPost]
        public CTHoaDonBanModel UpdateItem([FromBody] CTHoaDonBanModel model)
        {
            if (model.Macthdb != null)
            {
                var arrData = model.Macthdb.Split(';');
                if (arrData.Length == 3)
                {
                    var savePath = $@"assets/images/{arrData[0]}";
                    model.Macthdb = $"{savePath}";
                    SaveFileFromBase64String(savePath, arrData[2]);
                }
            }
            _itemBusiness.Update(model);
            return model;
        }


        [Route("get-all")]
        [HttpGet]
        public IEnumerable<CTHoaDonBanModel> GetDataAll()
        {
            return _itemBusiness.GetDataAll();
        }

        [Route("get-same-item/{item_group_id}")]
        [HttpGet]
        public IEnumerable<CTHoaDonBanModel> GetDataSameItem(string Mahdb)
        {
            return _itemBusiness.GetDataSameItem(Mahdb);
        }

        [Route("get-by-id/{id}")]
        [HttpGet]
        public CTHoaDonBanModel GetDatabyID(string id)
        {
            return _itemBusiness.GetDatabyID(id);
        }


        [Route("search")]
        [HttpPost]
        public ResponseModel Search([FromBody] Dictionary<string, object> formData)
        {
            var response = new ResponseModel();
            try
            {
                var page = int.Parse(formData["page"].ToString());
                var pageSize = int.Parse(formData["pageSize"].ToString());
                string Mahdb = "";
                if (formData.Keys.Contains("Mahdb") && !string.IsNullOrEmpty(Convert.ToString(formData["Mahdb"]))) { Mahdb = Convert.ToString(formData["Mahdb"]); }
                long total = 0;
                var data = _itemBusiness.Search(page, pageSize, out total, Mahdb);
                response.TotalItems = total;
                response.Data = data;
                response.Page = page;
                response.PageSize = pageSize;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return response;
        }
    }
}
