package _555
{
   import _1404._1407;
   import _24.Shortcut;
   import _24._26;
   import _470._469;
   import _51._70;
   import _51._79;
   import _579._580;
   import _636.TransformEvent;
   import _708._718;
   import _708._719;
   import _783.CommandNotification;
   import _783.SheetNotification;
   import _783.StageNotification;
   import _93._94;
   import _935._13217;
   import _953._13221;
   import flash.events.MouseEvent;
   import flash.ui.Keyboard;
   
   public class _13202 extends _94
   {
      private var _4896:_13221;
      
      private var _6223:_70;
      
      private var _4213:_79;
      
      private var _6919:Boolean;
      
      public function _13202()
      {
         super();
      }
      
      override protected function _1576() : void
      {
         _1565(StageNotification.UPDATE_SELECTED_ITEMS,this._4023);
         _1565(SheetNotification.CUR_FRAAME_CHANGE,this._13291);
      }
      
      public function set stagePanel(param1:_13221) : void
      {
         if(this._4896 != param1)
         {
            if(this._4896)
            {
               this._10752();
            }
            this._4896 = param1;
            if(this._4896 != null)
            {
               this._10756();
               this._13334();
            }
         }
      }
      
      private function _10752() : void
      {
         if(this._4896 == null)
         {
            return;
         }
         this._4896.removeEventListener(TransformEvent.X_CHANGE,this._10759);
         this._4896.removeEventListener(TransformEvent.Y_CHANGE,this._10759);
         this._4896.removeEventListener(TransformEvent.PIVOT_X_CHANGE,this._10759);
         this._4896.removeEventListener(TransformEvent.PIVOT_Y_CHANGE,this._10759);
         this._4896.removeEventListener(TransformEvent.PIVOT_CHANGE,this._6640);
         this._4896.removeEventListener(TransformEvent.FLIPX_CHANGE,this._13337);
         this._4896.removeEventListener(TransformEvent.FLIPY_CHANGE,this._13336);
         this._4896._13338.removeEventListener(MouseEvent.CLICK,this._13339);
         if(stage)
         {
            Shortcut._1673(stage,_26.MOVE_UP,this._4973);
            Shortcut._1673(stage,_26.MOVE_DOWN,this._4973);
            Shortcut._1673(stage,_26.MOVE_LEFT,this._4973);
            Shortcut._1673(stage,_26.MOVE_RIGHT,this._4973);
         }
         _1564(SheetNotification.PLAY,this._4762);
         _1564(SheetNotification.STOP_PLAY,this._13321);
      }
      
      private function _10756() : void
      {
         if(this._4896 == null)
         {
            return;
         }
         this._4896.addEventListener(TransformEvent.X_CHANGE,this._10759);
         this._4896.addEventListener(TransformEvent.Y_CHANGE,this._10759);
         this._4896.addEventListener(TransformEvent.PIVOT_X_CHANGE,this._10759);
         this._4896.addEventListener(TransformEvent.PIVOT_Y_CHANGE,this._10759);
         this._4896.addEventListener(TransformEvent.PIVOT_CHANGE,this._6640);
         this._4896.addEventListener(TransformEvent.FLIPX_CHANGE,this._13337);
         this._4896.addEventListener(TransformEvent.FLIPY_CHANGE,this._13336);
         this._4896._13338.addEventListener(MouseEvent.CLICK,this._13339);
         if(stage)
         {
            Shortcut._1681(stage,_26.MOVE_UP,this._4973);
            Shortcut._1681(stage,_26.MOVE_DOWN,this._4973);
            Shortcut._1681(stage,_26.MOVE_LEFT,this._4973);
            Shortcut._1681(stage,_26.MOVE_RIGHT,this._4973);
            Shortcut._1681(stage,_26.FAST_MOVE_UP,this._4973);
            Shortcut._1681(stage,_26.FAST_MOVE_DOWN,this._4973);
            Shortcut._1681(stage,_26.FAST_MOVE_LEFT,this._4973);
            Shortcut._1681(stage,_26.FAST_MOVE_RIGHT,this._4973);
            Shortcut._1681(stage,_26.SLOW_MOVE_UP,this._4973);
            Shortcut._1681(stage,_26.SLOW_MOVE_DOWN,this._4973);
            Shortcut._1681(stage,_26.SLOW_MOVE_LEFT,this._4973);
            Shortcut._1681(stage,_26.SLOW_MOVE_RIGHT,this._4973);
         }
         _1565(SheetNotification.PLAY,this._4762);
         _1565(SheetNotification.STOP_PLAY,this._13321);
      }
      
      private function _4762(param1:SheetNotification) : void
      {
         this._6919 = true;
         if(this._4896)
         {
            this._4896.enabled = false;
         }
      }
      
      private function _13321(param1:SheetNotification) : void
      {
         this._6919 = false;
         if(this._4896)
         {
            this._4896.enabled = true;
         }
      }
      
      private function _4973(param1:String) : void
      {
         var _loc3_:Object = null;
         if(stage == null || this._4213 == null || this._4213._2049 == null || this._4213._2049.localTransform == null)
         {
            return;
         }
         var _loc2_:Number = 1;
         switch(param1)
         {
            case _26.MOVE_UP:
               _loc3_ = _469._2980(this._4213,_719.LOCAL,[_718.Y,[-1 * _loc2_ + this._4213._2049.localTransform.y]]);
               break;
            case _26.MOVE_DOWN:
               _loc3_ = _469._2980(this._4213,_719.LOCAL,[_718.Y,[1 * _loc2_ + this._4213._2049.localTransform.y]]);
               break;
            case _26.MOVE_LEFT:
               _loc3_ = _469._2980(this._4213,_719.LOCAL,[_718.X,[-1 * _loc2_ + this._4213._2049.localTransform.x]]);
               break;
            case _26.MOVE_RIGHT:
               _loc3_ = _469._2980(this._4213,_719.LOCAL,[_718.X,[1 * _loc2_ + this._4213._2049.localTransform.x]]);
               break;
            case _26.FAST_MOVE_UP:
               _loc2_ = 10;
               _loc3_ = _469._2980(this._4213,_719.LOCAL,[_718.Y,[-1 * _loc2_ + this._4213._2049.localTransform.y]]);
               break;
            case _26.FAST_MOVE_DOWN:
               _loc2_ = 10;
               _loc3_ = _469._2980(this._4213,_719.LOCAL,[_718.Y,[1 * _loc2_ + this._4213._2049.localTransform.y]]);
               break;
            case _26.FAST_MOVE_LEFT:
               _loc2_ = 10;
               _loc3_ = _469._2980(this._4213,_719.LOCAL,[_718.X,[-1 * _loc2_ + this._4213._2049.localTransform.x]]);
               break;
            case _26.FAST_MOVE_RIGHT:
               _loc2_ = 10;
               _loc3_ = _469._2980(this._4213,_719.LOCAL,[_718.X,[1 * _loc2_ + this._4213._2049.localTransform.x]]);
               break;
            case _26.SLOW_MOVE_UP:
               _loc2_ = 0.1;
               _loc3_ = _469._2980(this._4213,_719.LOCAL,[_718.Y,[-1 * _loc2_ + this._4213._2049.localTransform.y]]);
               break;
            case _26.SLOW_MOVE_DOWN:
               _loc2_ = 0.1;
               _loc3_ = _469._2980(this._4213,_719.LOCAL,[_718.Y,[1 * _loc2_ + this._4213._2049.localTransform.y]]);
               break;
            case _26.SLOW_MOVE_LEFT:
               _loc2_ = 0.1;
               _loc3_ = _469._2980(this._4213,_719.LOCAL,[_718.X,[-1 * _loc2_ + this._4213._2049.localTransform.x]]);
               break;
            case _26.SLOW_MOVE_RIGHT:
               _loc2_ = 0.1;
               _loc3_ = _469._2980(this._4213,_719.LOCAL,[_718.X,[1 * _loc2_ + this._4213._2049.localTransform.x]]);
         }
         if(_loc3_)
         {
            this._1567(new CommandNotification(CommandNotification.MODIFY_SHEET_TRANSFORM,_loc3_));
            _2217._1651();
         }
      }
      
      private function _13339(param1:MouseEvent) : void
      {
         this.applyAll();
      }
      
      private function applyAll() : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:_70 = null;
         var _loc12_:Object = null;
         var _loc1_:Boolean = true;
         if(Boolean(this._4896) && this._4896._13340.selectedIndex == 1)
         {
            _loc1_ = false;
         }
         _loc2_ = this._6223.localTransform.x;
         _loc3_ = this._6223.localTransform.y;
         if(!_loc1_)
         {
            _loc4_ = _loc2_ / this._6223.width;
            _loc5_ = _loc3_ / this._6223.height;
         }
         _loc6_ = this._6223.localTransform.scaleX;
         _loc7_ = this._6223.localTransform.scaleY;
         var _loc8_:Array = [];
         _loc9_ = 0;
         _loc10_ = int(this._4213._1715.length);
         while(_loc9_ < _loc10_)
         {
            _loc11_ = this._4213._1765[this._4213._1715[_loc9_]];
            if((Boolean(_loc11_)) && _loc11_ != this._6223)
            {
               (_loc12_ = _469._2980(this._4213,_719.LOCAL,[_718.SCALE_X,[_loc6_],_718.SCALE_Y,[_loc7_],_718.X,[_loc1_ ? _loc2_ : _loc11_.width * _loc4_],_718.Y,[_loc1_ ? _loc3_ : _loc11_.height * _loc5_]])).displayVO = _loc11_;
               _loc8_.push(_loc12_);
            }
            _loc9_++;
         }
         this._1567(new CommandNotification(CommandNotification.MODIFY_SHEETS_TRANSFORM,{"_13249":_loc8_}));
      }
      
      private function _13342(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:_70 = null;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Array = null;
         var _loc9_:Object = null;
         var _loc8_:Array = [];
         _loc2_ = 0;
         _loc3_ = int(this._4213._1715.length);
         while(_loc2_ < _loc3_)
         {
            _loc4_ = this._4213._1765[this._4213._1715[_loc2_]];
            if(_loc4_)
            {
               if(param1)
               {
                  _loc5_ = this._6223.localTransform.scaleX;
                  _loc5_ = -_loc5_;
                  _loc7_ = [_718.SCALE_X,[_loc5_]];
               }
               else
               {
                  _loc6_ = this._6223.localTransform.scaleY;
                  _loc6_ = -_loc6_;
                  _loc7_ = [_718.SCALE_Y,[_loc6_]];
               }
               if(Boolean(_loc7_) && _loc7_.length > 0)
               {
                  (_loc9_ = _469._2980(this._4213,_719.LOCAL,_loc7_)).displayVO = _loc4_;
                  _loc8_.push(_loc9_);
               }
            }
            _loc2_++;
         }
         if(Boolean(_loc8_) && _loc8_.length > 0)
         {
            this._1567(new CommandNotification(CommandNotification.MODIFY_SHEETS_TRANSFORM,{"_13249":_loc8_}));
         }
      }
      
      private function _13337(param1:TransformEvent) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Object = null;
         if(this._6223 == null)
         {
            return;
         }
         if(Shortcut._1685(Keyboard.SHIFT))
         {
            this._13342(true);
         }
         else
         {
            _loc2_ = -this._6223.localTransform.scaleX;
            _2217._1651();
            _loc3_ = _469._2980(this._4213,_719.LOCAL,[_718.SCALE_X,[_loc2_]]);
            this._1567(new CommandNotification(CommandNotification.MODIFY_SHEET_TRANSFORM,_loc3_));
            _2217._1651();
         }
      }
      
      private function _13336(param1:TransformEvent) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Object = null;
         if(this._6223 == null)
         {
            return;
         }
         if(Shortcut._1685(Keyboard.SHIFT))
         {
            this._13342(false);
         }
         else
         {
            _loc2_ = -this._6223.localTransform.scaleY;
            _2217._1651();
            _loc3_ = _469._2980(this._4213,_719.LOCAL,[_718.SCALE_Y,[_loc2_]]);
            this._1567(new CommandNotification(CommandNotification.MODIFY_SHEET_TRANSFORM,_loc3_));
            _2217._1651();
         }
      }
      
      private function _6640(param1:TransformEvent) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         switch(param1.data)
         {
            case _13217.LEFT_TOP:
               _loc2_ = this._6223.width / 2;
               _loc3_ = this._6223.height / 2;
               break;
            case _13217.LEFT_MIDDLE:
               _loc2_ = this._6223.width / 2;
               _loc3_ = 0;
               break;
            case _13217.LEFT_BOTTOM:
               _loc2_ = this._6223.width / 2;
               _loc3_ = -this._6223.height / 2;
               break;
            case _13217.MIDDLE_TOP:
               _loc2_ = 0;
               _loc3_ = this._6223.height / 2;
               break;
            case _13217.MIDDLE_MIDDLE:
               _loc2_ = 0;
               _loc3_ = 0;
               break;
            case _13217.MIDDLE_BOTTOM:
               _loc2_ = 0;
               _loc3_ = -this._6223.height / 2;
               break;
            case _13217.RIGHT_TOP:
               _loc2_ = -this._6223.width / 2;
               _loc3_ = this._6223.height / 2;
               break;
            case _13217.RIGHT_MIDDLE:
               _loc2_ = -this._6223.width / 2;
               _loc3_ = 0;
               break;
            case _13217.RIGHT_BOTTOM:
               _loc2_ = -this._6223.width / 2;
               _loc3_ = -this._6223.height / 2;
         }
         _2217._1651();
         var _loc4_:Object = _469._2980(this._4213,_719.LOCAL,[_718.X,[_loc2_],_718.Y,[_loc3_]]);
         this._1567(new CommandNotification(CommandNotification.MODIFY_SHEET_TRANSFORM,_loc4_));
         _2217._1651();
      }
      
      private function _10759(param1:TransformEvent) : void
      {
         if(this._6223 == null)
         {
            return;
         }
         var _loc2_:Number = Number(param1.data.value);
         var _loc3_:Boolean = Boolean(param1.data.merge);
         switch(param1.type)
         {
            case TransformEvent.X_CHANGE:
               this._10746(_718.X,_loc2_,_loc3_);
               break;
            case TransformEvent.Y_CHANGE:
               this._10746(_718.Y,_loc2_,_loc3_);
               break;
            case TransformEvent.PIVOT_X_CHANGE:
               this._10746(_718.X,_loc2_ * this._6223.width,_loc3_);
               break;
            case TransformEvent.PIVOT_Y_CHANGE:
               this._10746(_718.Y,_loc2_ * this._6223.height,_loc3_);
         }
      }
      
      private function _4023(param1:StageNotification) : void
      {
         if(_2226._3150 != null)
         {
            this._6223 = _2226._3150._2049;
            this._3173();
         }
      }
      
      public function _13244() : void
      {
         if(_2226._3150 != null)
         {
            this._6223 = _2226._3150._2049;
            this._3173();
         }
      }
      
      private function _13291(param1:SheetNotification) : void
      {
         this._13334();
      }
      
      private function _13334() : void
      {
         this._4213 = _2214._1844._2871._2865._1780[0];
         if(this._4213)
         {
            this._6223 = this._4213._2049;
         }
         this._3173();
      }
      
      public function _3173() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         if(this._4896 == null)
         {
            return;
         }
         if(this._6223)
         {
            this._4896._4781.value = this._6223.localTransform.x;
            this._4896._4780.value = this._6223.localTransform.y;
            _loc1_ = this._6223.width;
            _loc2_ = this._6223.height;
            this._4896._6648.value = this._6223.localTransform.x / _loc1_;
            this._4896._6650.value = this._6223.localTransform.y / _loc2_;
            this._4896._13335();
            if(!this._4896.enabled)
            {
               this._4896.enabled = !this._6919;
            }
         }
         else
         {
            this._4896._4781.value = 0;
            this._4896._4780.value = 0;
            this._4896._6648.value = 0;
            this._4896._6650.value = 0;
            this._4896._13335();
            this._4896.enabled = false;
         }
      }
      
      private function _10746(param1:_718, param2:Number, param3:Boolean = true) : void
      {
         var _loc5_:Object = null;
         var _loc7_:int = 0;
         var _loc4_:Array = [];
         var _loc6_:Array = [];
         switch(param1)
         {
            case _718.X:
               if(this._6223.localTransform.x != param2)
               {
                  _loc6_ = [];
                  _loc6_.push(param2);
                  _loc5_ = _469._2980(this._4213,_719.LOCAL,[_718.X,_loc6_]);
                  if(!param3)
                  {
                     _2217._1651();
                  }
                  this._1567(new CommandNotification(CommandNotification.MODIFY_SHEET_TRANSFORM,_loc5_));
               }
               break;
            case _718.Y:
               if(this._6223.localTransform.y != param2)
               {
                  _loc6_ = [];
                  _loc6_.push(param2);
                  _loc5_ = _469._2980(this._4213,_719.LOCAL,[_718.Y,_loc6_]);
                  if(!param3)
                  {
                     _2217._1651();
                  }
                  this._1567(new CommandNotification(CommandNotification.MODIFY_SHEET_TRANSFORM,_loc5_));
               }
         }
         if(!param3)
         {
            _2217._1651();
         }
      }
      
      private function get _3176() : _580
      {
         return _1407.getInstance(_580) as _580;
      }
   }
}

