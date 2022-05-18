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
    /// 城市信息Controller
    /// 
    /// @tableName t_city
    /// @author zr
    /// @date 2022-05-17
    /// </summary>
    [Verify]
    [Route("business/TCity")]
    public class TCityController : BaseController
    {
        /// <summary>
        /// 城市信息接口
        /// </summary>
        private readonly ITCityService _TCityService;

        public TCityController(ITCityService TCityService)
        {
            _TCityService = TCityService;
        }

        /// <summary>
        /// 查询城市信息列表
        /// </summary>
        /// <param name="parm"></param>
        /// <returns></returns>
        [HttpGet("list")]
        [ActionPermissionFilter(Permission = "business:tcity:list")]
        public IActionResult QueryTCity([FromQuery] TCityQueryDto parm)
        {
            var response = _TCityService.GetList(parm);
            return SUCCESS(response);
        }


        /// <summary>
        /// 查询城市信息详情
        /// </summary>
        /// <param name="Id"></param>
        /// <returns></returns>
        [HttpGet("{Id}")]
        [ActionPermissionFilter(Permission = "business:tcity:query")]
        public IActionResult GetTCity(int Id)
        {
            var response = _TCityService.GetFirst(x => x.Id == Id);
            
            return SUCCESS(response);
        }

        /// <summary>
        /// 添加城市信息
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        [ActionPermissionFilter(Permission = "business:tcity:add")]
        [Log(Title = "城市信息", BusinessType = BusinessType.INSERT)]
        public IActionResult AddTCity([FromBody] TCityDto parm)
        {
            if (parm == null)
            {
                throw new CustomException("请求参数错误");
            }
            //从 Dto 映射到 实体
            var modal = parm.Adapt<TCity>().ToCreate(HttpContext);

            var response = _TCityService.AddTCity(modal);

            return ToResponse(response);
        }

        /// <summary>
        /// 更新城市信息
        /// </summary>
        /// <returns></returns>
        [HttpPut]
        [ActionPermissionFilter(Permission = "business:tcity:edit")]
        [Log(Title = "城市信息", BusinessType = BusinessType.UPDATE)]
        public IActionResult UpdateTCity([FromBody] TCityDto parm)
        {
            if (parm == null)
            {
                throw new CustomException("请求实体不能为空");
            }
            //从 Dto 映射到 实体
            var modal = parm.Adapt<TCity>().ToUpdate(HttpContext);

            var response = _TCityService.Update(w => w.Id == modal.Id, it => new TCity()
            {
                //Update 字段映射
                Citycode = modal.Citycode,
                Cityname = modal.Cityname,
                Provincecode = modal.Provincecode,
            });

            return ToResponse(response);
        }

        /// <summary>
        /// 删除城市信息
        /// </summary>
        /// <returns></returns>
        [HttpDelete("{ids}")]
        [ActionPermissionFilter(Permission = "business:tcity:delete")]
        [Log(Title = "城市信息", BusinessType = BusinessType.DELETE)]
        public IActionResult DeleteTCity(string ids)
        {
            int[] idsArr = Tools.SpitIntArrary(ids);
            if (idsArr.Length <= 0) { return ToResponse(ApiResult.Error($"删除失败Id 不能为空")); }

            var response = _TCityService.Delete(idsArr);

            return ToResponse(response);
        }

        /// <summary>
        /// 导出城市信息
        /// </summary>
        /// <returns></returns>
        [Log(Title = "城市信息", BusinessType = BusinessType.EXPORT, IsSaveResponseData = false)]
        [HttpGet("export")]
        [ActionPermissionFilter(Permission = "business:tcity:export")]
        public IActionResult Export([FromQuery] TCityQueryDto parm)
        {
            parm.PageSize = 10000;
            var list = _TCityService.GetList(parm).Result;

            string sFileName = ExportExcel(list, "TCity", "城市信息");
            return SUCCESS(new { path = "/export/" + sFileName, fileName = sFileName });
        }
	

        /// <summary>
        /// 城市列表界面查询
        /// </summary>
        /// <returns></returns>
			[HttpGet("getTCityDtolist")]
	
		public IActionResult getTCityDtolist()
		{
			

			var (citylist, total) = _TCityService.getTCityDtolist();
			

            return SUCCESS(new { citylist= citylist,total=total });
		}


	}
}