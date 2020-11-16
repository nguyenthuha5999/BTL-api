using Model;
using System;
using System.Collections.Generic;
using System.Text;

namespace BLL.Interfaces
{
    public partial interface ICTHoaDonBanBusiness
    {
        bool Create(CTHoaDonBanModel model);
        bool Update(CTHoaDonBanModel model);
        bool Delete(string id);
        CTHoaDonBanModel GetDatabyID(string id);
        List<CTHoaDonBanModel> GetDataAll();
        List<CTHoaDonBanModel> GetDataSameItem(string Mahdb);
        List<CTHoaDonBanModel> Search(int pageIndex, int pageSize, out long total, string Mahdb);
    }
}
