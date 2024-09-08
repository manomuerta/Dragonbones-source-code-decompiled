package _586
{
   import _1404._1407;
   import _24.Shortcut;
   import _470._469;
   import _472._607;
   import _51._52;
   import _51._79;
   import _521._524;
   import _521._530;
   import _573.TimelinePanelController;
   import _579._580;
   import _708._707;
   import _708._714;
   import _708._715;
   import _708._716;
   import _708._718;
   import _708._719;
   import _783.CommandNotification;
   import _783.StageNotification;
   import _81._85;
   import _81._86;
   import _81._87;
   import _81._88;
   import _81._91;
   import _844._847;
   import _844._849;
   import _844._850;
   import _844._851;
   import _844._852;
   import _844._853;
   import flash.events.MouseEvent;
   import flash.geom.Matrix;
   import flash.geom.Point;
   
   public class _600 extends _599
   {
      private const SCALE_RATE:Number = 0.01;
      
      private var _4344:_852;
      
      private var _5142:Boolean;
      
      private var _5289:_86;
      
      private var _5293:Matrix;
      
      protected var _5299:Boolean = false;
      
      public function _600()
      {
         this._5289 = new _86();
         this._5293 = new Matrix();
         super();
      }
      
      override public function start() : void
      {
         super.start();
         this._5142 = true;
      }
      
      public function stop() : void
      {
         this.dispose();
      }
      
      override protected function init() : void
      {
         super.init();
         this._4344._3326 = _2214._3326;
      }
      
      override protected function _1576() : void
      {
         super._1576();
         _1565(StageNotification.UPDATE_SELECTED_ITEMS,this._4023);
         _1565(StageNotification.UPDATE_COORDINATE_TYPE,this._4767);
         _1565(StageNotification.UPDATE_EDIT_MODE,this._3864);
         _1565(StageNotification.UPDATE_ANIMATION_MODE,this._11432);
         _1565(StageNotification.START_PICK,this._11432);
         _1565(StageNotification.START_EDIT_FFD,this._11432);
         _1565(StageNotification.START_EDIT_RIG,this._11432);
         _1565(StageNotification.START_WEIGHT_TOOL,this._11432);
         _1565(StageNotification.STOP_PICK,this._11432);
         _1565(StageNotification.STOP_EDIT_FFD,this._11432);
         _1565(StageNotification.STOP_EDIT_RIG,this._11432);
         _1565(StageNotification.STOP_WEIGHT_TOOL,this._11432);
         _1565(StageNotification.START_EDIT_BOUNDINGBOX,this._11432);
         _1565(StageNotification.STOP_EDIT_BOUNDINGBOX,this._11432);
         _1565(StageNotification.START_EDIT_MESH_UV,this._11432);
         _1565(StageNotification.STOP_EDIT_MESH_UV,this._11432);
         this._4344.addEventListener(MouseEvent.ROLL_OVER,this._5284);
         this._4344.addEventListener(MouseEvent.ROLL_OUT,this._5285);
         this._4341.addEventListener(MouseEvent.MOUSE_DOWN,this._5104);
         this._5115.addEventListener(MouseEvent.MOUSE_DOWN,this._5104);
         this._5120.addEventListener(MouseEvent.MOUSE_DOWN,this._5104);
         this.pivotPoint.addEventListener(MouseEvent.MOUSE_DOWN,this._5104);
         this._5291.addEventListener(MouseEvent.MOUSE_DOWN,this._5104);
      }
      
      override protected function dispose() : void
      {
         super.dispose();
         _1564(StageNotification.UPDATE_SELECTED_ITEMS,this._4023);
         _1564(StageNotification.UPDATE_COORDINATE_TYPE,this._4767);
         _1564(StageNotification.UPDATE_EDIT_MODE,this._3864);
         _1564(StageNotification.UPDATE_ANIMATION_MODE,this._11432);
         _1564(StageNotification.START_PICK,this._11432);
         _1564(StageNotification.START_EDIT_FFD,this._11432);
         _1564(StageNotification.START_EDIT_RIG,this._11432);
         _1564(StageNotification.STOP_EDIT_FFD,this._11432);
         _1564(StageNotification.STOP_EDIT_RIG,this._11432);
         _1564(StageNotification.START_WEIGHT_TOOL,this._11432);
         _1564(StageNotification.STOP_WEIGHT_TOOL,this._11432);
         _1564(StageNotification.STOP_PICK,this._11432);
         _1564(StageNotification.START_EDIT_BOUNDINGBOX,this._11432);
         _1564(StageNotification.STOP_EDIT_BOUNDINGBOX,this._11432);
         _1564(StageNotification.START_EDIT_MESH_UV,this._11432);
         _1564(StageNotification.STOP_EDIT_MESH_UV,this._11432);
         this._4344.removeEventListener(MouseEvent.ROLL_OVER,this._5284);
         this._4344.removeEventListener(MouseEvent.ROLL_OUT,this._5285);
         this._4341.removeEventListener(MouseEvent.MOUSE_DOWN,this._5104);
         this._5115.removeEventListener(MouseEvent.MOUSE_DOWN,this._5104);
         this._4341.removeEventListener(MouseEvent.MOUSE_DOWN,this._5104);
         this._5120.removeEventListener(MouseEvent.MOUSE_DOWN,this._5104);
         this.pivotPoint.removeEventListener(MouseEvent.MOUSE_DOWN,this._5104);
         this._5291.removeEventListener(MouseEvent.MOUSE_DOWN,this._5104);
      }
      
      private function _4023(param1:StageNotification) : void
      {
         this._5296();
      }
      
      private function _4767(param1:StageNotification) : void
      {
         this._4344._3326 = _2214._3326;
      }
      
      private function _3864(param1:StageNotification) : void
      {
         this._4344._2873 = this._2873;
         if(this._2873 == _715.ARMATURE)
         {
            this._1988();
         }
      }
      
      private function _11432(param1:StageNotification) : void
      {
         this._4891();
      }
      
      private function _5284(param1:MouseEvent) : void
      {
         _1567(new StageNotification(this._5287,this._4344._1897));
      }
      
      private function _5285(param1:MouseEvent) : void
      {
         _1567(new StageNotification(this._5288,this._4344._1897));
      }
      
      private function _5104(param1:MouseEvent) : void
      {
         var _loc2_:Array = null;
         var _loc3_:Object = null;
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:* = false;
         if(!Shortcut._1677())
         {
            _loc2_ = [];
            _loc5_ = _2873 == _715.ANIMATE ? 2 : 1;
            _loc6_ = _2873 == _715.GENERAL;
            if(_5124 == 0)
            {
               _5113.x = param1.stageX;
               _5113.y = param1.stageY;
               if(this._4368 || this._4369)
               {
                  if(this._4344._4902)
                  {
                     _5282(this._1897 as _52);
                  }
                  else
                  {
                     _loc2_ = [];
                     for each(_loc3_ in _2226._2889)
                     {
                        _loc2_.push(_loc3_);
                     }
                     _5111(_2199(_loc2_,1,_loc5_,_loc6_));
                  }
               }
               else if(this._5119 || this._5118)
               {
                  _2549 = this._5294;
                  if(this._5119 && this._5118)
                  {
                     _5123(_2199(_2226._2889.concat(),0,_loc5_,_loc6_));
                  }
                  else
                  {
                     _5113 = this._5120.globalToLocal(_5113);
                     _10783(_2199(_2226._2889.concat(),0,_loc5_,_loc6_));
                  }
               }
               else if(this._5295)
               {
                  _2549 = this._5294;
                  _loc2_ = [];
                  for each(_loc3_ in _2226._2889)
                  {
                     _loc2_.push(_loc3_);
                  }
                  _5117(_2199(_loc2_,0,_loc5_,_loc6_));
               }
               else if(this._5290)
               {
                  _2549 = this._5294;
                  _5113.x = param1.stageX;
                  _5113.y = param1.stageY;
                  _5281(_2199(_2226._2889.concat(),0,2,_loc6_));
               }
            }
            _524._3785(true);
         }
      }
      
      protected function _5296() : void
      {
         var _loc1_:_79 = null;
         if(this._5142)
         {
            this._1897 = _87._2202(_2226._2889);
            if((_2873 == _715.GENERAL || _2873 == _715.COMIC) && this._1897 is _79)
            {
               _loc1_ = this._1897 as _79;
               if(_loc1_._2049)
               {
                  this._1897 = (this._1897 as _79).parentBoneData;
               }
               else
               {
                  this._1897 = null;
               }
            }
         }
         else
         {
            this._1897 = null;
         }
      }
      
      override protected function _4355(param1:Array) : void
      {
         if(this._4344._5122)
         {
            this._4344._4365(this._4368,this._4369,this._5119,this._5118,this._5295,this._5298,this._5290);
         }
         super._4355(param1);
      }
      
      override protected function _5274(param1:MouseEvent) : void
      {
         var _loc2_:_707 = _2214._3326;
         if(_loc2_ == _707.LOCAL)
         {
            this._5289.rotation = -this._1897.globalTransform.rotation;
         }
         else if(_loc2_ == _707.PARENT && Boolean(this._1897["parentBoneData"]))
         {
            this._5289.rotation = -(this._1897["parentBoneData"] as _91).globalTransform.rotation;
         }
         else
         {
            this._5289.rotation = 0;
         }
         _88._2013(this._5289,this._5293);
         var _loc3_:int = int(this._2938.length);
         var _loc4_:Number = (param1.stageX - _5113.x) / _2580;
         var _loc5_:Number = (param1.stageY - _5113.y) / _2580;
         var _loc6_:Matrix;
         (_loc6_ = new Matrix()).tx = _loc4_;
         _loc6_.ty = _loc5_;
         _loc6_.concat(this._5293);
         if(!this._4369)
         {
            _loc6_.ty = 0;
         }
         else if(!this._4368)
         {
            _loc6_.tx = 0;
         }
         _5107(this._2938,_719.GLOBAL,[_718.X,_loc6_.tx,add,_718.Y,_loc6_.ty,add]);
      }
      
      override protected function _5278(param1:MouseEvent) : void
      {
         var _loc2_:_707 = _2214._3326;
         if(_loc2_ == _707.LOCAL)
         {
            this._5289.rotation = -this._1897.globalTransform.rotation;
         }
         else if(_loc2_ == _707.PARENT && Boolean(this._1897["parentBoneData"]))
         {
            this._5289.rotation = -(this._1897["parentBoneData"] as _91).globalTransform.rotation;
         }
         else
         {
            this._5289.rotation = 0;
         }
         _88._2013(this._5289,this._5293);
         var _loc3_:int = int(this._2938.length);
         var _loc4_:Number = (param1.stageX - _5113.x) / _2580;
         var _loc5_:Number = (param1.stageY - _5113.y) / _2580;
         var _loc6_:Matrix;
         (_loc6_ = new Matrix()).tx = _loc4_;
         _loc6_.ty = _loc5_;
         _loc6_.concat(this._5293);
         if(!this._4369)
         {
            _loc6_.ty = 0;
         }
         else if(!this._4368)
         {
            _loc6_.tx = 0;
         }
         _5107(this._2938,_719.GLOBAL,[_718.X,_loc6_.tx,add,_718.Y,_loc6_.ty,add],1,0);
      }
      
      override protected function _5275(param1:MouseEvent) : void
      {
         var _loc5_:Number = NaN;
         var _loc6_:_52 = null;
         var _loc7_:Object = null;
         var _loc2_:Point = new Point(param1.stageX,param1.stageY);
         if(_5113.x > _2549.x && _5113.y < _2549.y)
         {
            if(_loc2_.x < _2549.x && _loc2_.y > _2549.y)
            {
               _loc2_.x = _2549.x;
               _loc2_.y = _2549.y;
            }
         }
         else if(_5113.x < _2549.x && _5113.y < _2549.y)
         {
            if(_loc2_.x > _2549.x && _loc2_.y > _2549.y)
            {
               _loc2_.x = _2549.x;
               _loc2_.y = _2549.y;
            }
         }
         else if(_5113.x < _2549.x && _5113.y > _2549.y)
         {
            if(_loc2_.x > _2549.x && _loc2_.y < _2549.y)
            {
               _loc2_.x = _2549.x;
               _loc2_.y = _2549.y;
            }
         }
         else if(_5113.x > _2549.x && _5113.y > _2549.y)
         {
            if(_loc2_.x < _2549.x && _loc2_.y < _2549.y)
            {
               _loc2_.x = _2549.x;
               _loc2_.y = _2549.y;
            }
         }
         var _loc3_:Number = _85._2185(_2549,_loc2_) / _85._2185(_5113,_2549);
         var _loc4_:Array = [];
         for each(_loc6_ in this._2938)
         {
            _loc5_ = _4971[_loc6_] * _loc3_;
            _loc5_ = _loc5_ < 0 ? 0 : _loc5_;
            _loc4_.push(_loc5_);
         }
         _loc7_ = _469._2979(this._2938,_loc4_);
         this._1567(new CommandNotification(CommandNotification.MODIFY_BONE_ITEMS_LENGTH,_loc7_));
      }
      
      override protected function _5103(param1:MouseEvent) : void
      {
         super._5103(param1);
         _607.instance._5059();
         this._4344._4337();
      }
      
      override protected function _10782(param1:MouseEvent) : void
      {
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc2_:Point = new Point(param1.stageX,param1.stageY);
         _loc2_ = this._5120.globalToLocal(_loc2_);
         var _loc3_:Number = 1;
         var _loc4_:Number = 1;
         var _loc5_:Number = _loc2_.x - _5113.x;
         var _loc6_:Number = _loc2_.y - _5113.y;
         if(this._5119 && this._5118)
         {
            _loc8_ = _85._2185(_5113,_loc2_);
            if(_loc8_ == 0)
            {
               _loc3_ = 1;
            }
            else
            {
               _loc9_ = Math.abs(_loc6_) + Math.abs(_loc5_);
               _loc10_ = _loc5_ / _loc9_;
               _loc11_ = _loc6_ / _loc9_;
               _loc3_ = 1 + (_loc10_ + _loc11_) * _loc8_ * this.SCALE_RATE / _2580;
            }
            if(_loc3_ == 0)
            {
               _loc3_ = 0.01;
            }
            _loc4_ = _loc3_;
         }
         else if(this._5119)
         {
            _loc3_ = 1 + _loc5_ * this.SCALE_RATE / _2580;
            if(_13876)
            {
               _loc4_ = _loc3_;
            }
            else
            {
               _loc4_ = 1;
            }
         }
         else if(this._5118)
         {
            _loc4_ = 1 + _loc6_ * this.SCALE_RATE / _2580;
            if(_13876)
            {
               _loc3_ = _loc4_;
            }
            else
            {
               _loc3_ = 1;
            }
         }
         var _loc7_:_719 = this._2969 ? _719.LOCAL : _719.GLOBAL;
         _5107(this._2938,_loc7_,[_718.SCALE_X,_loc3_,mul,_718.SCALE_Y,_loc4_,mul]);
      }
      
      public function _1988() : void
      {
         this._5296();
         this._4344._1988();
      }
      
      public function _1751() : void
      {
         this._4344._1751();
      }
      
      public function _4891() : void
      {
         this.enabled = this._3176._3332 != _716.POSE && this._3176._3332 != _716.CREATE_BONE && this._3176._3332 != _716.WEIGHT && _2220._4000 == _714.STOP && !_530.instance._3832 && this._3008._4358 == null && !this._3008._2119 && this._11296._4358 == null && this._11296._11339 == _11247.BOUNDINGBOX_MODE_NORMAL && !this._11621.editing;
      }
      
      private function set enabled(param1:Boolean) : void
      {
         if(this._5142 == param1)
         {
            return;
         }
         this._5142 = param1;
         this._5296();
      }
      
      public function set _4313(param1:_852) : void
      {
         if(this._4344 == param1)
         {
            return;
         }
         if(this._4344)
         {
            this.dispose();
         }
         this._4344 = param1;
         if(this._4344)
         {
            this.start();
         }
      }
      
      public function get _1897() : _91
      {
         if(this._4344 == null)
         {
            return null;
         }
         return this._4344._1897;
      }
      
      public function set _1897(param1:_91) : void
      {
         if(this._4344 == null)
         {
            return;
         }
         this._4344._5286 = _2873 == _715.ARMATURE && param1 is _52;
         if(_2873 == _715.GENERAL && param1 is _79)
         {
            param1 = (param1 as _79).parentBoneData;
         }
         else if(_2873 == _715.ANIMATE && param1 is _79)
         {
            param1 = null;
         }
         this._4344._1897 = param1;
      }
      
      public function get _5300() : Boolean
      {
         return this._5299;
      }
      
      public function set _5300(param1:Boolean) : void
      {
         this._5299 = param1;
      }
      
      public function set _4902(param1:Boolean) : void
      {
         this._4344._4902 = param1;
      }
      
      private function get _5115() : _850
      {
         return this._4344._5115;
      }
      
      private function get _4341() : _853
      {
         return this._4344._4341;
      }
      
      public function get _5120() : _851
      {
         return this._4344._5120;
      }
      
      private function get pivotPoint() : _847
      {
         return this._4344.pivotPoint;
      }
      
      private function get _5291() : _849
      {
         return this._4344._5291;
      }
      
      public function get _4368() : Boolean
      {
         return this._4341._4368 || this._5298;
      }
      
      public function get _4369() : Boolean
      {
         return this._4341._4369 || this._5298;
      }
      
      public function get _5119() : Boolean
      {
         return this._5120._4368;
      }
      
      public function get _5118() : Boolean
      {
         return this._5120._4369;
      }
      
      public function get _5295() : Boolean
      {
         return this._5115._4368 && this._5115._4369;
      }
      
      public function get _5298() : Boolean
      {
         return this.pivotPoint._5297;
      }
      
      public function get _5290() : Boolean
      {
         return this._5291._5292;
      }
      
      public function get _5294() : Point
      {
         return this._4344.localToGlobal(new Point(0,0));
      }
      
      override public function get _4763() : String
      {
         if(this._4344._4902)
         {
            return CommandNotification.MODIFY_PIVOT;
         }
         if(this._1897 is _52)
         {
            if(_2873 == _715.ANIMATE)
            {
               if(this._2852.adjusting)
               {
                  return CommandNotification.MODIFY_MULT_BONE_FRAME_TRANSFORM;
               }
            }
            return _2873 == _715.ARMATURE ? CommandNotification.MODIFY_BONE_TRANSFORM : (_2873 == _715.ANIMATE ? CommandNotification.MODIFY_BONE_FRAME_TRANSFORM : (_2873 == _715.GENERAL ? CommandNotification.MODIFY_BASIC_BONE_FRAME_TRANSFORM : (_2873 == _715.COMIC ? CommandNotification.MODIFY_COMICOBJECT_TRANSFORM : null)));
         }
         if(this._1897 is _79)
         {
            if(_2873 == _715.SHEET)
            {
               return CommandNotification.MODIFY_SHEET_TRANSFORM;
            }
            return CommandNotification.MODIFY_SLOT_TRANSFORM;
         }
         return "";
      }
      
      private function get _5287() : String
      {
         if(this._1897 is _52)
         {
            return StageNotification.ROLLOVER_BONE;
         }
         if(this._1897 is _79)
         {
            return StageNotification.ROLLOVER_SLOT;
         }
         return "";
      }
      
      private function get _5288() : String
      {
         if(this._1897 is _52)
         {
            return StageNotification.ROLLOUT_BONE;
         }
         if(this._1897 is _79)
         {
            return StageNotification.ROLLOUT_SLOT;
         }
         return "";
      }
      
      private function get _3176() : _580
      {
         return _1407.getInstance(_580) as _580;
      }
      
      private function get _3008() : _594
      {
         return _1407.getInstance(_594) as _594;
      }
      
      private function get _11296() : _11247
      {
         return _1407.getInstance(_11247) as _11247;
      }
      
      private function get _11621() : _11505
      {
         return _1407.getInstance(_11505) as _11505;
      }
      
      private function get _2852() : TimelinePanelController
      {
         return _1407.getInstance(TimelinePanelController) as TimelinePanelController;
      }
      
      override public function set _10761(param1:int) : void
      {
         super._10761 = param1;
         this._4344._10784(_10760);
      }
   }
}

