using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using ZR.Model.Dto;
using ZR.Model.Models;

namespace ZR.Model.Dto
{
    /// <summary>
    /// 城市信息输入对象
    /// </summary>
    public class TCityDto
    {
        public int? Id { get; set; }
        public string Citycode { get; set; }
        public string Cityname { get; set; }
        public string Provincecode { get; set; }

		/// <summary>
		/// 描述 : 所属省份编码
		/// 空值 : true  
	
		public string Provincename { get; set; }

	}

	/// <summary>
	/// 城市信息查询对象
	/// </summary>
	public class TCityQueryDto : PagerInfo 
    {
        public string Citycode { get; set; }
        public string Cityname { get; set; }
        public string Provincecode { get; set; }
    }
}
