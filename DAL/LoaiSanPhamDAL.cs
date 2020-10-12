using DAL.Helper;
using DAL.Interfaces;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DAL
{
    public class LoaiSanPhamDAL: ILoaiSanPhamDAL
    {
        private IDatabaseHelper _dbHelper;
        public LoaiSanPhamDAL(IDatabaseHelper dbHelper)
        {
            _dbHelper = dbHelper;
        }

        public List<LoaiSanPhamModel> GetData()
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_item_group_get_data");
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return dt.ConvertTo<LoaiSanPhamModel>().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
