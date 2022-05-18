using System;
using Infrastructure.Attribute;
using ZR.Repository.System;
using ZR.Model.Models;
using ZR.Model.Dto;
using System.Collections.Generic;
using System.Linq;


namespace ZR.Repository
{
    /// <summary>
    /// 城市信息仓储
    ///
    /// @author zr
    /// @date 2022-05-17
    /// </summary>
    [AppService(ServiceLifetime = LifeTime.Transient)]
    public class TCityRepository : BaseRepository<TCity>
    {
		#region 业务逻辑代码



		public (List<TCityDto>,int total )getTCityDtolist()
		{

            string sql = " SELECT	a.*,b.provincename FROM	t_city a JOIN t_province b ON a.provincecode = b.provincecode where 1=1 ";

            var datalist = Context.SqlQueryable<TCityDto>(sql);
            
            var total= datalist.Count();

            datalist.OrderBy("id asc").ToPageList(1, 10);
			return (datalist.ToList(),total);
        
        }
		#endregion
	}
}