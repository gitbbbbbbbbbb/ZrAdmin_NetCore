using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using ZR.Model.Dto;
using ZR.Model.Models;

namespace ZR.Model.Dto
{
    /// <summary>
    /// 省份表输入对象
    /// </summary>
    public class TProvinceDto
    {
        public int? Id { get; set; }
        public string Provincecode { get; set; }
        public string Provincename { get; set; }
        public string LastBy { get; set; }
    }

    /// <summary>
    /// 省份表查询对象
    /// </summary>
    public class TProvinceQueryDto : PagerInfo 
    {
        public string Provincecode { get; set; }
        public string Provincename { get; set; }
        public string LastBy { get; set; }
    }
}
