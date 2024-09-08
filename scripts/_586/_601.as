package _586
{
   import _1038._1039;
   import _127._146;
   import _1404._1407;
   import _214._213;
   import _24.Shortcut;
   import _470._469;
   import _51._52;
   import _51._79;
   import _521._524;
   import _521._530;
   import _541._540;
   import _579._580;
   import _708._714;
   import _708._715;
   import _708._716;
   import _708._718;
   import _708._719;
   import _710._711;
   import _710._712;
   import _73._74;
   import _783.CommandNotification;
   import _783.MenuNotification;
   import _783.StageNotification;
   import _81._85;
   import _81._91;
   import _953._954;
   import _953._956;
   import _953._958;
   import _97._103;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class _601 extends _602
   {
      public var _2877:_588;
      
      public var _2909:_598;
      
      private var _5097:_956;
      
      private var _5001:DisplayObject;
      
      private var _5307:Boolean = true;
      
      private var _5142:Boolean;
      
      private var _5318:Boolean;
      
      private var _5315:Boolean;
      
      private var _5317:Boolean;
      
      private var _11433:Boolean;
      
      private var _11691:Boolean;
      
      private var _3830:Boolean = false;
      
      public function _601()
      {
         this._2877 = _1407.getInstance(_588) as _588;
         this._2909 = _1407.getInstance(_598) as _598;
         super();
      }
      
      override public function start() : void
      {
         super.start();
      }
      
      override protected function _1576() : void
      {
         _2227 = true;
         super._1576();
         _1565(StageNotification.START_TRANSFORM,this._5312);
         _1565(StageNotification.STOP_TRANSFORM,this._5314);
         _1565(StageNotification.START_PICK,this._4524);
         _1565(StageNotification.STOP_PICK,this._4439);
         _1565(StageNotification.START_EDIT_FFD,this._5020);
         _1565(StageNotification.START_EDIT_RIG,this._5019);
         _1565(StageNotification.START_EDIT_WEIGHT,this._5309);
         _1565(StageNotification.START_WEIGHT_TOOL,this._4388);
         _1565(StageNotification.STOP_WEIGHT_TOOL,this._4404);
         _1565(StageNotification.START_EDIT_BOUNDINGBOX,this._11407);
         _1565(StageNotification.START_EDIT_MESH_UV,this._11626);
         this._5097.addEventListener(MouseEvent.ROLL_OVER,this._5305);
         this._5097.addEventListener(MouseEvent.ROLL_OUT,this._5308);
         this._5097.addEventListener(MouseEvent.MOUSE_MOVE,this._5304);
         this._5097.addEventListener(MouseEvent.MOUSE_DOWN,this._5303);
         this._5097.addEventListener(MouseEvent.CLICK,this._5313);
         this._5097.addEventListener(MouseEvent.RIGHT_CLICK,this._5302);
         _1565(MenuNotification.PASTE_TRANSFORM,this._5310);
         _1565(MenuNotification.COPY_TRANSFORM,this._14575);
      }
      
      private function _14575(param1:MenuNotification) : void
      {
         var _loc3_:Object = null;
         var _loc2_:Object = _2226._2889[0];
         if(Boolean(_loc2_) && (_loc2_ is _52 || _loc2_ is _79))
         {
            _loc3_ = {"_1783":_loc2_};
            _1567(new CommandNotification(CommandNotification.COPY_TRANSFORM,_loc3_));
         }
      }
      
      private function _5310(param1:MenuNotification) : void
      {
         var _loc2_:String = null;
         var _loc3_:_91 = null;
         var _loc4_:_719 = null;
         var _loc5_:Array = null;
         var _loc6_:Object = null;
         var _loc7_:Array = null;
         if(_2226._2889.length == 1)
         {
            if(_2873 == _715.ARMATURE)
            {
               if(_2226._3872 != null)
               {
                  _loc3_ = _2226._3872;
                  _loc2_ = CommandNotification.MODIFY_BONE_TRANSFORM;
               }
               else if(_2226._3150 != null)
               {
                  _loc3_ = _2226._3150;
                  _loc2_ = CommandNotification.MODIFY_SLOT_TRANSFORM;
               }
            }
            else if(_2873 == _715.ANIMATE)
            {
               if(_2226._3872 != null)
               {
                  _loc3_ = _2226._3872;
                  _loc2_ = CommandNotification.MODIFY_ITEMS_TRANSFORM;
               }
               else if(_2226._3150 != null)
               {
                  _loc3_ = _2226._3150;
                  _loc2_ = CommandNotification.MODIFY_SLOT_TRANSFORM;
               }
            }
            if(_loc2_ == null)
            {
               return;
            }
            _loc4_ = _719.LOCAL;
            _loc5_ = [_718.ROTATION,_213.transform.rotation,_718.X,_213.transform.x,_718.Y,_213.transform.y,_718.SCALE_X,_213.transform.scaleX,_718.SCALE_Y,_213.transform.scaleY,_718.SKEW_X,_213.transform.skewX,_718.SKEW_Y,_213.transform.skewY];
            _loc6_ = _469._2980(_loc3_,_loc4_,_loc5_);
            if(_loc2_ == CommandNotification.MODIFY_ITEMS_TRANSFORM)
            {
               _loc7_ = [_718.ROTATION,[_213.transform.rotation],_718.X,[_213.transform.x],_718.Y,[_213.transform.y],_718.SCALE_X,[_213.transform.scaleX],_718.SCALE_Y,[_213.transform.scaleY],_718.SKEW_X,[_213.transform.skewX],_718.SKEW_Y,[_213.transform.skewY]];
               _loc6_ = _469._3476([_loc3_],1,_2873,_loc4_,_loc7_);
            }
            this._1567(new CommandNotification(_loc2_,_loc6_));
            this._2217._1651();
         }
      }
      
      override protected function dispose() : void
      {
         super.dispose();
         _1564(StageNotification.START_TRANSFORM,this._5312);
         _1564(StageNotification.STOP_TRANSFORM,this._5314);
         _1564(StageNotification.START_PICK,this._4524);
         _1564(StageNotification.STOP_PICK,this._4439);
         _1564(StageNotification.START_EDIT_FFD,this._5020);
         _1564(StageNotification.START_EDIT_WEIGHT,this._5309);
         _1564(StageNotification.START_EDIT_RIG,this._5019);
         _1564(MenuNotification.PASTE_TRANSFORM,this._5310);
         _1564(StageNotification.START_EDIT_BOUNDINGBOX,this._11407);
         _1564(StageNotification.STOP_EDIT_BOUNDINGBOX,this._11345);
         _1564(StageNotification.START_EDIT_MESH_UV,this._11626);
         _1564(StageNotification.STOP_EDIT_MESH_UV,this._11627);
         this._5097.removeEventListener(MouseEvent.ROLL_OVER,this._5305);
         this._5097.removeEventListener(MouseEvent.ROLL_OUT,this._5308);
         this._5097.removeEventListener(MouseEvent.MOUSE_MOVE,this._5304);
         this._5097.removeEventListener(MouseEvent.MOUSE_DOWN,this._5303);
         this._5097.removeEventListener(MouseEvent.CLICK,this._5313);
         this._5097.removeEventListener(MouseEvent.RIGHT_CLICK,this._5302);
      }
      
      private function _4404(param1:StageNotification) : void
      {
         if(this._5315)
         {
            this._5311(null);
         }
      }
      
      private function _4388(param1:StageNotification) : void
      {
         if(this._5318)
         {
            this._5023(null);
         }
      }
      
      private function _5019(param1:StageNotification) : void
      {
         this._5317 = true;
         this._5316();
         this._2909._5268 = null;
         _1565(StageNotification.STOP_EDIT_RIG,this._5022);
      }
      
      private function _5022(param1:StageNotification) : void
      {
         this._5317 = false;
         _1564(StageNotification.STOP_EDIT_RIG,this._5022);
         this._5316();
      }
      
      private function _5020(param1:StageNotification) : void
      {
         this._5318 = true;
         this._5316();
         this._2909._5268 = null;
         _1565(StageNotification.STOP_EDIT_FFD,this._5023);
      }
      
      private function _5023(param1:StageNotification) : void
      {
         this._5318 = false;
         _1564(StageNotification.STOP_EDIT_FFD,this._5023);
         this._5316();
      }
      
      private function _5309(param1:StageNotification) : void
      {
         if(!this._5315)
         {
            this._5315 = true;
            this._5316();
            this._2909._5268 = null;
            _1565(StageNotification.STOP_EDIT_WEIGHT,this._5311);
         }
      }
      
      private function _5311(param1:StageNotification) : void
      {
         this._5315 = false;
         _1564(StageNotification.STOP_EDIT_WEIGHT,this._5311);
         this._5316();
      }
      
      private function _11407(param1:StageNotification) : void
      {
         this._11433 = true;
         this._5316();
         this._2909._5268 = null;
         _1565(StageNotification.STOP_EDIT_BOUNDINGBOX,this._11345);
      }
      
      private function _11345(param1:StageNotification) : void
      {
         this._11433 = false;
         _1564(StageNotification.STOP_EDIT_BOUNDINGBOX,this._11345);
         this._5316();
      }
      
      private function _11626(param1:StageNotification) : void
      {
         this._11691 = true;
         this._5316();
         this._2909._5268 = null;
         _1565(StageNotification.STOP_EDIT_MESH_UV,this._11627);
      }
      
      private function _11627(param1:StageNotification) : void
      {
         this._11691 = false;
         _1564(StageNotification.STOP_EDIT_MESH_UV,this._11627);
         this._5316();
      }
      
      private function _5316() : void
      {
         if(this._5318 || this._5317 || this._5315 || this._11433 || this._11691)
         {
            if(_2227)
            {
               this.dispose();
            }
         }
         else if(!_2227)
         {
            this._1576();
         }
      }
      
      private function _5312(param1:StageNotification) : void
      {
         this._5307 = false;
      }
      
      private function _5314(param1:StageNotification) : void
      {
         this._5307 = true;
      }
      
      private function _4524(param1:StageNotification) : void
      {
         this._3830 = true;
         this._2909._5268 = null;
      }
      
      private function _4439(param1:StageNotification) : void
      {
         this._3830 = false;
         if(this._5097._4901)
         {
            this._5304(null);
         }
         else
         {
            this._2909._5268 = null;
         }
      }
      
      protected function _5305(param1:MouseEvent) : void
      {
         this._5097._4901 = true;
         this._5304(param1);
      }
      
      protected function _5308(param1:MouseEvent) : void
      {
         this._5097._4901 = false;
         this._2909._5268 = null;
      }
      
      protected function _5304(param1:MouseEvent) : void
      {
         if(_2226._3315 && _3176._3332 != _716.POSE)
         {
            this._2909._5068(new Point(stage.mouseX,stage.mouseY));
         }
      }
      
      protected function _5303(param1:MouseEvent) : void
      {
         if(_2220._4000 == _714.PLAY || Shortcut._1677() || this._3332 == _716.POSE || this._3332 == _716.CREATE_BONE || this._3332 == _716.WEIGHT || _530.instance._3832)
         {
            return;
         }
         if(Boolean(_2226._3855) || Boolean(this._5012))
         {
            this._5016();
            _524._3785(true);
            _3176._2581();
         }
      }
      
      protected function _5313(param1:MouseEvent) : void
      {
         if(_530.instance._3832)
         {
            _1567(new StageNotification(StageNotification.PICK_ITEM,null));
            _524._3785("click","pick");
         }
         if(!this._5307)
         {
            return;
         }
         if(this._5307 && Boolean(this._5012))
         {
            if(Shortcut._1677())
            {
               _1567(new CommandNotification(CommandNotification.ADD_REMOVE_SELECT_ITEM,this._5012));
            }
            else
            {
               _1567(new CommandNotification(CommandNotification.SELECT_ITEMS,[this._5012]));
            }
         }
      }
      
      protected function _5302(param1:MouseEvent) : void
      {
         var _loc2_:Array = null;
         var _loc3_:Array = null;
         if(_530.instance._3832)
         {
            return;
         }
         this._5097._4901 = true;
         this._5304(param1);
         if(this._5012)
         {
            if(_2226._3871(this._5012))
            {
               _loc3_ = _2226._3863;
               if(_loc3_.length != _2226._2889.length)
               {
                  _1567(new CommandNotification(CommandNotification.SELECT_ITEMS,_loc3_));
                  param1.stopPropagation();
                  return;
               }
               _loc2_ = _2226._2889;
            }
            else
            {
               _loc2_ = [this._5012];
               _1567(new CommandNotification(CommandNotification.SELECT_ITEMS,_loc2_));
            }
            if(this._5012 is _79)
            {
               this._3975._3934(_711.STAGE,_712._4476((this._5012 as _79)._2049.type),_loc2_);
            }
            param1.stopPropagation();
         }
      }
      
      override protected function _5016() : void
      {
         var _loc1_:Array = null;
         var _loc2_:Array = null;
         var _loc3_:Object = null;
         var _loc4_:_146 = null;
         super._5016();
         if(!this._5012)
         {
            _loc2_ = [];
            for each(_loc3_ in _2226._2889)
            {
               _loc2_.push(_loc3_);
            }
            _loc1_ = _2199(_loc2_,0,_2873 == _715.ANIMATE ? 2 : 1,_2873 == _715.GENERAL);
            if(_loc1_.length > 0)
            {
               _loc4_ = this._2467;
               if(_loc4_)
               {
                  _5113 = new Point(stage.mouseX,stage.mouseY);
                  _2549 = _5301;
                  switch(_10760)
                  {
                     case TRANSFORM_FREE:
                     case TRANSFORM_ROTATE:
                        _5117(_loc1_);
                        break;
                     case TRANSFORM_TRANSLATE:
                        _loc1_ = _2199(_loc2_,1,_2873 == _715.ANIMATE ? 2 : 1,_2873 == _715.GENERAL);
                        _5111(_loc1_);
                        break;
                     case TRANSFORM_SCALE:
                        _loc1_ = _2199(_loc2_,1,_2873 == _715.ANIMATE ? 2 : 1,_2873 == _715.GENERAL);
                        if(this._4850._5120)
                        {
                           _5113 = this._4850._5120.globalToLocal(_5113);
                        }
                        _10783(_loc1_);
                  }
               }
            }
         }
      }
      
      public function _4906(param1:_954, param2:_958, param3:_956) : void
      {
         if(this._5097 == param3)
         {
            return;
         }
         if(this._5097)
         {
            this.dispose();
         }
         this._5097 = param3;
         if(this._5097)
         {
            this.start();
         }
         this._5001 = param1;
         this._2877._5143 = param1;
         this._2909._5143 = param2;
      }
      
      override protected function _10785(param1:Array) : void
      {
         var _loc2_:_91 = null;
         switch(_10760)
         {
            case TRANSFORM_FREE:
            case TRANSFORM_TRANSLATE:
               _5111(param1);
               break;
            case TRANSFORM_ROTATE:
               _loc2_ = param1[0] as _91;
               if(Boolean(this._5001) && Boolean(_loc2_))
               {
                  _2549 = this._5001.localToGlobal(new Point(_loc2_.globalTransform.x,_loc2_.globalTransform.y));
               }
               _5117(param1);
               break;
            case TRANSFORM_SCALE:
               _10783(param1);
         }
      }
      
      public function _5306() : void
      {
         this._2877._5008(_2226._2889);
         this._2909._5271(_2226._2889);
      }
      
      public function _5320() : void
      {
         var _loc1_:_1039 = null;
         var _loc2_:* = undefined;
         if(this._2877._3198)
         {
            _loc1_ = this._2877._3198.dataProvider;
            for each(_loc2_ in _loc1_)
            {
               _103.addItem(_loc2_);
               _loc1_._4016(_loc2_);
            }
         }
         _loc1_ = this._2909._5273.dataProvider;
         for each(_loc2_ in this._2909._5273.dataProvider)
         {
            _103.addItem(_loc2_);
            _loc1_._4016(_loc2_);
         }
         this._5306();
      }
      
      public function _5319() : void
      {
         var _loc1_:_1039 = null;
         var _loc2_:* = undefined;
         _loc1_ = this._2909._5273.dataProvider;
         for each(_loc2_ in this._2909._5273.dataProvider)
         {
            if(_loc2_ is _79 && (_loc2_ as _79)._2049 && (_loc2_ as _79)._2049.type == _74.MESH)
            {
               _103.addItem(_loc2_);
               _loc1_._4016(_loc2_);
            }
         }
      }
      
      override public function get _5012() : _91
      {
         return this._2909._5012 || this._2877._5012;
      }
      
      protected function get _2467() : _146
      {
         if(_2226._3872 && this._2877 && Boolean(this._2877._3198))
         {
            return this._2877._3198._2474(_2226._3872) as _146;
         }
         if(_2226._3150 && this._2909 && Boolean(this._2909._5273))
         {
            return this._2909._5273._2474(_2226._3150) as _146;
         }
         return null;
      }
      
      override public function get _4763() : String
      {
         if(this._2938[0] is _52)
         {
            return this._2877._4763;
         }
         if(this._2938[0] is _79)
         {
            return this._2909._4763;
         }
         return "";
      }
      
      protected function get _4850() : _600
      {
         return _1407.getInstance(_600) as _600;
      }
      
      protected function get _3975() : _540
      {
         return _1407.getInstance(_540) as _540;
      }
      
      public function get _3332() : _716
      {
         return (_1407.getInstance(_580) as _580)._3332;
      }
      
      override protected function _10782(param1:MouseEvent) : void
      {
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc2_:Number = 0.01;
         var _loc3_:Point = new Point(param1.stageX,param1.stageY);
         if(this._4850._5120)
         {
            _loc3_ = this._4850._5120.globalToLocal(_loc3_);
         }
         var _loc4_:Number = 1;
         var _loc5_:Number = _loc3_.x - _5113.x;
         var _loc6_:Number = _loc3_.y - _5113.y;
         var _loc7_:Number = _85._2185(_5113,_loc3_);
         if(_loc7_ == 0)
         {
            _loc4_ = 1;
         }
         else
         {
            _loc9_ = Math.abs(_loc6_) + Math.abs(_loc5_);
            _loc10_ = _loc5_ / _loc9_;
            _loc11_ = _loc6_ / _loc9_;
            _loc4_ = 1 + (_loc10_ + _loc11_) * _loc7_ * _loc2_ / _2580;
         }
         if(_loc4_ == 0)
         {
            _loc4_ = 0.01;
         }
         var _loc8_:_719 = this._2969 ? _719.LOCAL : _719.GLOBAL;
         _5107(this._2938,_loc8_,[_718.SCALE_X,_loc4_,mul,_718.SCALE_Y,_loc4_,mul]);
      }
   }
}

