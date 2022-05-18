using System;
using ZR.Model;
using ZR.Model.Dto;
using ZR.Model.Models;
using System.Collections.Generic;

namespace ZR.Service.Business.IBusinessService
{
    /// <summary>
    /// 城市信息service接口
    ///
    /// @author zr
    /// @date 2022-05-17
    /// </summary>
    public interface ITCityService : IBaseService<TCity>
    {
        PagedInfo<TCity> GetList(TCityQueryDto parm);

        int AddTCity(TCity parm);

		(List<TCityDto>, int total) getTCityDtolist();

	}
}
