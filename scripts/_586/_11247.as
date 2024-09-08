package _586
{
   import _11220._11219;
   import _11243._11242;
   import _11243._11244;
   import _11243._11245;
   import _11243._11246;
   import _11250._11249;
   import _11254._11253;
   import _13._12;
   import _13._14;
   import _1404._1407;
   import _51._70;
   import _51._79;
   import _521._11241;
   import _555._570;
   import _579._580;
   import _6._9;
   import _658._661;
   import _703._705;
   import _708._715;
   import _73._74;
   import _783.BoundingBoxNotification;
   import _783.CommandNotification;
   import _783.StageNotification;
   import _81._86;
   import _81._88;
   import _877._887;
   import _93._94;
   import _953._956;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Matrix;
   import flash.geom.Point;
   
   public class _11247 extends _94
   {
      public static const BOUNDINGBOX_MODE_NORMAL:int = -1;
      
      public static const BOUNDINGBOX_MODE_CREATE:int = 0;
      
      public static const BOUNDINGBOX_MODE_DELETE:int = 1;
      
      public static const BOUNDINGBOX_MODE_NEW:int = 2;
      
      public static const BOUNDINGBOX_MODE_STOP_NEW:int = 3;
      
      public static const MOUSE_CURSOR_WEIGHT:int = 100;
      
      private var _5157:_11241;
      
      private var _zoom:Number = 1;
      
      private var _4344:_887;
      
      private var _11394:_11253;
      
      private var _11381:_11249;
      
      private var _11410:_70;
      
      private var _11383:_11219;
      
      private var _4213:_79;
      
      private var _11425:Boolean;
      
      private var _5188:Boolean;
      
      private var _5097:_956;
      
      private var _11416:_11245;
      
      private var _11413:_11242;
      
      private var _4304:_11244;
      
      private var _11417:_11246;
      
      private var _4308:_11245;
      
      private var _2205:Matrix;
      
      private var _5174:_661;
      
      private var _5180:Matrix;
      
      private var _5161:Boolean;
      
      private var _5641:Boolean;
      
      private var _11420:int = -1;
      
      private var _11418:Boolean = true;
      
      private var _11414:Boolean;
      
      public function _11247()
      {
         this._11416 = _1407.getInstance(_11245) as _11245;
         this._11413 = _1407.getInstance(_11242) as _11242;
         this._4304 = _1407.getInstance(_11244) as _11244;
         this._11417 = _1407.getInstance(_11246) as _11246;
         super();
         this._5157 = _1407.getInstance(_11241) as _11241;
      }
      
      override protected function _1576() : void
      {
         super._1576();
         _1565(StageNotification.UPDATE_SELECTED_ITEMS,this._4023);
         _1565(BoundingBoxNotification.UPDATE_SELECTED_VERTEX,this._11409);
         _1565(BoundingBoxNotification.EDIT,this._11341);
         _1565(BoundingBoxNotification.FREEZE,this._11338);
         _1565(BoundingBoxNotification.START_EDIT,this._6583);
         _1565(BoundingBoxNotification.STOP_EDIT,this._11429);
         _1565(BoundingBoxNotification.CHANGE_MODE,this._11423);
         _1565(BoundingBoxNotification.END_NEW,this._11431);
         _1565(BoundingBoxNotification.DOUBLE_CLICK,this._4004);
         _1565(StageNotification.UPDATE_EDIT_MODE,this._3864);
         _1565(StageNotification.START_EDIT_BOUNDINGBOX,this._11412,1000);
         _1565(StageNotification.STOP_EDIT_BOUNDINGBOX,this._11415,1000);
         if(_2214 && _2214._1844 && _2214._1844._2871 && Boolean(_2214._1844._2871._3286))
         {
            this._zoom = _2214._1844._2871._3286.zoom;
         }
      }
      
      private function _11415(param1:StageNotification) : void
      {
         this._5188 = false;
         _14.setCursor(_12.CURSOR_MOVE,100);
         _14._1602(_12.CURSOR_MOVE);
      }
      
      private function _11412(param1:StageNotification) : void
      {
         this._5188 = true;
      }
      
      private function _4004(param1:BoundingBoxNotification) : void
      {
         _1567(new BoundingBoxNotification(BoundingBoxNotification.EDIT));
      }
      
      private function _3864(param1:StageNotification) : void
      {
         if(this._11420 != BOUNDINGBOX_MODE_NORMAL)
         {
            _1567(new BoundingBoxNotification(BoundingBoxNotification.STOP_EDIT));
         }
         if(_2226._2484 is _79 && (_2226._2484 as _79)._2049 && (_2226._2484 as _79)._2049.type == _74.BOUNDINGBOX)
         {
            this.refresh(_2226._2484 as _79);
         }
         else if(_2226._2484 is _70 && (_2226._2484 as _70).type == _74.BOUNDINGBOX)
         {
            this.refresh((_2226._2484 as _70)._1760);
         }
      }
      
      private function _11430(param1:MouseEvent) : void
      {
         this._11414 = false;
         if(this._11418)
         {
            if(!this._2853._11328())
            {
               if(this._11420 != BOUNDINGBOX_MODE_NORMAL)
               {
                  _1567(new BoundingBoxNotification(BoundingBoxNotification.STOP_EDIT));
                  this._11414 = true;
                  param1.stopImmediatePropagation();
               }
            }
         }
      }
      
      private function _11427(param1:MouseEvent) : void
      {
         if(this._11414)
         {
            param1.stopImmediatePropagation();
         }
      }
      
      private function _11431(param1:BoundingBoxNotification) : void
      {
         this._11339 = BOUNDINGBOX_MODE_CREATE;
      }
      
      private function _11423(param1:BoundingBoxNotification) : void
      {
         this._11420 = param1.data;
         if(this._11381)
         {
            this._11381.clear();
         }
         switch(param1.data)
         {
            case BOUNDINGBOX_MODE_CREATE:
               this._11421 = this._11413;
               break;
            case BOUNDINGBOX_MODE_DELETE:
               this._11421 = this._4304;
               break;
            case BOUNDINGBOX_MODE_NEW:
               this._11421 = this._11417;
               break;
            case BOUNDINGBOX_MODE_NORMAL:
               this._11421 = this._11416;
               this._4308._5167(this._5174);
               break;
            case BOUNDINGBOX_MODE_STOP_NEW:
               if(this._4308 == this._11417)
               {
                  this._11417.redo();
               }
               break;
            default:
               this._11421 = null;
         }
      }
      
      private function _11424() : void
      {
         this._5641 = false;
         this._11339 = BOUNDINGBOX_MODE_NORMAL;
         if(this._5174)
         {
            this._4344._1897 = this._5174;
         }
         else
         {
            this._5157._3024();
            _14._1602(_12.AUTO);
         }
      }
      
      private function _11429(param1:BoundingBoxNotification) : void
      {
         this._11424();
      }
      
      private function _6583(param1:BoundingBoxNotification) : void
      {
         this._5641 = true;
         this._11339 = BOUNDINGBOX_MODE_CREATE;
      }
      
      private function _11338(param1:BoundingBoxNotification) : void
      {
         var _loc2_:_79 = null;
         var _loc3_:_70 = null;
         var _loc4_:_11219 = null;
         var _loc5_:Vector.<Point> = null;
         var _loc6_:Vector.<Point> = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:_86 = null;
         var _loc10_:String = null;
         var _loc11_:Point = null;
         if(_2220._2873 != _715.ARMATURE)
         {
            return;
         }
         if(this._11381)
         {
            _loc2_ = this._11381._1837;
            _loc3_ = this._11381.vo;
            _loc4_ = this._11383;
            if(_loc2_ && _loc3_ && Boolean(_loc4_))
            {
               _loc5_ = new Vector.<Point>();
               _loc6_ = new Vector.<Point>();
               _loc7_ = 0;
               _loc8_ = int(_loc4_.vertices.length);
               while(_loc7_ < _loc8_)
               {
                  (_loc11_ = new Point()).x = _loc4_.vertices[_loc7_].x;
                  _loc11_.y = _loc4_.vertices[_loc7_].y;
                  _loc6_.push(_loc11_);
                  _loc7_++;
               }
               this._2205 = new Matrix();
               (_loc9_ = this._11410.localTransform.clone()).x = 0;
               _loc9_.y = 0;
               _88._2013(_loc9_,this._2205);
               _loc7_ = 0;
               _loc8_ = int(_loc6_.length);
               while(_loc7_ < _loc8_)
               {
                  _loc5_.push(this._2205.transformPoint(_loc6_[_loc7_]));
                  _loc7_++;
               }
               _loc10_ = CommandNotification.FREEZE_BOUNDINGBOX;
               _1567(new CommandNotification(_loc10_,{
                  "_1837":this._11381._1837,
                  "_11299":this._11381.vo,
                  "_11278":this._11383,
                  "boundingBoxModel":this._11381,
                  "_11302":_loc6_,
                  "_11303":_loc5_,
                  "_2976":_loc9_
               }));
            }
         }
      }
      
      private function _11341(param1:BoundingBoxNotification) : void
      {
         if(_2220._2873 != _715.ARMATURE)
         {
            return;
         }
         if(this._5641)
         {
            _1567(new BoundingBoxNotification(BoundingBoxNotification.STOP_EDIT));
         }
         else
         {
            _1567(new BoundingBoxNotification(BoundingBoxNotification.START_EDIT));
         }
      }
      
      public function _4906(param1:_11253, param2:_956, param3:_887) : void
      {
         if(this._5097)
         {
            this._11299 = null;
            this._5183();
         }
         this._11395 = param1;
         this._5097 = param2;
         this._4313 = param3;
         this._11416._4906(param1,param2,param3);
         this._11413._4906(param1,param2,param3);
         this._4304._4906(param1,param2,param3);
         this._11417._4906(param1,param2,param3);
      }
      
      public function set _11395(param1:_11253) : void
      {
         this._11394 = param1;
         if(this._4344)
         {
            this._4344._2026 = this._11394.transform.matrix;
         }
      }
      
      public function set _4313(param1:_887) : void
      {
         this._4344 = param1;
         if(this._11394)
         {
            this._4344._2026 = this._11394._2162;
         }
      }
      
      private function _4023(param1:StageNotification) : void
      {
         var _loc2_:_79 = null;
         var _loc3_:_70 = null;
         if(this._5641)
         {
            _1567(new BoundingBoxNotification(BoundingBoxNotification.STOP_EDIT));
         }
         if(_2220._2873 != _715.ARMATURE)
         {
            return;
         }
         if(_2226._2889.length == 1)
         {
            if(_2226._3150 != null)
            {
               _loc2_ = _2226._3150;
            }
            else if(_2226._2484 is _70)
            {
               _loc2_ = (_2226._2484 as _70)._1760;
            }
            if(_2226._2484 is _79 && (_2226._2484 as _79)._2049 && (_2226._2484 as _79)._2049.type == _74.BOUNDINGBOX)
            {
               _loc3_ = (_2226._2484 as _79)._2049;
            }
            else if(_2226._2484 is _70 && (_2226._2484 as _70).type == _74.BOUNDINGBOX && (_2226._2484 as _70)._1760._2049 == _2226._2484)
            {
               _loc3_ = _2226._2484 as _70;
            }
            else
            {
               _loc3_ = null;
            }
            if(_loc3_ != this._11410 || _loc2_ != this._4213)
            {
               this._4213 = _loc2_;
               this._11299 = _loc3_;
               this._5157._3024();
            }
         }
         else
         {
            this._4213 = null;
            this._11299 = null;
            this._5157._3024();
         }
      }
      
      private function _11409(param1:BoundingBoxNotification) : void
      {
         this._5174 = param1.data as _661;
         this._11411();
      }
      
      private function _11411() : void
      {
         if(this._5174 != null)
         {
            this._3139();
            this._5163();
            if(this._4308)
            {
               this._4308._11398 = this._5180;
            }
         }
         else if(!this._5641)
         {
            if(this._11381 && this._4213 && this._11383 && Boolean(this._4213.parentBoneData))
            {
               _2226._2484 = this._4213;
            }
            else
            {
               this._4213 = null;
               this._11421 = null;
            }
         }
      }
      
      public function set _11299(param1:_70) : void
      {
         if(this._11410 != param1)
         {
            this._11410 = param1;
            if(this._11410 == null && Boolean(this._11381))
            {
               this._5157._3024();
               this._11381._3823 = null;
               this._11381._4208(null,null);
               this._11381._4231(null,null);
               this._11381._4209 = null;
            }
            this._11381 = this.boundingBoxModel;
            if(this._11394)
            {
               this._11394.model = this._11381;
            }
            if(this._11410 != null)
            {
               this._11383 = this._11410._11278;
               this._4213 = this._11410._1760;
               if(this._11381._1837 != this._4213)
               {
                  this._11381._11426(this._4213);
               }
               if(this._11425 && this._4308 && Boolean(this._11381))
               {
                  this._4308.boundingBoxModel = this.boundingBoxModel;
                  this._4308.zoom = this._zoom;
                  this._4308._11398 = this._5180;
               }
               else
               {
                  this._5181();
               }
            }
            else
            {
               this._5183();
               this._11383 = null;
            }
         }
      }
      
      private function get boundingBoxModel() : _11249
      {
         if(this._11410 == null)
         {
            return null;
         }
         var _loc1_:_11249 = _705._11419[this._11410];
         if(_loc1_ == null)
         {
            _loc1_ = new _11249(this._11410);
            _705._11419[this._11410] = _loc1_;
         }
         return _loc1_;
      }
      
      public function set _11421(param1:_11245) : void
      {
         if(this._4308)
         {
            this._4308.stop();
         }
         this._4308 = param1;
         if(this._4308)
         {
            if(this.boundingBoxModel)
            {
               this._4308.boundingBoxModel = this.boundingBoxModel;
               this._4308.zoom = this._zoom;
               this._4308._11398 = this._5180;
               this._4308.start();
            }
         }
      }
      
      public function get _4358() : _661
      {
         return this._5174;
      }
      
      public function get _11339() : int
      {
         return this._11420;
      }
      
      public function set _11339(param1:int) : void
      {
         if(this._11420 != param1)
         {
            this._11420 = param1;
            _1567(new BoundingBoxNotification(BoundingBoxNotification.CHANGE_MODE,this._11420));
         }
      }
      
      public function get _11428() : Boolean
      {
         return this._11425;
      }
      
      private function _11408() : _70
      {
         if(_2226._2484 is _70 && (_2226._2484 as _70).type == _74.BOUNDINGBOX)
         {
            return _2226._2484 as _70;
         }
         if(_2226._2484 is _79 && (_2226._2484 as _79)._2049 && (_2226._2484 as _79)._2049.type == _74.BOUNDINGBOX)
         {
            return (_2226._2484 as _79)._2049;
         }
         return null;
      }
      
      public function _11350() : void
      {
         var _loc2_:_79 = null;
         var _loc1_:_70 = this._11408();
         if(_loc1_)
         {
            _loc2_ = _loc1_._1760;
            if(_loc2_)
            {
               if(_loc1_ != this._11410 || _loc2_ != this._4213)
               {
                  this._4213 = _loc2_;
                  this._11299 = _loc1_;
                  this._5157._3024();
               }
               _1567(new BoundingBoxNotification(BoundingBoxNotification.EDIT));
            }
         }
      }
      
      private function _5181() : void
      {
         if(this._5097 == null || this._5097.stage == null)
         {
            return;
         }
         if(!this._11425)
         {
            this._11425 = true;
            this._11421 = this._11416;
            this._5097.addEventListener(MouseEvent.ROLL_OUT,this._10481);
            this._5097.addEventListener(MouseEvent.ROLL_OVER,this._10480);
            this._5097.addEventListener(Event.REMOVED_FROM_STAGE,this._11484);
            if(this._5097.stage)
            {
               this._5097.stage.addEventListener(MouseEvent.MOUSE_DOWN,this._11430,true,1000);
               this._5097.stage.addEventListener(MouseEvent.MOUSE_UP,this._11427,true,1000);
               this._5097.stage.addEventListener(MouseEvent.CLICK,this._11427,true,1000);
            }
            else if(stage)
            {
               stage.addEventListener(MouseEvent.MOUSE_DOWN,this._11430,true,1000);
               stage.addEventListener(MouseEvent.MOUSE_UP,this._11427,true,1000);
               stage.addEventListener(MouseEvent.CLICK,this._11427,true,1000);
            }
            _1565(StageNotification.WINDOW_DEACTIVATE,this._11485);
         }
      }
      
      private function _11485(param1:_9) : void
      {
         if(this._11420 != BOUNDINGBOX_MODE_NORMAL)
         {
            _1567(new BoundingBoxNotification(BoundingBoxNotification.STOP_EDIT));
            this._11414 = true;
         }
      }
      
      private function _11484(param1:Event) : void
      {
         this._5097.removeEventListener(Event.REMOVED_FROM_STAGE,this._11484);
         _1567(new BoundingBoxNotification(BoundingBoxNotification.STOP_EDIT));
      }
      
      private function _5183() : void
      {
         if(this._11425)
         {
            this._11425 = false;
            this._11421 = null;
            this._5097.removeEventListener(MouseEvent.ROLL_OUT,this._10481);
            this._5097.removeEventListener(MouseEvent.ROLL_OVER,this._10480);
            this._5097.removeEventListener(Event.REMOVED_FROM_STAGE,this._11484);
            if(this._5097.stage)
            {
               this._5097.stage.removeEventListener(MouseEvent.MOUSE_DOWN,this._11430,true);
               this._5097.stage.removeEventListener(MouseEvent.MOUSE_UP,this._11427,true);
               this._5097.stage.removeEventListener(MouseEvent.CLICK,this._11427,true);
            }
            else if(stage)
            {
               stage.removeEventListener(MouseEvent.MOUSE_DOWN,this._11430,true);
               stage.removeEventListener(MouseEvent.MOUSE_UP,this._11427,true);
               stage.removeEventListener(MouseEvent.CLICK,this._11427,true);
            }
            _1564(StageNotification.WINDOW_DEACTIVATE,this._11485);
         }
      }
      
      private function _10480(param1:MouseEvent) : void
      {
         this._2212._11422();
         this._11418 = false;
      }
      
      private function _10481(param1:MouseEvent) : void
      {
         if(!this._2212._11422())
         {
            this._11418 = true;
         }
      }
      
      public function refresh(param1:_79) : void
      {
         if(_2220._2873 != _715.ARMATURE)
         {
            if(this._5641)
            {
               _1567(new BoundingBoxNotification(BoundingBoxNotification.STOP_EDIT));
            }
            this._4213 = null;
         }
         else
         {
            this._4213 = param1;
            if(param1 && _2226._2484 == param1 || _2226._2484 is _70 && (_2226._2484 as _70)._1760 == param1)
            {
               if(Boolean(param1._2049) && param1._2049.type == _74.BOUNDINGBOX)
               {
                  this._11299 = param1._2049;
                  this._5157._3024();
                  return;
               }
            }
         }
         this._11299 = null;
         this._5157._3024();
      }
      
      public function _3173() : void
      {
         if(this._11381 == null)
         {
            return;
         }
         this._11381.invalid = false;
         this._11381._2466();
      }
      
      public function _5170(param1:Number) : void
      {
         this._zoom = param1;
         if(this._4308)
         {
            this._4308.zoom = this._zoom;
         }
         this._3139();
      }
      
      public function _3139() : void
      {
         var _loc1_:Matrix = null;
         if(this._11425 && Boolean(this._4344._1897))
         {
            this._2205 = this._11394._2162.clone();
            _loc1_ = this._11394.transform.matrix.clone();
            _loc1_.a = this._zoom;
            _loc1_.d = this._zoom;
            this._2205.concat(_loc1_);
            this._4344._2026 = this._2205;
            this._4344._1751();
         }
      }
      
      private function _5163() : void
      {
         this._5180 = this._4213._2009.clone();
         this._5180.tx = 0;
         this._5180.ty = 0;
         this._5180.invert();
         this._5161 = true;
      }
      
      public function _11306() : void
      {
         if(this._11420 == BOUNDINGBOX_MODE_NEW)
         {
            this._11339 = BOUNDINGBOX_MODE_CREATE;
         }
         this._5157._3024();
      }
      
      private function get _2212() : _603
      {
         return (_1407.getInstance(_580) as _580)._2212;
      }
      
      private function get _2853() : _570
      {
         return _1407.getInstance(_570) as _570;
      }
      
      public function get editing() : Boolean
      {
         return this._5188;
      }
   }
}

