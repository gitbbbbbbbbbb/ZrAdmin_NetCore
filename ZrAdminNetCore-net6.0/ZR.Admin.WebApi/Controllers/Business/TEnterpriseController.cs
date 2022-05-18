using Infrastructure;
using Infrastructure.Attribute;
using Infrastructure.Enums;
using Infrastructure.Model;
using Mapster;
using Microsoft.AspNetCore.Mvc;
using ZR.Model.Dto;
using ZR.Model.Models;
using ZR.Service.Business.IBusinessService;
using ZR.Admin.WebApi.Extensions;
using ZR.Admin.WebApi.Filters;
using ZR.Common;

namespace ZR.Admin.WebApi.Controllers
{
    /// <summary>
    /// 组织机构表Controller
    /// 
    /// @tableName t_enterprise
    /// @author zr
    /// @date 2022-05-16
    /// </summary>
    [Verify]
    [Route("business/TEnterprise")]
    public class TEnterpriseController : BaseController
    {
        /// <summary>
        /// 组织机构表接口
        /// </summary>
        private readonly ITEnterpriseService _TEnterpriseService;

        public TEnterpriseController(ITEnterpriseService TEnterpriseService)
        {
            _TEnterpriseService = TEnterpriseService;
        }

        /// <summary>
        /// 查询组织机构表列表
        /// </summary>
        /// <param name="parm"></param>
        /// <returns></returns>
        [HttpGet("list")]
        [ActionPermissionFilter(Permission = "business:tenterprise:list")]
        public IActionResult QueryTEnterprise([FromQuery] TEnterpriseQueryDto parm)
        {
            var response = _TEnterpriseService.GetList(parm);
            return SUCCESS(response);
        }


        /// <summary>
        /// 查询组织机构表详情
        /// </summary>
        /// <param name="Id"></param>
        /// <returns></returns>
        [HttpGet("{Id}")]
        [ActionPermissionFilter(Permission = "business:tenterprise:query")]
        public IActionResult GetTEnterprise(int Id)
        {
            var response = _TEnterpriseService.GetFirst(x => x.Id == Id);
            
            return SUCCESS(response);
        }

        /// <summary>
        /// 添加组织机构表
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        [ActionPermissionFilter(Permission = "business:tenterprise:add")]
        [Log(Title = "组织机构表", BusinessType = BusinessType.INSERT)]
        public IActionResult AddTEnterprise([FromBody] TEnterpriseDto parm)
        {
            if (parm == null)
            {
                throw new CustomException("请求参数错误");
            }
            //从 Dto 映射到 实体
            var modal = parm.Adapt<TEnterprise>().ToCreate(HttpContext);

            var response = _TEnterpriseService.AddTEnterprise(modal);

            return ToResponse(response);
        }

        /// <summary>
        /// 更新组织机构表
        /// </summary>
        /// <returns></returns>
        [HttpPut]
        [ActionPermissionFilter(Permission = "business:tenterprise:edit")]
        [Log(Title = "组织机构表", BusinessType = BusinessType.UPDATE)]
        public IActionResult UpdateTEnterprise([FromBody] TEnterpriseDto parm)
        {
            if (parm == null)
            {
                throw new CustomException("请求实体不能为空");
            }
            //从 Dto 映射到 实体
            var modal = parm.Adapt<TEnterprise>().ToUpdate(HttpContext);

            var response = _TEnterpriseService.Update(w => w.Id == modal.Id, it => new TEnterprise()
            {
                //Update 字段映射
                Enterprisetype = modal.Enterprisetype,
                Enterprisename = modal.Enterprisename,
                Province = modal.Province,
                City = modal.City,
                County = modal.County,
                Address = modal.Address,
                Zipcode = modal.Zipcode,
                Tel = modal.Tel,
                Leader = modal.Leader,
                Rem = modal.Rem,
            });

            return ToResponse(response);
        }

        /// <summary>
        /// 删除组织机构表
        /// </summary>
        /// <returns></returns>
        [HttpDelete("{ids}")]
        [ActionPermissionFilter(Permission = "business:tenterprise:delete")]
        [Log(Title = "组织机构表", BusinessType = BusinessType.DELETE)]
        public IActionResult DeleteTEnterprise(string ids)
        {
            int[] idsArr = Tools.SpitIntArrary(ids);
            if (idsArr.Length <= 0) { return ToResponse(ApiResult.Error($"删除失败Id 不能为空")); }

            var response = _TEnterpriseService.Delete(idsArr);

            return ToResponse(response);
        }


    }
}