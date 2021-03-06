package format.swf.lite;


import flash.display.Shape;
import flash.display.Sprite;
import flash.geom.Point;
import flash.text.TextField;
import flash.text.TextFormat;
import flash.text.TextFormatAlign;
import format.swf.lite.symbols.DynamicTextSymbol;
import format.swf.lite.symbols.FontSymbol;
import format.swf.lite.SWFLite;


class DynamicTextField extends TextField {
	
	
	public var symbol:DynamicTextSymbol;
	
	private var glyphs:Array<Shape>;
	private var swf:SWFLite;
	private var _text:String;
	
	
	public function new (swf:SWFLite, symbol:DynamicTextSymbol) {
		
		super ();
		
		this.swf = swf;
		this.symbol = symbol;
		
		width = symbol.width;
		height = symbol.height;
		
		multiline = symbol.multiline;
		wordWrap = symbol.wordWrap;
		displayAsPassword = symbol.password;
		border = symbol.border;
		selectable = symbol.selectable;
		
		var format = new TextFormat ();
		if (symbol.color != null) format.color = (symbol.color & 0x00FFFFFF);
		format.size = (symbol.fontHeight / 20);
		format.font = symbol.fontName;
		
		format.leftMargin = symbol.leftMargin / 20;
		format.rightMargin = symbol.rightMargin / 20;
		format.indent = symbol.indent / 20;
		format.leading = symbol.leading / 20;
		
		#if (flash || html5)
		if (symbol.align == "center") format.align = TextFormatAlign.CENTER;
		else if (symbol.align == "right") format.align = TextFormatAlign.RIGHT;
		else if (symbol.align == "justify") format.align = TextFormatAlign.JUSTIFY;
		#else
		format.align = symbol.align;
		#end
		
		defaultTextFormat = format;
		
		text = symbol.text;
		
		//autoSize = (tag.autoSize) ? TextFieldAutoSize.LEFT : TextFieldAutoSize.NONE;
		
	}
	
	
}