using System;
using System.Collections.Generic;
using SqlSugar;
using OfficeOpenXml.Attributes;

namespace ZR.Model.Models
{
    /// <summary>
    /// 城市信息，数据实体对象
    ///
    /// @author zr
    /// @date 2022-05-17
    /// </summary>
    [SugarTable("t_city")]
    public class TCity
    {
	

		/// <summary>
		/// 描述 : 城市表id
		/// 空值 : true  
		/// </summary>
		[EpplusTableColumn(Header = "城市表id")]
        [SugarColumn(IsPrimaryKey = true, IsIdentity = true)]
        public int? Id { get; set; }

        /// <summary>
        /// 描述 : 城市编码
        /// 空值 : true  
        /// </summary>
        [EpplusTableColumn(Header = "城市编码")]
        public string Citycode { get; set; }

        /// <summary>
        /// 描述 : 城市名称
        /// 空值 : true  
        /// </summary>
        [EpplusTableColumn(Header = "城市名称")]
        public string Cityname { get; set; }

        /// <summary>
        /// 描述 : 所属省份编码
        /// 空值 : true  
        /// </summary>
        [EpplusTableColumn(Header = "所属省份编码")]
        public string Provincecode { get; set; }

	


		/// <summary>
		/// 描述 : 最后操作人
		/// 空值 : true  
		/// </summary>
		[EpplusTableColumn(Header = "最后操作人")]
        [SugarColumn(ColumnName = "last_by")]
        public string LastBy { get; set; }

        /// <summary>
        /// 描述 : 建立时间
        /// 空值 : true  
        /// </summary>
        [EpplusTableColumn(Header = "建立时间", NumberFormat = "yyyy-MM-dd HH:mm:ss")]
        [SugarColumn(ColumnName = "create_time")]
        public DateTime? CreateTime { get; set; }

        /// <summary>
        /// 描述 : 更新时间
        /// 空值 : true  
        /// </summary>
        [EpplusTableColumn(Header = "更新时间", NumberFormat = "yyyy-MM-dd HH:mm:ss")]
        [SugarColumn(ColumnName = "update_time")]
        public DateTime? UpdateTime { get; set; }

        /// <summary>
        /// 描述 : 记录状态(有效/无效/删除)
        /// 空值 : true  
        /// </summary>
        [EpplusTableColumn(Header = "记录状态(有效/无效/删除)")]
        public string DelFlag { get; set; }



    }
}