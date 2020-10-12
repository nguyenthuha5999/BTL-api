using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Model
{
    class SanPhamModel
    {
        [Key]
        public string Masp { get; set; }
        public string Tensp { get; set; }
        public string Maloai { get; set; }
        public string Mausac { get; set; }
        public string Size { get; set; }
        public string Chatlieu { get; set; }
        public decimal Giatien { get; set; }
        public decimal Giakm { get; set; }
        public string Hinhanh { get; set; }
        public int Soluong { get; set; }
        public string Spmoi { get; set; }
        public string Mota { get; set; }
    }
}
