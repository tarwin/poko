/*
 * Copyright (c) 2008, TouchMyPixel & contributors
 * Original author : Tarwin Stroh-Spijer <tarwin@touchmypixel.com>
 * Contributors: Tony Polinelli
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

package site.cms.modules.base.js;

import poko.js.JsRequest;
import haxe.Serializer;
import haxe.Unserializer;
import js.Lib;

class JsKeyValueInput extends JsRequest
{	
	public var valueHolder:JQuery;
	public var table:JQuery;
	public var properties:Dynamic;
	public var id:String;
	
	override public function main()
	{
	}
	
	public function setupKeyValueInput(id, properties:String)
	{
		this.id = id;
		this.properties = properties;
		
		valueHolder = new JQuery("#" + id);
		table = new JQuery("#" + id + "_keyValueTable");
		var val = valueHolder.val();
		var data:Array<KeyValuePair> = [];
		if (val != "") 
			data = Unserializer.run(val);
		
		if (data.length != 0) {
			var remove = false;
			for (item in data) {
				addKeyValueInput(item.key, item.value, remove);
				remove = true;
			}
		}else {
			addKeyValueInput("", "", false);
		}
	}
	
	public function addKeyValueInput(?keyValue:String = "", ?valueValue:String = "", removeable:Bool = true)
	{
		var keyElement = properties.keyIsMultiline == "1" ? JQuery.create('textarea', { style:"height:"+properties.keyHeight+"px; width:"+properties.keyWidth+"px;" }, [keyValue] ) : JQuery.create('input', { type:"text", value:keyValue, style:"width:"+properties.keyWidth+"px;" }, [] );
		var valueElement = properties.valueIsMultiline == "1" ? JQuery.create('textarea', { style:"height:"+properties.valueHeight+"px; width:"+properties.valueWidth+"px;" }, [valueValue] ) : JQuery.create('input', { type:"text", value:valueValue, style:"width:"+properties.valueWidth+"px;" }, [] );
		var removeElement = removeable ? JQuery.create('a', { href:"#", onclick: getRawCall("removeKeyValueInput(this)") + "; return(false);" }, "remove") : null;
		
		new JQuery("#" + id + "_keyValueTable tr:last").after(
			JQuery.create('tr', { }, [
				JQuery.create('td', { valign:"top" }, [keyElement]),
				JQuery.create('td', { valign:"top" }, [valueElement]),
				JQuery.create('td', { valign:"top" }, [removeElement])
			])
		);
	}
	
	public function removeKeyValueInput(link)
	{
		new JQuery(link).parent().parent().remove();
	}
	
	public function flushKeyValueInputs()
	{
		var data:Array<KeyValuePair> = [];
		
		new JQuery("#" + id + "_keyValueTable tr").each(function(int, html) {
			var items = new JQuery(html).find("td").children("input,textarea");
			if(items.length > 0){
				data.push({ key: Reflect.field(items[0], "value"), value: Reflect.field(items[1], "value") });
			}
		});
		
		valueHolder.val(Serializer.run(data));
		
		return(true);
	}
}

typedef KeyValuePair = {
	var key:String;
	var value:String;
}