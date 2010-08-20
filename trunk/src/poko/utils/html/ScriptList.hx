/**
 * ...
 * @author Matt Benton
 */

package poko.utils.html;
import php.FileSystem;
import poko.Poko;

class ScriptList 
{
	public var scripts : Array<ScriptRef>;
	
	public function new() 
	{
		scripts = new Array<ScriptRef>();
	}
	
	public function addExternal( type : ScriptType, url : String, ?condition : String = null, ?media : String = null ) : Void
	{
		scripts.push( { type : type, isExternal : true, value : url, condition : condition, media : media } );
	}
	
	public function addInline( type : ScriptType, source : String, ?condition : String = null, ?media : String = null ) : Void
	{
		scripts.push( { type : type, isExternal : false, value : source, condition : condition, media : media } );
	}
	
	public function getScripts() : String
	{
		var output = "";
		
		#if debug
		var missing = new Array<String>();
		#end
		
		for ( script in scripts )
		{
			#if debug
			if ( script.isExternal )
				if ( !FileSystem.exists(script.value) )
					missing.push(script.value);
			#end
			
			output += ( script.isExternal ) ? formatExternalScript( script ) + "\n" : formatInlineScript( script ) + "\n";
		}
		
		#if debug
		if ( missing.length > 0 )
		{
			var error = "Warning: (" + missing.length + ") external script(s) could not be found:\n";
			for ( s in missing )
				error += "\t" + s + "\n";
			throw error;
		}
		#end
		
		return output;
	}
	
	function formatInlineScript( script : ScriptRef ) : String
	{
		var output : String = "";
		switch ( script.type )
		{
			case css:
				output = (script.media == null) ? "<style type=\"text/css\">" + script.value + "</style>" : "<style type=\"text/css\" media=\"" + script.media + "\">" + script.value + "</style>";
			case js:
				output = "<script>" + script.value + "</script>";
		}
		if ( script.condition != null )
			return formatCondition( output, script.condition );
		return output;
	}
	
	function formatExternalScript( script : ScriptRef ) : String
	{
		var output : String = "";
		switch ( script.type )
		{
			case css:
					output = (script.media == null) ? "<link href=\"" + script.value + "\" rel=\"stylesheet\" type=\"text/css\" />" : "<link href=\"" + script.value + "\" rel=\"stylesheet\" type=\"text/css\" media=\"" + script.media + "\" />";
			case js:
				output = "<script src=\"" + script.value + "\"></script>";
		}
		if ( script.condition != null )
			return formatCondition( output, script.condition );
		return output;
	}
	
	function formatCondition( value : String, condition : String ) : String
	{
		return "<!--[" + condition + "]>" + value + "<![endif]-->";
	}
}