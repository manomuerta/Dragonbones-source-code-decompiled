package egret.core
{
   import flash.events.Event;
   import flash.text.TextField;
   import flash.text.TextFormat;
   
   use namespace ns_egret;
   
   public class _1142 extends TextField
   {
      ns_egret var leading:int = 0;
      
      public function _1142()
      {
         super();
      }
      
      override public function set width(param1:Number) : void
      {
         var _loc2_:* = super.width != param1;
         super.width = param1;
         if(_loc2_)
         {
            dispatchEvent(new Event("widthChanged"));
         }
      }
      
      override public function get height() : Number
      {
         return super.height - this.ns_egret::leading;
      }
      
      override public function set height(param1:Number) : void
      {
         var _loc2_:* = this.height != param1;
         super.height = param1 + this.ns_egret::leading;
         if(_loc2_)
         {
            dispatchEvent(new Event("heightChanged"));
         }
      }
      
      override public function setTextFormat(param1:TextFormat, param2:int = -1, param3:int = -1) : void
      {
         super.setTextFormat(param1,param2,param3);
         dispatchEvent(new Event("textFormatChanged"));
      }
      
      override public function set text(param1:String) : void
      {
         if(!param1)
         {
            param1 = "";
         }
         var _loc2_:* = super.text != param1;
         super.text = param1;
         if(_loc2_)
         {
            dispatchEvent(new Event("textChanged"));
         }
      }
      
      override public function set htmlText(param1:String) : void
      {
         if(!param1)
         {
            param1 = "";
         }
         var _loc2_:* = super.htmlText != param1;
         super.htmlText = param1;
         if(_loc2_)
         {
            dispatchEvent(new Event("textChanged"));
         }
      }
      
      override public function insertXMLText(param1:int, param2:int, param3:String, param4:Boolean = false) : void
      {
         super.insertXMLText(param1,param2,param3,param4);
         dispatchEvent(new Event("textChanged"));
      }
      
      override public function appendText(param1:String) : void
      {
         super.appendText(param1);
         dispatchEvent(new Event("textChanged"));
      }
      
      override public function replaceSelectedText(param1:String) : void
      {
         super.replaceSelectedText(param1);
         dispatchEvent(new Event("textChanged"));
      }
      
      override public function replaceText(param1:int, param2:int, param3:String) : void
      {
         super.replaceText(param1,param2,param3);
         dispatchEvent(new Event("textChanged"));
      }
      
      override public function get textHeight() : Number
      {
         return super.textHeight + 4 - this.ns_egret::leading;
      }
      
      override public function get textWidth() : Number
      {
         return super.textWidth + 6;
      }
      
      final ns_egret function set _8087(param1:Number) : void
      {
         if(super.width == param1)
         {
            return;
         }
         super.width = param1;
      }
      
      final ns_egret function set _8086(param1:Number) : void
      {
         if(this.height == param1)
         {
            return;
         }
         super.height = param1 + this.ns_egret::leading;
      }
      
      final ns_egret function set _8085(param1:String) : void
      {
         if(!param1)
         {
            param1 = "";
         }
         super.htmlText = param1;
      }
      
      final ns_egret function set _7660(param1:String) : void
      {
         if(param1 == null)
         {
            param1 = "";
         }
         super.text = param1;
      }
      
      final ns_egret function _8073(param1:TextFormat, param2:int = -1, param3:int = -1) : void
      {
         super.setTextFormat(param1,param2,param3);
      }
      
      final ns_egret function _8717(param1:int, param2:int, param3:String, param4:Boolean = false) : void
      {
         super.insertXMLText(param1,param2,param3,param4);
      }
      
      ns_egret function _8718(param1:int, param2:int, param3:String) : void
      {
         super.replaceText(param1,param2,param3);
      }
      
      ns_egret function _8719(param1:String) : void
      {
         super.replaceText(text.length,text.length,param1);
      }
      
      ns_egret function _8716(param1:String) : void
      {
         super.replaceSelectedText(param1);
      }
   }
}

