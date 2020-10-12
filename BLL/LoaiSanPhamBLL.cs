using BLL.Interfaces;
using DAL.Interfaces;
using Model;
using System;
using System.Collections.Generic;
using System.Text;

namespace BLL
{
    public class LoaiSanPhamBLL: ILoaiSanPhamBLL
    {
        private ILoaiSanPhamDAL _res;
        public LoaiSanPhamBLL(ILoaiSanPhamDAL ItemGroupRes)
        {
            _res = ItemGroupRes;
        }
        public List <LoaiSanPhamModel> getallLoai()
        {
            return _res.GetData();

        }

    }
}
