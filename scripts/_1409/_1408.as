package _1409
{
   import _1416._1415;
   import _1416._1417;
   import egret.utils._1294;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.text.engine.TextBlock;
   import flash.text.engine.TextElement;
   import flash.text.engine.TextLine;
   import flash.text.engine.TextLineValidity;
   
   public class _1408 extends Sprite
   {
      private static var _9439:_1294;
      
      private static var _9846:TextBlock;
      
      private static var _9844:TextElement;
      
      private static var _9843:Function;
      
      _9851();
      
      protected var _9848:Vector.<_1415>;
      
      protected var _9849:Vector.<_1417>;
      
      public function _1408()
      {
         this._9848 = new Vector.<_1415>();
         this._9849 = new Vector.<_1417>();
         super();
      }
      
      private static function _9851() : void
      {
         _9846 = new TextBlock();
         _9844 = new TextElement();
         _9439 = new _1294();
         if("recreateTextLine" in _9846)
         {
            _9843 = _9846["recreateTextLine"];
         }
      }
      
      public function recreateTextLine(param1:TextLine, param2:TextLine = null, param3:Number = 1000000, param4:Number = 0, param5:Boolean = false) : TextLine
      {
         return _9843(param1,param2,param3,param4,param5);
      }
      
      protected function _9845(param1:* = null) : void
      {
         var _loc2_:TextLine = null;
         var _loc3_:DisplayObjectContainer = null;
         var _loc4_:_1417 = null;
         if(param1 is Array || param1 is Vector.<TextLine>)
         {
            while(param1.length > 0)
            {
               _loc2_ = param1.pop();
               _loc3_ = _loc2_.parent as DisplayObjectContainer;
               if(_loc3_)
               {
                  DisplayObjectContainer(_loc2_.parent).removeChild(_loc2_);
               }
               if(_loc2_)
               {
                  if(_loc2_.validity != TextLineValidity.INVALID && _loc2_.validity != TextLineValidity.STATIC)
                  {
                     _loc2_.validity = TextLineValidity.INVALID;
                  }
                  _loc2_.userData = null;
                  _9439.push(_loc2_);
               }
            }
            return;
         }
         if(param1 is TextLine)
         {
            _loc2_ = param1;
            _loc3_ = _loc2_.parent as DisplayObjectContainer;
            if(_loc3_)
            {
               DisplayObjectContainer(_loc2_.parent).removeChild(_loc2_);
            }
            if(_loc2_)
            {
               if(_loc2_.validity != TextLineValidity.INVALID && _loc2_.validity != TextLineValidity.STATIC)
               {
                  _loc2_.validity = TextLineValidity.INVALID;
               }
               _loc2_.userData = null;
               _9439.push(_loc2_);
            }
            return;
         }
         if(!param1)
         {
            while(this._9849.length > 0)
            {
               _loc4_ = this._9849.pop();
               _loc2_ = _loc4_.content;
               _loc3_ = _loc2_.parent as DisplayObjectContainer;
               if(_loc3_)
               {
                  DisplayObjectContainer(_loc2_.parent).removeChild(_loc2_);
               }
               if(_loc2_)
               {
                  if(_loc2_.validity != TextLineValidity.INVALID && _loc2_.validity != TextLineValidity.STATIC)
                  {
                     _loc2_.validity = TextLineValidity.INVALID;
                  }
                  _loc2_.userData = null;
                  _9439.push(_loc2_);
               }
            }
         }
      }
      
      protected function get _9461() : TextElement
      {
         return _9844;
      }
      
      protected function get textBlock() : TextBlock
      {
         return _9846;
      }
      
      protected function _9847() : TextLine
      {
         return _9439.get();
      }
      
      protected function _9850(param1:String) : Vector.<String>
      {
         var _loc5_:String = null;
         var _loc2_:Vector.<String> = new Vector.<String>();
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         while(_loc4_ < param1.length)
         {
            if(_loc4_ == param1.length - 1)
            {
               _loc5_ = param1.slice(_loc3_,_loc4_ + 1);
               _loc2_.push(_loc5_);
            }
            else if(_loc4_ < param1.length - 1 && param1.charAt(_loc4_) == "\r" && param1.charAt(_loc4_ + 1) == "\n")
            {
               _loc5_ = param1.slice(_loc3_,_loc4_ + 2);
               _loc3_ = _loc4_ + 2;
               _loc4_++;
               _loc2_.push(_loc5_);
            }
            else if(param1.charAt(_loc4_) == "\r" || param1.charAt(_loc4_) == "\n")
            {
               _loc5_ = param1.slice(_loc3_,_loc4_ + 1);
               _loc3_ = _loc4_ + 1;
               _loc2_.push(_loc5_);
            }
            _loc4_++;
         }
         if(_loc2_.length == 0)
         {
            _loc2_.push("");
         }
         return _loc2_;
      }
   }
}

