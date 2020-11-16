using Model;
using System;
using System.Collections.Generic;
using System.Text;

namespace DAL.Interfaces
{
    public interface ICTHoaDonBanRepository
    {
        bool Create(CTHoaDonBanModel model);
        bool Delete(string id);
        bool Update(CTHoaDonBanModel model);

        CTHoaDonBanModel GetDatabyID(string id);
        List<CTHoaDonBanModel> GetDataAll();

        List<CTHoaDonBanModel> GetDataSameItem(string Mahdb);
        List<CTHoaDonBanModel> Search(int pageIndex, int pageSize, out long total, string Mahdb);
    }
}
