using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Jquery
{
    /// <summary>
    /// test 的摘要说明
    /// </summary>
    public class test : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            List<string> keys = new List<string>();
            keys.AddRange(context.Request.Form.AllKeys);
            keys.AddRange(context.Request.QueryString.AllKeys);
            string txt = string.Empty;
            foreach (string key in keys)
            {
                txt += key + "=" + context.Request[key] + "<br/>";
            }


            context.Response.Write(txt);
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}