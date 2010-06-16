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

class Button extends FormElement
{
	public var type:ButtonType;
	
	public function new(name:String, label:String, ?value:String = "Submit", ?type:ButtonType = null) 
	{
		super();
		this.name = name;
		this.label = label;
		this.value = value;
		this.type = (type == null) ? ButtonType.SUBMIT : type; 
	}
	
	override public function isValid():Bool
	{
		return true;
	}
	
	override public function render() :String
	{
		return "<button type=\""+type+"\" name=\"" +form.name+"_" +name+ "\" id=\"" +form.name+"_" +name+ "\" value=\""+value+"\" "+attributes+" >" +label+ "</button>";
	}
	
	public function toString() :String
	{
		return render();
	}
	
	override public function getLabel():String
	{
		var n = form.name + "_" + name;
		
		return "<label for=\"" + n + "\" ></label>";
	}
	
	override public function getPreview():String
	{
		return "<tr><td></td><td>" + this.render() + "<td></tr>";
	}
}

enum ButtonType
{
	SUBMIT;
	BUTTON;
	RESET;
}