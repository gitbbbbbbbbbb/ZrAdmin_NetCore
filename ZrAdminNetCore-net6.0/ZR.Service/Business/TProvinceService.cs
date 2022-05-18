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
    /// 省份表Service业务层处理
    ///
    /// @author zr
    /// @date 2022-05-17
    /// </summary>
    [AppService(ServiceType = typeof(ITProvinceService), ServiceLifetime = LifeTime.Transient)]
    public class TProvinceService : BaseService<TProvince>, ITProvinceService
    {
        private readonly TProvinceRepository _TProvinceRepository;
        public TProvinceService(TProvinceRepository repository)
        {
            _TProvinceRepository = repository;
        }

        #region 业务逻辑代码

        /// <summary>
        /// 查询省份表列表
        /// </summary>
        /// <param name="parm"></param>
        /// <returns></returns>
        public PagedInfo<TProvince> GetList(TProvinceQueryDto parm)
        {
            //开始拼装查询条件
            var predicate = Expressionable.Create<TProvince>();

            //搜索条件查询语法参考Sqlsugar
            predicate = predicate.AndIF(!string.IsNullOrEmpty(parm.Provincecode), it => it.Provincecode.Contains(parm.Provincecode));
            predicate = predicate.AndIF(!string.IsNullOrEmpty(parm.Provincename), it => it.Provincename.Contains(parm.Provincename));
            predicate = predicate.AndIF(!string.IsNullOrEmpty(parm.LastBy), it => it.LastBy.Contains(parm.LastBy));
            var response = _TProvinceRepository
                .Queryable()
                .OrderBy("Provincecode desc")
                .Where(predicate.ToExpression())
                .ToPage(parm);

            return response;
        }

        /// <summary>
        /// 添加省份表
        /// </summary>
        /// <param name="parm"></param>
        /// <returns></returns>
        public int AddTProvince(TProvince parm)
        {
            var response = _TProvinceRepository.Insert(parm, it => new
            {
                it.Provincecode,
                it.Provincename,
                it.LastBy,
            });
            return response;
        }
        #endregion
    }
}