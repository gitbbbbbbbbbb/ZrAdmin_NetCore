using System;
using ZR.Model;
using ZR.Model.Dto;
using ZR.Model.Models;
using System.Collections.Generic;

namespace ZR.Service.Business.IBusinessService
{
    /// <summary>
    /// 组织机构表service接口
    ///
    /// @author zr
    /// @date 2022-05-16
    /// </summary>
    public interface ITEnterpriseService : IBaseService<TEnterprise>
    {
        PagedInfo<TEnterprise> GetList(TEnterpriseQueryDto parm);

        int AddTEnterprise(TEnterprise parm);
    }
}
