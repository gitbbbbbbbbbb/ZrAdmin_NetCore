using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using ZR.Model.Dto;
using ZR.Model.Models;

namespace ZR.Model.Dto
{
    /// <summary>
    /// 组织机构表输入对象
    /// </summary>
    public class TEnterpriseDto
    {
        [Required(ErrorMessage = "自增长id不能为空")]
        public int Id { get; set; }
        public string Enterpriseid { get; set; }
        public string Enterprisetype { get; set; }
        public string Enterprisename { get; set; }
        public string Province { get; set; }
        public string City { get; set; }
        public string County { get; set; }
        public string Address { get; set; }
        public string Zipcode { get; set; }
        public string Tel { get; set; }
        public string Leader { get; set; }
        public string Rem { get; set; }
    }

    /// <summary>
    /// 组织机构表查询对象
    /// </summary>
    public class TEnterpriseQueryDto : PagerInfo 
    {
        public string Enterprisename { get; set; }
    }
}
