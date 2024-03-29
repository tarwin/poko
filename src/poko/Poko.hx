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

package poko;


#if php

import haxe.Timer;
import htemplate.Template;
import php.Sys;
import poko.controllers.Controller;
import php.Lib;
import php.Session;
import php.Web;
import poko.system.Db;
import poko.system.Url;
import poko.utils.PhpTools;
import poko.utils.StringTools2;

import site.Config;

class Poko 
{
	public static var instance:Poko;
	
	public var url:Url;
	public var config:Config;
	public var controllerId:String;
	public var controller:Controller;
	public var params:Hash <Dynamic>;
	
	public var db(getDb, null):Db;
	private var __db:Db;
	
	public var sessionData:Hash<Dynamic>;
	
	public function new() 
	{
		var time1 = Timer.stamp();
		
		// for some reason we now have to kill the session before starting
		// Session seems to be automatically making itself started = true WTF ?
		Session.close();
		
		instance = this;
		
		PhpTools.setupTrace();
		
		config = new Config();
		config.init();
		
		if (config.development) {
			// show AND log errors
			untyped __call__('ini_set', 'display_errors', 1);
			untyped __php__("error_reporting(E_ALL ^ E_NOTICE);");
			untyped __call__('ini_set', 'log_errors', 1);
			untyped __php__("ini_set('error_log', dirname(__FILE__) . './error_log.txt');");
		}
		
		// -------------------------------------------
		// handle sessions, naming and saving of temp data
		if (Session.getName() != config.sessionName) 
		{
			Session.setName(config.sessionName);
		}
		
		Session.start();

		if (!Session.exists("pokodata"))
			sessionData = new Hash();
		else
			if (Std.is(Session.get("pokodata"), Hash))
				sessionData = Session.get("pokodata");
			else
				sessionData = new Hash();
		// -------------------------------------------
		
		params = Web.getParams();
		
		url = new Url(Web.getURI());
		
		controllerId = findControllerClass();	
		
		var controllerClass = Type.resolveClass( "site." + controllerId );
		//var controllerType = Type.resolveClass("site." + findControllerClass());
		
		var is404 = false;
		if (controllerClass != null)
		{
			controller = Type.createInstance(controllerClass, []) ; 
			if (Std.is(controller, Controller))
				controller.handleRequest();
			else 
				is404 = true;
		} else {
			is404 = true;
		}
			
		if (is404) Lib.print("<font color=\"red\"><b>404: Not a valid request</b></font>");
			
		
		Session.set("pokodata", sessionData);

		if (config.printProcessingTime){
			var time = Timer.stamp() - time1;
			Lib.print(time);
		}
	}
	
	private function setupForRewrite()
	{
		var requestUrl:String = null;
		try {
			requestUrl = untyped __var__('_SERVER', 'REDIRECT_URL');
		}catch (e:Dynamic) { }
		
		if (requestUrl != null){
			var r = requestUrl.split('/');
			var r2 = new Array();
			
			for (v in r)
				if (v != '') r2.push(v);
			// no key/val
			if (r2.length % 2 != 1) {
				trace("Invalid URL: change to 404 later ...");
				Sys.exit(1);
			}else {
				params.set('request', r2.shift());
				var c = 0;
				while (c < r2.length) {
					params.set(r2[c], r2[c + 1]);
					c += 2;
				}
			}
		}
	}
	
	private function setupForRouting()
	{
		// will make later if needed!
	}
	
	private function findControllerClass():String
	{
		if (params.get("request") == null && config.useShortRequest) params.set("request", params.get( "r" ));
		
		if (config.useUrlRewriting && params.get('request') == null) setupForRewrite();
		
		var c:String = url.getSegments()[0] != "" ? url.getSegments()[0] : params.get("request") != null ? params.get("request") : config.defaultController;

		if (c.lastIndexOf(".") != -1)
		{
			c = c.substr(0, c.lastIndexOf(".")+1) + c.substr(c.lastIndexOf(".")+1,1).toUpperCase() + c.substr(c.lastIndexOf(".")+2);
		} else {
			c = c.substr(0, 1).toUpperCase() + c.substr(1);
		}
		return c;
	}
	
	public function getDb()
	{
		if (config.useDb){
			if (__db == null) 
				__db = new Db();
			__db.connect(config.database_host, config.database_database, config.database_user, config.database_password, config.database_port);
			return __db;
		}else {
			return null;
		}
	}
	
	public function redirect(url:String)
	{
		controller.onFinal();
		
		Web.redirect(url);
		php.Sys.exit(1);
	}
	
	static function main()
	{
		new Poko();
	}
}



#elseif js

import js.Dom;
import js.Lib;
import poko.js.JsPoko;

class Poko
{
	static private var app:JsPoko;
	
	public static function main() 
	{
        app = new JsPoko();
		app.serverUrl = "http://localhost/fwork/";
		
		js.Lib.window.onload = run;
	}
	
	public static function run(e:Event)
	{
		app.run();
	}
}

#end