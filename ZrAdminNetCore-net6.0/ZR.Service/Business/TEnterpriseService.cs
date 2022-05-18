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
    /// 组织机构表Service业务层处理
    ///
    /// @author zr
    /// @date 2022-05-16
    /// </summary>
    [AppService(ServiceType = typeof(ITEnterpriseService), ServiceLifetime = LifeTime.Transient)]
    public class TEnterpriseService : BaseService<TEnterprise>, ITEnterpriseService
    {
        private readonly TEnterpriseRepository _TEnterpriseRepository;
        public TEnterpriseService(TEnterpriseRepository repository)
        {
            _TEnterpriseRepository = repository;
        }

        #region 业务逻辑代码

        /// <summary>
        /// 查询组织机构表列表
        /// </summary>
        /// <param name="parm"></param>
        /// <returns></returns>
        public PagedInfo<TEnterprise> GetList(TEnterpriseQueryDto parm)
        {
            //开始拼装查询条件
            var predicate = Expressionable.Create<TEnterprise>();

            //搜索条件查询语法参考Sqlsugar
            predicate = predicate.AndIF(!string.IsNullOrEmpty(parm.Enterprisename), it => it.Enterprisename.Contains(parm.Enterprisename));
            var response = _TEnterpriseRepository
                .Queryable()
                .Where(predicate.ToExpression())
                .ToPage(parm);

            return response;
        }

        /// <summary>
        /// 添加组织机构表
        /// </summary>
        /// <param name="parm"></param>
        /// <returns></returns>
        public int AddTEnterprise(TEnterprise parm)
        {
            var response = _TEnterpriseRepository.Insert(parm, it => new
            {
                it.Enterpriseid,
                it.Enterprisetype,
                it.Enterprisename,
                it.Province,
                it.City,
                it.County,
                it.Address,
                it.Zipcode,
                it.Tel,
                it.Leader,
                it.Rem,
            });
            return response;
        }
        #endregion
    }
}