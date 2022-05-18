using System;
using Infrastructure.Attribute;
using ZR.Repository.System;
using ZR.Model.Models;

namespace ZR.Repository
{
    /// <summary>
    /// 省份表仓储
    ///
    /// @author zr
    /// @date 2022-05-17
    /// </summary>
    [AppService(ServiceLifetime = LifeTime.Transient)]
    public class TProvinceRepository : BaseRepository<TProvince>
    {
        #region 业务逻辑代码
        #endregion
    }
}