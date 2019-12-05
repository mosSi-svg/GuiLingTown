using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Jquery
{
    /// <summary>
    /// _6_1 的摘要说明
    /// </summary>
    public class _6_1 : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/xml";
            string timespan = context.Request["time"];
         
            string name = context.Request["name"];
            string msg = context.Request["message"];
            string action = context.Request["action"];
            if (!string.IsNullOrEmpty(name))
            {
                Data.Add(new Message { Id = id, user = name, message = msg, time = DateTime.Now });
            }
            List<Message> query = new List<Message>(); ;
            
          
            if (timespan == "0")
                query = Data;
            else
                query = Data.Where(c => (c.time - DateTime.Parse(timespan)).Ticks / 10000000>0).ToList();
            string statu = query.Count > 0 ? "1" : "2";
            string xml = "<?xml version='1.0' encoding='UTF-8'?><response><status>" + statu + "</status><time>" + DateTime.Now.ToString()
                + "</time>{0}</response>";
            string message = string.Empty;
            foreach (var item in query)
            {
                message += "<message><author>" + item.user + "</author><text>" + item.message + "</text></message>";
            }
    
            xml = string.Format(xml,message);
            context.Response.Write(xml);
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
        class Message
        {
            public int Id { set; get; }
            public string user { set; get; }
            public string message { set; get; }
            public DateTime time { set; get; }
        }

        List<Message> Data
        {
            get
            {
                if (HttpRuntime.Cache["data"] == null)
                    HttpRuntime.Cache["data"] = new List<Message>();
                return (List<Message>)HttpRuntime.Cache["data"];
            }
        }
        int id
        {
            get
            {
                if (HttpRuntime.Cache["id"] == null)
                    HttpRuntime.Cache["id"] = 0;
                HttpRuntime.Cache["id"] = (int)HttpRuntime.Cache["id"] + 1;
                return (int)HttpRuntime.Cache["id"];
            }
        }
    }
}