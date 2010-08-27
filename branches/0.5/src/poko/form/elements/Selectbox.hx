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


package poko.form.elements;
import poko.form.Form;
import poko.form.FormElement;

class Selectbox extends FormElement 
{
	public var data:List<Dynamic>;
	public var nullMessage:String;
	public var onChange:String;
	
	public function new(name:String, label:String, ?data:List<Dynamic>, ?selected:String, required:Bool=false, ?nullMessage="- select -") 
	{
		super();
		this.name = name;
		this.label = label;
		this.data = data != null ? data: new List();
		this.value = selected;
		this.required = required;
		this.nullMessage = nullMessage;
		
		onChange = "";
	}
	
	override public function render():String
	{
		var s = "";
		var n = form.name + "_" +name;

		s += "\n<select name=\""+n+"\" id=\""+n+"\" "+attributes+" onChange=\""+onChange+"\" />";
		
		if (nullMessage != "")
			s += "<option value=\"\" " + (Std.string(value) == "" ? "selected":"") + ">" + nullMessage + "</option>";
			
		if (data != null)
		{	
			for (row in data) {
				s += "<option value=\"" + Std.string(row.value) + "\" " + (Std.string(row.value) == Std.string(value) ? "selected":"") + ">" + Std.string(row.key) + "</option>";
			}
		}
		s += "</select>";
	 
		return s;
	}
	
	public function addOption(keyVal:Dynamic)
	{
		data.add(keyVal);
	}
	
	public function toString() :String
	{
		return render();
	}
}