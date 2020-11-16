using DAL.Helper;
using DAL.Interfaces;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DAL
{
    public partial class CTHoaDonBanRepository : ICTHoaDonBanRepository
    {
        private IDatabaseHelper _dbHelper;
        public CTHoaDonBanRepository(IDatabaseHelper dbHelper)
        {
            _dbHelper = dbHelper;
        }

        public List<CTHoaDonBanModel> GetDataAll()
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_CThoadonban_all");
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return dt.ConvertTo<CTHoaDonBanModel>().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool Create(CTHoaDonBanModel model)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_CThoadonban_create",
                "@Macthdb", model.Macthdb,
                "@Mahdb", model.Mahdb,
                "@Masp", model.Masp,
                "@Soluongban", model.Soluongban,
                "@Giaban", model.Giaban
                );
                if ((result != null && !string.IsNullOrEmpty(result.ToString())) || !string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(Convert.ToString(result) + msgError);
                }
                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool Delete(string id)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_CThoadonban_delete",
                "@Macthdb", id);
                if ((result != null && !string.IsNullOrEmpty(result.ToString())) || !string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(Convert.ToString(result) + msgError);
                }
                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public bool Update(CTHoaDonBanModel model)
        {
            string msgError = "";
            try
            {
                var result = _dbHelper.ExecuteScalarSProcedureWithTransaction(out msgError, "sp_CThoadonban_update",
                "@Macthdb", model.Macthdb,
                "@Mahdb", model.Mahdb,
                "@Masp", model.Masp,
                "@Soluongban", model.Soluongban,
                "@Giaban", model.Giaban);
                if ((result != null && !string.IsNullOrEmpty(result.ToString())) || !string.IsNullOrEmpty(msgError))
                {
                    throw new Exception(Convert.ToString(result) + msgError);
                }
                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        //laythuonghieu theo ID
        public CTHoaDonBanModel GetDatabyID(string id)
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_CThoadonban_get_by_id",
                     "@Macthdb", id);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return dt.ConvertTo<CTHoaDonBanModel>().FirstOrDefault();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public List<CTHoaDonBanModel> GetDataSameItem(string Mahdb)
        {
            string msgError = "";
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_CThoadonban_same_type", "@item_group_id", Mahdb);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                return dt.ConvertTo<CTHoaDonBanModel>().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public List<CTHoaDonBanModel> Search(int pageIndex, int pageSize, out long total, string Mahdb)
        {
            string msgError = "";
            total = 0;
            try
            {
                var dt = _dbHelper.ExecuteSProcedureReturnDataTable(out msgError, "sp_CThoadonban_searchadmin",
                    "@page_index", pageIndex,
                    "@page_size", pageSize,
                    "@Mahdb", Mahdb);
                if (!string.IsNullOrEmpty(msgError))
                    throw new Exception(msgError);
                if (dt.Rows.Count > 0) total = (long)dt.Rows[0]["RecordCount"];
                return dt.ConvertTo<CTHoaDonBanModel>().ToList();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public List<CTHoaDonBanModel> GetData()
        {
            throw new NotImplementedException();
        }
    }
}

