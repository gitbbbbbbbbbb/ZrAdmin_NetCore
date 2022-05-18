using System;
using SqlSugar;
using System.Collections.Generic;
using Infrastructure;
using Infrastructure.Attribute;
using ZR.Model;
using ZR.Model.Dto;
using ZR.Model.Models;
using ZR.Repository;
using ZR.Service.Business.IBusinessService;

namespace ZR.Service.Business
{
    /// <summary>
    /// 城市信息Service业务层处理
    ///
    /// @author zr
    /// @date 2022-05-17
    /// </summary>
    [AppService(ServiceType = typeof(ITCityService), ServiceLifetime = LifeTime.Transient)]
    public class TCityService : BaseService<TCity>, ITCityService
    {
        private readonly TCityRepository _TCityRepository;
        public TCityService(TCityRepository repository)
        {
            _TCityRepository = repository;
        }

        #region 业务逻辑代码

        /// <summary>
        /// 查询城市信息列表
        /// </summary>
        /// <param name="parm"></param>
        /// <returns></returns>
        public PagedInfo<TCity> GetList(TCityQueryDto parm)
        {
            //开始拼装查询条件
            var predicate = Expressionable.Create<TCity>();

            //搜索条件查询语法参考Sqlsugar
            predicate = predicate.AndIF(!string.IsNullOrEmpty(parm.Citycode), it => it.Citycode.Contains(parm.Citycode));
            predicate = predicate.AndIF(!string.IsNullOrEmpty(parm.Cityname), it => it.Cityname.Contains(parm.Cityname));
            predicate = predicate.AndIF(!string.IsNullOrEmpty(parm.Provincecode), it => it.Provincecode.Contains(parm.Provincecode));
            var response = _TCityRepository
                .Queryable()
                .OrderBy("Citycode desc")
                .Where(predicate.ToExpression())
                .ToPage(parm);

            return response;
        }

        /// <summary>
        /// 添加城市信息
        /// </summary>
        /// <param name="parm"></param>
        /// <returns></returns>
        public int AddTCity(TCity parm)
        {
            var response = _TCityRepository.Insert(parm, it => new
            {
                it.Citycode,
                it.Cityname,
                it.Provincecode,
            });
            return response;
        }

       public (List<TCityDto>, int total) getTCityDtolist() {

            var (list ,total)= _TCityRepository.getTCityDtolist();


            return (list, total);
        }


		#endregion
	}
}