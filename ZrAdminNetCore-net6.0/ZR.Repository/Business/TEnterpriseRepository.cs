using System;
using Infrastructure.Attribute;
using ZR.Repository.System;
using ZR.Model.Models;

namespace ZR.Repository
{
    /// <summary>
    /// 组织机构表仓储
    ///
    /// @author zr
    /// @date 2022-05-16
    /// </summary>
    [AppService(ServiceLifetime = LifeTime.Transient)]
    public class TEnterpriseRepository : BaseRepository<TEnterprise>
    {
        #region 业务逻辑代码
        #endregion
    }
}