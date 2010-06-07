/*
 * Copyright (c) 2008, TouchMyPixel & contributors
 * Original author : Tony Polinelli
 * Contributors:
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

package;

import php.db.Mysql;
import poko.Application;
import poko.utils.PhpTools;
import haxe.Timer;
import php.Lib;
import php.Web;

import site.cms.ImportAll;
import site.examples.ImportAll;


import site.services.Rss;
import site.services.XmlData;
import site.services.Image;

import site.Index;

/*
class Test 
{
	
	public function new() 
	{
		//Hash
		var hash = new Hash();
		hash.set("a", 1);
		hash.set("b", 2);
		for (item in hash.keys())
			trace(item);
		
		for (item in hash)
			trace(item);
			
		//HList
		//_hx_list_iterator
		var list = new List();
		list.add("a");
		list.add("b");
		
		for (item in list)
			trace(item);
		
		//_hx_array
		//_hx_array_iterator
		var array = ["a", "b"];
		for (item in array)
			trace(item);
		
		//IntHash
		var intHash = new IntHash();
		intHash.set(1, "a");
		intHash.set(2, "b");
		for (item in intHash)
			trace(item);
		
	}
	
	public function toString()
	{
		return "toString on Test1";
	}
}
*/

class Main 
{
	static private var app:Application;
	
	public static function main() 
	{	
		init(false);
	}
	
	public static function init(?phpMode:Bool=true)
	{
		PhpTools.setupTrace();
		
		
	//	Type.createInstance(Type.resolveClass("Test"),[]);
		
		app = new Application();
		
		//app.sitePath = "http://localhost/joshmurray_texstyle/SITE/www";
		app.sitePath = "";
		app.siteRoot = ".";
		app.uploadFolder = app.siteRoot + "/res/uploads";
		app.sitePackage = "site";
		app.packageRoot = app.siteRoot;
		
		app.skipAuthentication = false;		
		app.debug = true;
		app.sessionName = "pokocms";
			
		
		if (app.debug) 
		{
			execute(phpMode);
		} 
		else 
		{
			try {
				execute(phpMode);	
			}
			catch (e:Dynamic){	
				Lib.print("<span style='color:#ff0000'><b>Sorry the site has died.</b></span> <br/> Please report the error to: <b>" + app.errorContactEmail + "</b>");
			}
		}
	}		
	
	public static function execute(phpMode:Bool)
	{
		try {
			switch(Web.getHostName())
			{
				case "staging.touchmypixel.com":
					//app.db.connect("xxx", "xxx", "xxx", "xxx");
				default:
					app.db.connect("192.168.1.80", "poko", "root", "");
			}
			
			
		} catch (e:Dynamic)
		{
			var s = "<span style='color:#ff0000'><b>Database Connection Error: " + e + "</b></span><br/>Please edit the database settings in your applications main '.hx' file<br/>";
			
			if (app.debug) 
			{
				php.Lib.print(s);
				php.Sys.exit(1);
			}
			else throw (e);
		}
		
		if(!phpMode) app.execute();
	}
}