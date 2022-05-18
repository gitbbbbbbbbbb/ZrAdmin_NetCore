using System;
using ZR.Model;
using ZR.Model.Dto;
using ZR.Model.Models;
using System.Collections.Generic;

namespace ZR.Service.Business.IBusinessService
{
    /// <summary>
    /// 省份表service接口
    ///
    /// @author zr
    /// @date 2022-05-17
    /// </summary>
    public interface ITProvinceService : IBaseService<TProvince>
    {
        PagedInfo<TProvince> GetList(TProvinceQueryDto parm);

        int AddTProvince(TProvince parm);
    }
}
