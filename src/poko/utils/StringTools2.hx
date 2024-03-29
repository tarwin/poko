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

package poko.utils;

class StringTools2
{

	public function new() 
	{
		
	}
	
	public static inline function ucFirst(s:String) 
	{
		#if php
			return untyped __call__('ucfirst', s);
		#else
			var p1:String = s.substr(0, 1);
			var p2:String = s.substr(1);
			return p1.toUpperCase() + p2.toLowerCase();
		#end
	}
	
	/** takes string with %s identifiers and impodes array values */
	public static function printf(string:String, vars:Array<Dynamic>)
	{
		var parts = string.split("%s");
		var out = "";
		var c = 0;
		var lastpart = parts.pop();
		for (part in parts)
		{
			if (c < vars.length)
			{
				out += part + vars[c];
			} else {
				out += part;
			}
			c++;
		}
		out += lastpart;
		
		return out;
	}
	
	public static function toSentenceList(input:String, splitBy:String = "", surroundBy:String = "'"):String
	{
		var a = input.split(splitBy);
		var c = 0;
		var out = "";
		for (s in a) {
			out += surroundBy + s + surroundBy;
			if (c < a.length - 2) {
				out += ", ";
			}else if(c == a.length - 2) {
				out += " and ";
			}
			c++;
		}
		
		return out;
	}
	
	public static function html2Txt(t:String):String
	{
		t = StringTools.replace(t, "<h1>", "=== ");
		t = StringTools.replace(t, "</h1>", " ===\n\n");
		t = StringTools.replace(t, "<h2>", "=== ");
		t = StringTools.replace(t, "</h2>", " ===\n\n");
		t = StringTools.replace(t, "<h3>", "=== ");
		t = StringTools.replace(t, "</h3>", " ===\n\n");		
		t = StringTools.replace(t, "<p>", "");
		t = StringTools.replace(t, "</p>", "\n\n");
		t = StringTools.replace(t, "<div>", "");
		t = StringTools.replace(t, "</div>", "\n\n");
		t = StringTools.replace(t, "<br>", "\n");
		t = StringTools.replace(t, "<br />", "\n");
		
		t = StringTools.replace(t, "<b>", "\"");
		t = StringTools.replace(t, "</b>", "\"");
		t = StringTools.replace(t, "<strong>", "\"");
		t = StringTools.replace(t, "</strong>", "\"");		
		t = StringTools.replace(t, "<u>", "\"");
		t = StringTools.replace(t, "</u>", "\"");
		t = StringTools.replace(t, "<i>", "'");
		t = StringTools.replace(t, "</i>", "'");
		t = StringTools.replace(t, "<em>", "'");
		t = StringTools.replace(t, "</em>", "'");		

		t = StringTools.replace(t, "<ul>", "");
		t = StringTools.replace(t, "</ul>", "\n");
		t = StringTools.replace(t, "<ol>", "");
		t = StringTools.replace(t, "</ol>", "\n");
		t = StringTools.replace(t, "<li>", "    * ");
		t = StringTools.replace(t, "</li>", "\n");
		
		return t;
	}	
}