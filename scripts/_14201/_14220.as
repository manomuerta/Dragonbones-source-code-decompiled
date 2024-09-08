package _14201
{
   import _14190._14189;
   import _14193._14197;
   import _14193._14200;
   import _14240._14242;
   import _14240._14246;
   import com.lorentz.SVG._14234;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.geom.Rectangle;
   
   use namespace _14234;
   
   public class _14220 extends _14200
   {
      private var _15399:String;
      
      private var _15400:String;
      
      private var _start:Number = 0;
      
      private var _end:Number = 0;
      
      public function _14220()
      {
         super("tspan");
      }
      
      public function get _15401() : String
      {
         return this._15399;
      }
      
      public function set _15401(param1:String) : void
      {
         if(this._15399 != param1)
         {
            this._15399 = param1;
            _15272();
         }
      }
      
      public function get _15402() : String
      {
         return this._15400;
      }
      
      public function set _15402(param1:String) : void
      {
         if(this._15400 != param1)
         {
            this._15400 = param1;
            _15272();
         }
      }
      
      override protected function render() : void
      {
         var _loc3_:Sprite = null;
         var _loc5_:Object = null;
         var _loc6_:_14189 = null;
         var _loc7_:_14200 = null;
         var _loc8_:Rectangle = null;
         var _loc9_:Sprite = null;
         super.render();
         while(content.numChildren > 0)
         {
            content.removeChildAt(0);
         }
         if(this._15300 == 0)
         {
            return;
         }
         var _loc1_:String = _15294() || "lr";
         var _loc2_:String = _loc1_;
         if(_15196)
         {
            _15312._15398 = _15258(_15196,_14246.WIDTH);
         }
         if(_15197)
         {
            _15312._15397 = _15258(_15197,_14246.HEIGHT);
         }
         this._start = _15312._15398;
         _15302 = new Vector.<DisplayObject>();
         if(this._15401)
         {
            _15312._15398 += _15258(this._15401,_14246.WIDTH);
         }
         if(this._15402)
         {
            _15312._15397 += _15258(this._15402,_14246.HEIGHT);
         }
         if(_15304)
         {
            _loc3_ = new Sprite();
            content.addChild(_loc3_);
         }
         else
         {
            _loc3_ = content;
         }
         var _loc4_:int = 0;
         while(_loc4_ < _15300)
         {
            _loc5_ = _15298(_loc4_);
            if(_loc5_ is String)
            {
               _loc6_ = _15299(_loc5_ as String,_15312._15311);
               if((_loc6_.direction || _loc1_) == "lr")
               {
                  _loc6_.displayObject.x = _15312._15398 - _loc6_._1614;
                  _loc6_.displayObject.y = _15312._15397 - _loc6_._1617;
                  _15312._15398 += _loc6_.textWidth;
               }
               else
               {
                  _loc6_.displayObject.x = _15312._15398 - _loc6_.textWidth - _loc6_._1614;
                  _loc6_.displayObject.y = _15312._15397 - _loc6_._1617;
                  _15312._15398 -= _loc6_.textWidth;
               }
               if(_loc6_.direction)
               {
                  _loc2_ = _loc6_.direction;
               }
               _loc3_.addChild(_loc6_.displayObject);
               _15302.push(_loc6_.displayObject);
            }
            else if(_loc5_ is _14200)
            {
               _loc7_ = _loc5_ as _14200;
               if(_loc7_._15309())
               {
                  _15312._9277.addChild(_loc7_);
               }
               else
               {
                  _loc3_.addChild(_loc7_);
               }
               _loc7_._15272();
               _loc7_.validate();
               _15302.push(_loc7_);
            }
            _loc4_++;
         }
         this._end = _15312._15398;
         if(_15196)
         {
            _15306(_loc2_,this._start,this._end);
         }
         if(_15304 && _loc3_.numChildren > 0)
         {
            _loc8_ = _14242._15396(_loc3_,content);
            _loc8_.inflate(2,2);
            _loc9_ = new Sprite();
            beginFill(_loc9_.graphics);
            _loc9_.graphics.drawRect(_loc8_.x,_loc8_.y,_loc8_.width,_loc8_.height);
            _loc9_.mask = _loc3_;
            _loc3_.cacheAsBitmap = true;
            _loc9_.cacheAsBitmap = true;
            content.addChildAt(_loc9_,0);
            _15302.push(_loc9_);
         }
      }
      
      override public function clone(param1:Boolean = true) : _14197
      {
         var _loc2_:_14220 = super.clone(param1) as _14220;
         _loc2_._15196 = _15196;
         _loc2_._15197 = _15197;
         _loc2_._15401 = this._15401;
         _loc2_._15402 = this._15402;
         return _loc2_;
      }
   }
}

