using System;
using System.Collections.Generic;
using SqlSugar;
using OfficeOpenXml.Attributes;

namespace ZR.Model.Models
{
    /// <summary>
    /// 组织机构表，数据实体对象
    ///
    /// @author zr
    /// @date 2022-05-16
    /// </summary>
    [SugarTable("t_enterprise")]
    public class TEnterprise
    {
        /// <summary>
        /// 描述 : 自增长id
        /// 空值 : false  
        /// </summary>
        [SugarColumn(IsPrimaryKey = true, IsIdentity = true)]
        public int Id { get; set; }

        /// <summary>
        /// 描述 : 门店编码
        /// 空值 : true  
        /// </summary>
        public string Enterpriseid { get; set; }

        /// <summary>
        /// 描述 : 门店类型(总部，分店，加盟，联营)
        /// 空值 : true  
        /// </summary>
        public string Enterprisetype { get; set; }

        /// <summary>
        /// 描述 : 门店名称
        /// 空值 : true  
        /// </summary>
        public string Enterprisename { get; set; }

        /// <summary>
        /// 描述 : 省份编码
        /// 空值 : true  
        /// </summary>
        public string Province { get; set; }

        /// <summary>
        /// 描述 : 城市编码
        /// 空值 : true  
        /// </summary>
        public string City { get; set; }

        /// <summary>
        /// 描述 : 城区，县编码
        /// 空值 : true  
        /// </summary>
        public string County { get; set; }

        /// <summary>
        /// 描述 : 详细地址
        /// 空值 : true  
        /// </summary>
        public string Address { get; set; }

        /// <summary>
        /// 描述 : 邮编
        /// 空值 : true  
        /// </summary>
        public string Zipcode { get; set; }

        /// <summary>
        /// 描述 : 电话
        /// 空值 : true  
        /// </summary>
        public string Tel { get; set; }

        /// <summary>
        /// 描述 : 负责人
        /// 空值 : true  
        /// </summary>
        public string Leader { get; set; }

        /// <summary>
        /// 描述 : 备注
        /// 空值 : true  
        /// </summary>
        public string Rem { get; set; }



    }
}