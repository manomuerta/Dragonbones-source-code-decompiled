package _14201
{
   import _14190._14189;
   import _14193._14197;
   import _14193._14200;
   import _14236._14237;
   import _14240._14242;
   import _14240._14246;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.geom.Rectangle;
   
   public class _14219 extends _14200
   {
      public var _15398:Number = 0;
      
      public var _15397:Number = 0;
      
      public var _15311:_14237;
      
      public var _9277:Sprite;
      
      private var _start:Number = 0;
      
      private var _end:Number = 0;
      
      public function _14219()
      {
         super("text");
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
         this._9277 = content;
         this._15311 = new document._15341();
         this._15311.start();
         var _loc1_:String = _15294() || "lr";
         var _loc2_:String = _loc1_;
         this._15398 = _15258(_15196,_14246.WIDTH);
         this._15397 = _15258(_15197,_14246.HEIGHT);
         this._start = this._15398;
         _15302 = new Vector.<DisplayObject>();
         if(_15304)
         {
            _loc3_ = new Sprite();
            this._9277.addChild(_loc3_);
         }
         else
         {
            _loc3_ = this._9277;
         }
         var _loc4_:int = 0;
         while(_loc4_ < _15300)
         {
            _loc5_ = _15298(_loc4_);
            if(_loc5_ is String)
            {
               _loc6_ = _15299(_loc5_ as String,this._15311);
               if((_loc6_.direction || _loc1_) == "lr")
               {
                  _loc6_.displayObject.x = this._15398 - _loc6_._1614;
                  _loc6_.displayObject.y = this._15397 - _loc6_._1617;
                  this._15398 += _loc6_.textWidth;
               }
               else
               {
                  _loc6_.displayObject.x = this._15398 - _loc6_.textWidth - _loc6_._1614;
                  _loc6_.displayObject.y = this._15397 - _loc6_._1617;
                  this._15398 -= _loc6_.textWidth;
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
                  this._9277.addChild(_loc7_);
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
         this._end = this._15398;
         _15306(_loc2_,this._start,this._end);
         this._15311.end();
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
            this._9277.addChildAt(_loc9_,0);
            _15302.push(_loc9_);
         }
      }
      
      override public function clone(param1:Boolean = true) : _14197
      {
         var _loc2_:_14219 = super.clone(param1) as _14219;
         _loc2_._15196 = _15196;
         _loc2_._15197 = _15197;
         return _loc2_;
      }
   }
}

