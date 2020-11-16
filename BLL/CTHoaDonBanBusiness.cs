using BLL.Interfaces;
using DAL;
using Model;
using System;
using System.Collections.Generic;
using System.Text;

namespace BLL
{
    public class CTHoaDonBanBusiness : ICTHoaDonBanBusiness
    {
        private CTHoaDonBanRepository _res;
        public CTHoaDonBanBusiness(CTHoaDonBanRepository ItemGroupRes)
        {
            _res = ItemGroupRes;
        }
        public bool Create(CTHoaDonBanModel model)
        {
            return _res.Create(model);
        }
        public bool Update(CTHoaDonBanModel model)
        {
            return _res.Update(model);
        }

        public bool Delete(string id)
        {
            return _res.Delete(id);
        }
        public CTHoaDonBanModel GetDatabyID(string id)
        {
            return _res.GetDatabyID(id);
        }
        public List<CTHoaDonBanModel> GetDataAll()
        {
            return _res.GetDataAll();
        }

        public List<CTHoaDonBanModel> GetDataSameItem(string Mahdb)
        {
            return _res.GetDataSameItem(Mahdb);
        }

        public List<CTHoaDonBanModel> Search(int pageIndex, int pageSize, out long total, string Mahdb)
        {
            return _res.Search(pageIndex, pageSize, out total, Mahdb);
        }
    }
}
