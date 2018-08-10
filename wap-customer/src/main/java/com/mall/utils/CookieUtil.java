/**
 * 
 */
package com.mall.utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StringUtils;

import com.mall.constant.CommonConstant;

/**
 * @author zhengqiang.shi 2014年9月4日 下午5:31:07
 */
public final class CookieUtil {

	private static final Logger log = LoggerFactory.getLogger(CookieUtil.class);
	
	public static String cookieDomain = "m.zhongjumall.com";
	public static String COOKIE_DOMAIN_PARENT = "m.zhongjumall.com";
	public static String cookiePath = "/";
	

	/**
	 * get cookie
	 * 
	 * @param request
	 * @param name
	 * @return
	 */
	public static Cookie getCookie(HttpServletRequest request, String name) {

		Cookie[] cookies = request.getCookies();
        if(cookies == null || cookies.length==0){
        	return null;
        }
        
		for (Cookie cookie : cookies) {
			if (name.equals(cookie.getName())) {
				return cookie;
			}
		}

		return null;
	}

	/**
	 * get cookie value
	 * @param request
	 * @param key
	 * @return
	 */
	public static String getCookieValue(HttpServletRequest request,String key) {
		
		/** 根据key获取Cookie值 */
		Cookie cart_Cookie = getCookie(request, key);

		/** Cookie为空时，返回Null */
		if (cart_Cookie == null || StringUtils.isEmpty(cart_Cookie.getValue())) {
			log.info("cookie cart is null and return null");
			return null;
		}

		/** 返回Cookie值 */
		return cart_Cookie.getValue();
		
	}
	
	/**
	 * 
	 * @Title: setCookie .
	 * @Description: TODO(setCookie)
	 * @param response
	 * @param name
	 * @param value
	 * @param maxAge
	 * @return void 返回类型
	 * @throws
	 */
	public static void setCookie(HttpServletResponse response, String... params) {

		Cookie cookie = new Cookie(params[0], params[1]);

		/** if the maxAge is not set, than default is one month */
		cookie.setMaxAge(StringUtils.isEmpty(params[2]) ? CommonConstant.MAX_AGE_ONE_MONTH
				: Integer.valueOf(params[2]));

		cookie.setPath(StringUtils.isEmpty(params[3]) ? CommonConstant.COOKIE_PATH
				: params[3]);// set the default general
													// path for cookie
		response.addCookie(cookie);
	}
	
	public static void setCookie(HttpServletResponse response, String name,
			String value, int maxAge) 
	{
		Cookie cookie = new Cookie(name, value);
		System.err.println("cookie++++++++"+maxAge);
		cookie.setMaxAge(maxAge);
		
		if(cookieDomain!=null && cookieDomain.indexOf('.')!=-1)
		{
			cookie.setDomain('.' + cookieDomain);
		}
		cookie.setPath(cookiePath);
		response.addCookie(cookie);
	}
	
	/**
     * 清除所有cookie.
     * @param req
     * @param res
     */
    public static void clear(HttpServletRequest reqest,HttpServletResponse response) {
        Cookie[] cookies = reqest.getCookies();
        for(int i = 0,len = cookies.length; i < len; i++) {
            Cookie cookie = new Cookie(cookies[i].getName(),null);
            cookie.setMaxAge(0);
            cookie.setPath("/");
            response.addCookie(cookie);
        }
    }
    /**
     * 
    * @Title: deleteCookie .
    * @Description: TODO(删除指定cookie) 
    * @param response
    * @param cookie void    返回类型  
    * @throws
     */
	public static void deleteCookie(HttpServletResponse response, Cookie cookie) {
		 if (cookie != null)
         {
                 cookie.setPath("/");
                 cookie.setMaxAge(-1);
                 response.addCookie(cookie);
         }
		
	}
	
    /**
     * 
    * @Title: deleteCookie .
    * @Description: TODO(立即删除指定cookie) 
    * @param response
    * @param cookie void    返回类型  
    * @throws
     */
	public static void deleteCookieNow(HttpServletResponse response, Cookie cookie) {
		 if (cookie != null)
         {
                 cookie.setPath("/");
                 cookie.setMaxAge(0);
                 response.addCookie(cookie);
         }
		
	}
    
	/**
	 * 设置cookie顶级域名，实现跨域请求
	 * @param response
	 * @param name
	 * @param value
	 * @param maxAge
	 */
	public static void setCookieParentDomain(HttpServletResponse response, String name,
			String value, int maxAge) 
	{
		Cookie cookie = new Cookie(name, value);
		cookie.setMaxAge(maxAge);
		cookie.setDomain(COOKIE_DOMAIN_PARENT);
		cookie.setPath(cookiePath);
		response.addCookie(cookie);
	}
   

}