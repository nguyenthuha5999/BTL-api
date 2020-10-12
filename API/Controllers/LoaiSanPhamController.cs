using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BLL.Interfaces;
using Microsoft.AspNetCore.Mvc;
using Model;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LoaiSanPhamController : ControllerBase
    {
        private ILoaiSanPhamBLL ILoaiSanPham;
        public LoaiSanPhamController(ILoaiSanPhamBLL ILoaiSP)
        {
            ILoaiSanPham = ILoaiSP;
        }
        // GET: api/<LoaiSanPhamController>
        [Route("getLoaisp")]
        [HttpGet]
        public IEnumerable<LoaiSanPhamModel> Get()
        {
            return ILoaiSanPham.getallLoai();
        }

        // GET api/<LoaiSanPhamController>/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "value";
        }

        // POST api/<LoaiSanPhamController>
        [HttpPost]
        public void Post([FromBody] string value)
        {
        }

        // PUT api/<LoaiSanPhamController>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/<LoaiSanPhamController>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
