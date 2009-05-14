/** 
 * poko haxe goodness
 * @author Tony Polinelli <tonyp@touchmypixel.com>
 */

package poko.form.elements;
import poko.Application;
import poko.form.Form;
import poko.form.FormElement;
import poko.utils.PhpTools;

class FileUpload extends FormElement
{

	public function new(name:String, label:String, ?value:String, ?required:Bool=false ) 
	{
		super();
		this.name = name;
		this.label = label;
		this.value = value;
		this.required = required;
	}
	
	override public function populate()
	{
		var n = form.name + "_" + name;
		var file:Hash<String> = PhpTools.getFilesInfo().get(n);
		
		if (file != null && file.get("error") == "0")
		{
			var v = file.get("name");
			
			if (v != null)
			{
				value = v;
			}
		}
	}
	
	override public function render():String
	{
		var n = form.name + "_" +name;
		var str:String = "";
		
		str += "<input type=\"file\" name=\"" + n + "\" id=\"" + n + "\" " + attributes + " />";
		
		return str;
	}
	
	public function toString() :String
	{
		return render();
	}
	
}