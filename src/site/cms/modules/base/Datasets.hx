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

package site.cms.modules.base;

import haxe.Serializer;
import haxe.Unserializer;
import php.Exception;
import poko.Poko;
import poko.form.elements.Button;
import poko.form.elements.Input;
import poko.form.elements.Selectbox;
import poko.form.Form;
import poko.form.FormElement;
import poko.controllers.HtmlController;
import php.Web;
import site.cms.common.Tools;
import site.cms.modules.base.helper.MenuDef;
import site.cms.templates.CmsTemplate;

class Datasets extends DatasetBase
{
	public var data:List<Dynamic>;
	
	public function new() 
	{
		super();
	}
	
	override public function main()
	{
		if (app.params.get("manage") == null)
		{
			var str = "";
			
			if (user.isAdmin() || user.isSuper())
				str += poko.views.renderers.Templo.parse("cms/modules/base/blocks/datasets.mtt",{});
			
			setContentOutput(str);
			
			setupLeftNav();
			return;
		}
		
		// Managment is done in the definitions page
	}
}

class DatasetBase extends CmsTemplate
{
	public var pagesMode:Bool;
	public var siteMode:Bool;
	public var linkMode:Bool;
	
	public var siteView:MenuDef;
	public var siteViewHidden:MenuDef;
	
	public var siteViewSerialized:String;
	public var siteViewHiddenSerialized:String;
	
	override public function init()
	{
		super.init();
		
		if (app.params.get("manage") != null) {
			authenticationRequired = ["cms_admin", "cms_manager"];
		}
		
		linkMode = app.params.get("linkMode") == "true";
		pagesMode = app.params.get("pagesMode") == "true";
		siteMode = app.params.get("siteMode") == "true" || siteMode;
		
		if (pagesMode) 
		{
			navigation.pageHeading = "Pages";
			navigation.setSelected("Pages");
		} else  {
			navigation.pageHeading = "Datasets"; 
			navigation.setSelected("Datasets");
		}
		if (siteMode) {
			navigation.pageHeading = "Site"; 
			navigation.setSelected("SiteView");				
		}
	}
	
	private function setupLeftNav():Void
	{
		var isAdmin = user.isAdmin();
		
		if (pagesMode && !siteMode) 
		{
			var pages = app.db.request("SELECT *, p.id as pid FROM `_pages` p, `_definitions` d WHERE p.definitionId=d.id ORDER BY d.`order`");
			
			leftNavigation.addSection("Pages");

			for (page in pages) {
				if ( !isAdmin )
					leftNavigation.addLink("Pages", page.name, "cms.modules.base.DatasetItem&pagesMode=true&action=edit&id=" + page.pid, page.indents);
				else
					leftNavigation.addLink("Pages", page.name, "cms.modules.base.DatasetItem&pagesMode=true&action=edit&id=" + page.pid, page.indents, false,
						leftNavigation.editTag("cms.modules.base.Definition&id=" + page.id + "&pagesMode=true") );
			}
			
			if (user.isAdmin() || user.isSuper())
				leftNavigation.footer = "<a href=\"?request=cms.modules.base.Definitions&manage=true&pagesMode=true\">Manage Pages</a>";
				
		} else if (siteMode) { 
			
			var pages = app.db.request("SELECT *, p.id as pid FROM `_pages` p, `_definitions` d WHERE p.definitionId=d.id ORDER BY d.`order`");
			var tables = app.db.request("SELECT * FROM `_definitions` d WHERE d.isPage='0' ORDER BY `order`");
			
			var siteViewData:String = app.db.requestSingle("SELECT `value` FROM `_settings` WHERE `key`='siteView'").value;
			var menu:MenuDef = new MenuDef();
	
			siteView = new MenuDef();
			
			try {
				menu = Unserializer.run(siteViewData);
			}catch (e:Dynamic) {
			}

			if (menu.headings.length == 0) {
				leftNavigation.addSection("ERROR");
				leftNavigation.addLink("ERROR", ">> Manage", "cms.modules.base.SiteView&manage=true");
			}else {
				for (heading in menu.headings) {
					leftNavigation.addSection(heading.name, heading.isSeperator);
					if(!heading.isSeperator){
						siteView.addHeading(heading.name);
					}else {
						siteView.addSeperator();
					}
				}
				
				// go through menu items and make sure they still exist in DB, otherwise just ignore them and they'll be removed on the next save!
				for (item in menu.items) {
					switch(item.type) {
						case MenuItemType.PAGE_ROLL: // ???
						case MenuItemType.DATASET:
							// if it exists as a table, otherwise ignore it
							if(Lambda.exists(tables, function(x){
								return(x.id == item.id);
							})) {
								// add to nav
								var link = "cms.modules.base.Dataset&dataset=" + item.id + "&resetState=true&siteMode=true";
								// Add [e] edit link if user is admin
								var editTag = isAdmin ? leftNavigation.editTag( "cms.modules.base.Definition&id=" + item.id + "&pagesMode=false" ) : '';
								leftNavigation.addLink(item.heading, item.name, link, item.indent, false, editTag);
								
								if (item.listChildren != null) {
									// get dataset
									
									var def:site.cms.common.Definition = new site.cms.common.Definition(item.id);
									var el = def.getElement(item.listChildren);
									if (el != null && el.type == "association") {
										var p = el.properties;
										var primaryData = app.db.request("SHOW COLUMNS FROM `"+p.table+"` WHERE `Key`='PRI' AND `Extra`='auto_increment'");
										if (primaryData.length > 0) {
											var primaryKey = primaryData.pop().Field;
											var sql = "SELECT `" + primaryKey + "` AS 'k', `" + p.name + "` AS 'v' FROM `" + p.table + "`";
											var result = app.db.request(sql);
											var tIndent = item.indent + 1;
											for (row in result)
											{
												leftNavigation.addLink(item.heading, row.v, link+"&autofilterBy="+p.name+"&autofilterByAssoc="+row.k+"", tIndent);
											}
										}
									}
								}
								
								// remove from tables list
								tables = Lambda.filter(tables, function(x)
								{
									return x.id != item.id;
								});
								
								// add to printing list
								siteView.addItem(item.id, item.type, item.name, item.heading, item.indent, item.listChildren);
							}
						case MenuItemType.PAGE:
							/*if(Lambda.exists(pages, function(x){
								return(x.pid == item.id);
							})) {*/
							var page = null;
							for ( p in pages )
							{
								if ( p.pid == item.id )
								{
									page = p;
									break;
								}
							}
							if ( page != null )
							{
								// add to nav
								var link = "cms.modules.base.DatasetItem&pagesMode=true&action=edit&id=" + item.id + "&siteMode=true";
								var editTag = isAdmin ? leftNavigation.editTag("cms.modules.base.Definition&id=" + page.id + "&pagesMode=true") : "";
								leftNavigation.addLink(item.heading, item.name, link, item.indent, false, editTag);
								
								// remove from pages list
								pages = Lambda.filter(pages, function(x)
								{
									return x.pid != item.id;
								});
								
								// add to printing list
								siteView.addItem(item.id, item.type, item.name, item.heading, item.indent, item.listChildren);
							}
						case MenuItemType.NULL:
							if (item.linkChild != null) {
								// add to nav
								var link = "cms.modules.base.DatasetItem&action=edit&siteMode=true&singleInstanceEdit=true&dataset="+item.linkChild.dataset+"&id="+item.linkChild.id+"";
								leftNavigation.addLink(item.heading, item.name, link, item.indent);
								// add to printing list
								siteView.addItem(item.id, item.type, item.name, item.heading, item.indent, null, item.linkChild);
							}else {
								// add to nav
								leftNavigation.addLink(item.heading, item.name, null, item.indent);
								// add to printing list
								siteView.addItem(item.id, item.type, item.name, item.heading, item.indent);								
							}
					}
				}
			}
			
			// add the non-shown stuff
			siteViewHidden = new MenuDef();
			for (item in tables) {
				siteViewHidden.addItem(item.id, MenuItemType.DATASET, item.name);
			}
			for (item in pages) {
				siteViewHidden.addItem(item.pid, MenuItemType.PAGE, item.name);
			}
			
			siteViewSerialized = Serializer.run(siteView);
			siteViewHiddenSerialized = Serializer.run(siteViewHidden);
			
			if (user.isAdmin() || user.isSuper())
				leftNavigation.footer = "<a href=\"?request=cms.modules.base.SiteView&manage=true\">Manage Menu</a>";
			
		}else {
			
			var tables:List <Dynamic> = app.db.request("SELECT * FROM `_definitions` d WHERE d.isPage='0' ORDER BY `order`");
			
			// build the nav
			leftNavigation.addSection("Datasets");
			
			var isAdmin = user.isAdmin();
			
			//var def:Dynamic = Definition;
			for (table in tables)
			{
				if(table.showInMenu){
					var name = table.name != "" ? table.name : table.table;
					if ( isAdmin )
						leftNavigation.addLink("Datasets", name, "cms.modules.base.Dataset&dataset=" + table.id + "&resetState=true", table.indents, false, 
							leftNavigation.editTag("cms.modules.base.Definition&id=" + table.id + "&pagesMode=false") );
					else
						leftNavigation.addLink("Datasets", name, "cms.modules.base.Dataset&dataset=" + table.id + "&resetState=true", table.indents);
				}
			}
			
			if (user.isAdmin() || user.isSuper())
				leftNavigation.footer = "<a href=\"?request=cms.modules.base.Definitions&manage=true\">Manage Lists</a>";
		}
	}
}
