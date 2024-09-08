package _586
{
   import _1404._1407;
   import _24.Shortcut;
   import _470._469;
   import _472._607;
   import _51._52;
   import _521._524;
   import _521._526;
   import _708._714;
   import _708._718;
   import _708._719;
   import _783.CommandNotification;
   import _783.StageNotification;
   import _81._88;
   import _844._848;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class _597 extends _599
   {
      private var _5260:_848;
      
      private var _5142:Boolean = false;
      
      public function _597()
      {
         super();
      }
      
      override public function start() : void
      {
         super.start();
      }
      
      override protected function _1576() : void
      {
         super._1576();
         _1565(StageNotification.UPDATE_SELECTED_ITEMS,this._4023);
         this._5260.addEventListener(MouseEvent.MOUSE_DOWN,this._5257);
      }
      
      override protected function dispose() : void
      {
         super.dispose();
         _1564(StageNotification.UPDATE_SELECTED_ITEMS,this._4023);
         this._5260.removeEventListener(MouseEvent.MOUSE_DOWN,this._5257);
      }
      
      private function _4023(param1:StageNotification) : void
      {
         this.update();
      }
      
      public function update() : void
      {
         var _loc1_:Array = null;
         var _loc2_:Array = null;
         var _loc3_:_52 = null;
         if(!this._5260 || _2226._2889 == null)
         {
            return;
         }
         if(this._5142 && _2226._2889.length > 0)
         {
            _loc1_ = _2199(_2226._2889.concat(),0,2);
            if(_loc1_.length > 0)
            {
               _loc2_ = this._5263._3798(_loc1_);
               _loc3_ = _loc2_[_loc2_.length - 1];
               this._5260._1836 = _loc3_;
               this._5255();
               return;
            }
         }
         this._5260._1836 = null;
      }
      
      protected function _5255() : void
      {
         var _loc1_:_52 = null;
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Point = null;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         if(Boolean(this._5260) && Boolean(this._5260._1836))
         {
            _loc1_ = this._5260._1836;
            _loc2_ = _loc1_.length;
            _loc3_ = 0;
            _loc4_ = _88._2135(new Point(_loc2_,_loc3_),_loc1_._2009,true);
            _loc5_ = _loc4_.x - _loc1_.globalTransform.x;
            _loc6_ = _loc4_.y - _loc1_.globalTransform.y;
            _loc7_ = Math.sqrt(_loc5_ * _loc5_ + _loc6_ * _loc6_);
            this._5260.x = _loc4_.x * _2580;
            this._5260.y = _loc4_.y * _2580;
         }
      }
      
      protected function _5257(param1:MouseEvent) : void
      {
         var _loc2_:Array = null;
         var _loc3_:Object = null;
         var _loc4_:Array = null;
         if(_2220._4000 == _714.PLAY)
         {
            return;
         }
         if(!Shortcut._1677())
         {
            if(_2226._3855)
            {
               _loc2_ = [];
               for each(_loc3_ in _2226._2889)
               {
                  if(_loc3_ is _52)
                  {
                     if(_52(_loc3_)._1980)
                     {
                        continue;
                     }
                  }
                  _loc2_.push(_loc3_);
               }
               _loc4_ = _2199(_loc2_,0,2);
               if(_loc4_.length > 0)
               {
                  _5264(_loc4_);
                  this._5260._4365(true);
               }
            }
         }
         _524._3785(true);
      }
      
      override protected function _5103(param1:MouseEvent) : void
      {
         super._5103(param1);
         this._5255();
         _607.instance._5059(true);
         this._5260._4337();
      }
      
      override protected function _5256(param1:MouseEvent) : void
      {
         var _loc2_:Array = this._5263._3798(_2938);
         if(!_loc2_)
         {
            return;
         }
         var _loc3_:Point = this._4379(new Point(param1.stageX,param1.stageY));
         _loc3_.x /= _2580;
         _loc3_.y /= _2580;
         this._5260.x = _loc3_.x * _2580;
         this._5260.y = _loc3_.y * _2580;
         _2226._2889 = _loc2_;
         var _loc4_:Array = this._5263._3796(_loc3_,_loc2_);
         this._5258(_loc4_,_loc2_);
      }
      
      private function _4379(param1:Point) : Point
      {
         return this._5260.parent.globalToLocal(param1);
      }
      
      private function _5258(param1:Array, param2:Array) : void
      {
         var _loc3_:int = 0;
         var _loc4_:Array = [];
         var _loc5_:_52 = param2[0];
         _loc3_ = 0;
         while(_loc3_ < param1.length)
         {
            if(_loc3_ < 1)
            {
               if(Boolean(_loc5_.parentBoneData) && _loc5_.inheritRotation)
               {
                  param1[_loc3_]._5259 = param1[_loc3_].rotation - _loc5_.parentBoneData.globalTransform.rotation * 180 / Math.PI;
               }
               else
               {
                  param1[_loc3_]._5259 = param1[_loc3_].rotation;
               }
            }
            else if(param2[_loc3_].inheritRotation)
            {
               param1[_loc3_]._5259 = param1[_loc3_].rotation - (param1[_loc3_ - 1].rotation + param1[_loc3_ - 1]._2136);
            }
            else
            {
               param1[_loc3_]._5259 = param1[_loc3_].rotation;
            }
            param1[_loc3_]._5259 += param1[_loc3_]._2136;
            if(param1[_loc3_]._5259 > 180)
            {
               param1[_loc3_]._5259 -= 360;
            }
            if(param1[_loc3_]._5259 < -180)
            {
               param1[_loc3_]._5259 = 360 + param1[_loc3_]._5259;
            }
            _loc4_[_loc3_] = param1[_loc3_]._5259 * Math.PI / 180;
            _loc3_++;
         }
         var _loc6_:Object = _469._3476(param2,param2.length,_2873,_719.LOCAL,[_718.ROTATION,_loc4_],1);
         this._1567(new CommandNotification(CommandNotification.MODIFY_ITEMS_TRANSFORM,_loc6_));
      }
      
      protected function get _5263() : _526
      {
         return _1407.getInstance(_526) as _526;
      }
      
      public function set _5262(param1:_848) : void
      {
         if(this._5260 == param1)
         {
            return;
         }
         if(this._5260)
         {
            this.dispose();
         }
         this._5260 = param1;
         this._5260.visible = false;
         if(this._5260)
         {
            this.start();
         }
      }
      
      public function set enabled(param1:Boolean) : void
      {
         if(this._5142 == param1)
         {
            return;
         }
         this._5142 = param1;
         this.update();
      }
   }
}

