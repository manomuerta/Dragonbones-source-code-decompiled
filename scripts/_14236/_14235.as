package _14236
{
   import _14190._14189;
   import _14190._14191;
   import _14193._14200;
   import flash.display.Sprite;
   import flash.geom.Rectangle;
   import flash.text.engine.ElementFormat;
   import flash.text.engine.FontDescription;
   import flash.text.engine.FontLookup;
   import flash.text.engine.FontPosture;
   import flash.text.engine.FontWeight;
   import flash.text.engine.TextBlock;
   import flash.text.engine.TextElement;
   import flash.text.engine.TextLine;
   
   public class _14235 implements _14237
   {
      public function _14235()
      {
         super();
      }
      
      public function start() : void
      {
      }
      
      public function _15313(param1:_14200, param2:String, param3:_14191) : _14189
      {
         var _loc10_:String = null;
         var _loc4_:FontDescription;
         (_loc4_ = new FontDescription()).fontLookup = param3._15188 ? FontLookup.EMBEDDED_CFF : FontLookup.DEVICE;
         _loc4_.fontName = param3.fontFamily;
         _loc4_.fontWeight = param3.fontWeight == "bold" ? FontWeight.BOLD : FontWeight.NORMAL;
         _loc4_.fontPosture = param3.fontStyle == "italic" ? FontPosture.ITALIC : FontPosture.NORMAL;
         var _loc5_:ElementFormat;
         (_loc5_ = new ElementFormat(_loc4_)).fontSize = param3.fontSize;
         _loc5_.color = param3.color;
         var _loc6_:TextBlock = new TextBlock(new TextElement(param2,_loc5_));
         var _loc7_:Sprite = new Sprite();
         var _loc8_:TextLine = _loc6_.createTextLine(null);
         _loc7_.addChild(_loc8_);
         var _loc9_:int = _loc8_.atomCount - 1;
         while(_loc10_ = param2.charAt(_loc9_), _loc10_.charCodeAt() == 8233 || _loc10_ == "\n")
         {
            _loc9_--;
         }
         var _loc11_:Rectangle = _loc8_.getAtomBounds(_loc9_);
         return new _14189(_loc7_,_loc11_.right,0,0);
      }
      
      public function end() : void
      {
      }
   }
}

