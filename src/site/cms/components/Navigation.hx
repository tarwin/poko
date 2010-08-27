/*
 * Copyright (c) 2008, TouchMyPixel & contributors
 * Original author : Tony Polinelli <tonyp@touchmypixel.com> 
 * Contributers: Tarwin Stroh-Spijer 
 * All rights reserved.
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 *   - Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 *   - Redistributions in binary form must reproduce the above copyright
 *     notice, this list of conditions and the following disclaimer in the
 *     documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE TOUCH MY PIXEL & CONTRIBUTERS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE TOUCH MY PIXEL & CONTRIBUTORS
 * BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
 * THE POSSIBILITY OF SUCH DAMAGE.
 */

package site.cms.components;

import haxe.Stack;
import poko.system.Component;
import php.Web;
import site.cms.CmsController;

class Navigation extends Component
{
	public var pageHeading:String;
	public var content:String;
	private var selected:String;
	public var userName:String;
	
	override public function init()
	{
		var name:String = app.params.get("request");
		name = name.substr(name.lastIndexOf(".") + 1);
		
		pageHeading = "page";
		
		//setSelected(name);
	}
	
	override public function main() 
	{
		var requests = new Hash();
		//requests.set("Home", "Home");
		
		var cmsController:CmsController = cast app.controller;
		
		if(cmsController.user.authenticated){
			var contentExtra = "";
			
			if (cmsController.user.isSuper()) {
				requests.set("modules.base.Pages", "Pages");
				requests.set("modules.base.Datasets", "Data");
				requests.set("modules.base.DbBackup", "Backup");
				requests.set("modules.base.SiteView", "Site View");
				requests.set("modules.media.Index", "Media");
				requests.set("modules.base.Settings", "Settings");
				requests.set("modules.base.SiteView", "Site Map");
				requests.set("modules.base.Users", "Users");
				requests.set("modules.help.Help", "Help");
			}else if (cmsController.user.isAdmin()) {
				requests.set("modules.base.SiteView", "Site View");
				requests.set("modules.base.SiteView", "Site Map");
				requests.set("modules.base.Users", "Users");
			}else{
				requests.set("modules.base.SiteView", "Site Map");
			}
			
			requests.set("modules.email.Index", "Email");
			
			requests.set("modules.base.ChangePassword", "Password");
			
			content = "<ul id=\"headingNavigation\">\n";

			for (request in requests.keys())
			{
				var parts = request.split(".");
				if (parts[parts.length-1] == selected)
				{
					content += "<li><a href=\"?request=cms."+request+"\" class=\"navigation_selected\">" + requests.get(request) + "</a></li>\n";
				} else {
					content += "<li><a href=\"?request=cms."+request+"\">"+requests.get(request)+"</a></li>\n";
				}
			}
			
			content += "</ul>\n";
			content += contentExtra;
			
			userName = cmsController.user.name;
		}else {
			content = null;
		}
	}
	
	public function setSelected(id:String)
	{
		selected = id;
	}
	
}
