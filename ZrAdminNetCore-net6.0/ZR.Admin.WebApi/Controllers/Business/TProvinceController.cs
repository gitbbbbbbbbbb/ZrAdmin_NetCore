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
    /// 省份表Controller
    /// 
    /// @tableName t_province
    /// @author zr
    /// @date 2022-05-17
    /// </summary>
    [Verify]
    [Route("business/TProvince")]
    public class TProvinceController : BaseController
    {
        /// <summary>
        /// 省份表接口
        /// </summary>
        private readonly ITProvinceService _TProvinceService;

        public TProvinceController(ITProvinceService TProvinceService)
        {
            _TProvinceService = TProvinceService;
        }

        /// <summary>
        /// 查询省份表列表
        /// </summary>
        /// <param name="parm"></param>
        /// <returns></returns>
        [HttpGet("list")]
        [ActionPermissionFilter(Permission = "business:tprovince:list")]
        public IActionResult QueryTProvince([FromQuery] TProvinceQueryDto parm)
        {
            var response = _TProvinceService.GetList(parm);
            return SUCCESS(response);
        }


        /// <summary>
        /// 查询省份表详情
        /// </summary>
        /// <param name="Id"></param>
        /// <returns></returns>
        [HttpGet("{Id}")]
        [ActionPermissionFilter(Permission = "business:tprovince:query")]
        public IActionResult GetTProvince(int Id)
        {
            var response = _TProvinceService.GetFirst(x => x.Id == Id);
            
            return SUCCESS(response);
        }

        /// <summary>
        /// 添加省份表
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        [ActionPermissionFilter(Permission = "business:tprovince:add")]
        [Log(Title = "省份表", BusinessType = BusinessType.INSERT)]
        public IActionResult AddTProvince([FromBody] TProvinceDto parm)
        {
            if (parm == null)
            {
                throw new CustomException("请求参数错误");
            }
            //从 Dto 映射到 实体
            var modal = parm.Adapt<TProvince>().ToCreate(HttpContext);

            var response = _TProvinceService.AddTProvince(modal);

            return ToResponse(response);
        }

        /// <summary>
        /// 更新省份表
        /// </summary>
        /// <returns></returns>
        [HttpPut]
        [ActionPermissionFilter(Permission = "business:tprovince:edit")]
        [Log(Title = "省份表", BusinessType = BusinessType.UPDATE)]
        public IActionResult UpdateTProvince([FromBody] TProvinceDto parm)
        {
            if (parm == null)
            {
                throw new CustomException("请求实体不能为空");
            }
            //从 Dto 映射到 实体
            var modal = parm.Adapt<TProvince>().ToUpdate(HttpContext);

            var response = _TProvinceService.Update(w => w.Id == modal.Id, it => new TProvince()
            {
                //Update 字段映射
                Provincecode = modal.Provincecode,
                Provincename = modal.Provincename,
                LastBy = modal.LastBy,
            });

            return ToResponse(response);
        }

        /// <summary>
        /// 删除省份表
        /// </summary>
        /// <returns></returns>
        [HttpDelete("{ids}")]
        [ActionPermissionFilter(Permission = "business:tprovince:delete")]
        [Log(Title = "省份表", BusinessType = BusinessType.DELETE)]
        public IActionResult DeleteTProvince(string ids)
        {
            int[] idsArr = Tools.SpitIntArrary(ids);
            if (idsArr.Length <= 0) { return ToResponse(ApiResult.Error($"删除失败Id 不能为空")); }

            var response = _TProvinceService.Delete(idsArr);

            return ToResponse(response);
        }

        /// <summary>
        /// 导出省份表
        /// </summary>
        /// <returns></returns>
        [Log(Title = "省份表", BusinessType = BusinessType.EXPORT, IsSaveResponseData = false)]
        [HttpGet("export")]
        [ActionPermissionFilter(Permission = "business:tprovince:export")]
        public IActionResult Export([FromQuery] TProvinceQueryDto parm)
        {
            parm.PageSize = 10000;
            var list = _TProvinceService.GetList(parm).Result;

            string sFileName = ExportExcel(list, "TProvince", "省份表");
            return SUCCESS(new { path = "/export/" + sFileName, fileName = sFileName });
        }

    }
}