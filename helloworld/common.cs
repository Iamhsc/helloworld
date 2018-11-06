﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace helloworld
{
    public class common
    {
        /// <summary>
        /// 当前时间戳
        /// </summary>
        /// <returns></returns>
        public static long GetTimeStamp()
        {

            TimeSpan ts = DateTime.UtcNow - new DateTime(1970, 1, 1, 0, 0, 0, 0);

            return Convert.ToInt64(ts.TotalSeconds);
        }

    }
}