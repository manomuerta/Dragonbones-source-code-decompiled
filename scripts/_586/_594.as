package _586
{
   import _13._12;
   import _13._14;
   import _1404._1407;
   import _24.Shortcut;
   import _51._52;
   import _51._70;
   import _51._79;
   import _521._534;
   import _561._568;
   import _573.TimelinePanelController;
   import _652._654;
   import _658.Mesh;
   import _658._657;
   import _658._661;
   import _703._705;
   import _708._715;
   import _708._716;
   import _708._717;
   import _73._74;
   import _783.CommandNotification;
   import _783.MeshNotification;
   import _783.PanelNotification;
   import _783.StageNotification;
   import _783.TimelineNotification;
   import _783.TipNotification;
   import _81._91;
   import _877._885;
   import _877._887;
   import _93._94;
   import _953._956;
   import egret.utils.tr;
   import flash.events.MouseEvent;
   import flash.geom.Matrix;
   import flash.geom.Point;
   
   public class _594 extends _94
   {
      private const NEAREST_RANGE:Number = 10;
      
      private const WEIGHT_TOOL_INTENSITY:int = 2;
      
      private const HARD_WEIGHT_KEYCODE:uint = 18;
      
      private var _4344:_887;
      
      private var _4211:_885;
      
      private var _5185:_657;
      
      private var _4296:_70;
      
      private var _4213:_79;
      
      private var _2123:Mesh;
      
      private var _5174:_661;
      
      private var _4342:Boolean;
      
      private var _5158:Boolean;
      
      private var _5188:Boolean;
      
      private var _4235:Point;
      
      private var _5097:_956;
      
      private var _2205:Matrix;
      
      private var _5169:Boolean;
      
      private var _4359:Point;
      
      private var _5184:Point;
      
      private var _5189:Number;
      
      private var _5190:Number;
      
      private var _4367:Boolean;
      
      private var _4366:Boolean;
      
      private var _5180:Matrix;
      
      private var _zoom:Number = 1;
      
      private var _5161:Boolean;
      
      private var _5157:_534;
      
      private var _5153:_595;
      
      private var _5151:_587;
      
      private var _5182:Boolean;
      
      private var _5015:Boolean;
      
      private var _5156:_52;
      
      private var _5173:Array;
      
      private var _5162:Number = 0;
      
      private var _4338:Vector.<_91>;
      
      private var _4360:Vector.<_91>;
      
      private var _4345:Point;
      
      private var _4357:Point;
      
      private var _4356:Boolean;
      
      private var _10362:Boolean = true;
      
      public function _594()
      {
         super();
         this._4235 = new Point();
         this._4359 = new Point();
         this._5184 = new Point();
         this._5157 = _1407.getInstance(_534) as _534;
         this._5153 = _1407.getInstance(_595) as _595;
         this._5151 = _1407.getInstance(_587) as _587;
         this._5153.start();
         this._5173 = [];
      }
      
      override protected function _1576() : void
      {
         super._1576();
         _1565(StageNotification.UPDATE_SELECTED_ITEMS,this._4023);
         _1565(StageNotification.UPDATE_EDIT_MODE,this._3864);
         _1565(PanelNotification.SELECT_VERTEX,this._5172);
         _1565(TimelineNotification.FRAME_CHANGE,this._4654);
         _1565(TimelineNotification.UPDATE,this._5176);
         _1565(StageNotification.START_EDIT_RIG,this._5019,100);
         _1565(StageNotification.STOP_EDIT_RIG,this._5022,100);
         _1565(StageNotification.OPEN_MODIFY_WEIGHT,this._4385);
         _1565(StageNotification.UPDATE_CURRENT_TOOL,this._5178);
         _1565(StageNotification.START_WEIGHT_TOOL,this._4388);
         _1565(StageNotification.STOP_WEIGHT_TOOL,this._4404);
         _1565(StageNotification.UPDATE_SELECTED_BINDING_BONE,this._4373);
         _1565(StageNotification.STOP_PICK,this._4439);
         _1565(MeshNotification.UPDATE_SELECT_VERTICES,this._5154);
         _1565(StageNotification.START_EDIT_MESH_UV,this._11626);
         _1565(StageNotification.STOP_EDIT_MESH_UV,this._11627);
         if(_2214 && _2214._1844 && _2214._1844._2871 && Boolean(_2214._1844._2871._3286))
         {
            this._zoom = _2214._1844._2871._3286.zoom;
         }
      }
      
      private function _11627(param1:StageNotification) : void
      {
         this._4023(null);
      }
      
      private function _11626(param1:StageNotification) : void
      {
         this._1838 = null;
         this._4213 = null;
         this._5157._3024();
      }
      
      private function _4439(param1:StageNotification) : void
      {
         this._5179();
      }
      
      private function _4404(param1:StageNotification) : void
      {
         var _loc2_:_661 = null;
         this._5175();
         if(this._2123 == null)
         {
            this._5183();
         }
         else if(this._5174 != null)
         {
            _loc2_ = this._5174;
            this._5157._2986(null);
            this._5157._2986(null,_loc2_);
            this._4344._1897 = this._5174;
            this._3173();
         }
      }
      
      private function _4388(param1:StageNotification) : void
      {
         this._10362 = true;
         this._5171();
         this._4344._1897 = null;
         this._5179();
         if(this._5174)
         {
            _1567(new StageNotification(StageNotification.START_EDIT_WEIGHT));
         }
         _14._1602(_12.CURSOR_MOVE);
      }
      
      private function _5179() : void
      {
         if(this._2123 && this._2123.meshRig && this._2123.meshRig._2922.length > 0)
         {
            this._5151._5000 = this._2123.meshRig._2922;
         }
         else
         {
            this._5151._5000 = null;
         }
      }
      
      private function _4373(param1:StageNotification) : void
      {
         var _loc2_:_52 = param1.data as _52;
         if(this._5156 != _loc2_)
         {
            this._5156 = _loc2_;
            this._4222();
         }
      }
      
      private function _5178(param1:StageNotification) : void
      {
         var _loc2_:_716 = param1.data as _716;
         switch(_loc2_)
         {
            case _716.WEIGHT:
               if(!this._5015)
               {
                  this._5015 = true;
                  _1567(new StageNotification(StageNotification.START_WEIGHT_TOOL));
               }
               break;
            default:
               if(this._5015)
               {
                  this._5015 = false;
                  _1567(new StageNotification(StageNotification.STOP_WEIGHT_TOOL));
               }
         }
      }
      
      public function _3207() : void
      {
         if(Boolean(this._2123) && Boolean(this._4211))
         {
            this._4211._2466();
         }
      }
      
      private function _4385(param1:StageNotification) : void
      {
         this._10362 = param1.data;
         if(param1.data)
         {
            this._5153.start();
            this._5168();
         }
         else
         {
            this._5153.stop();
            if(this._5015)
            {
               this._5015 = false;
               _1567(new StageNotification(StageNotification.STOP_WEIGHT_TOOL));
            }
            this._3195();
         }
      }
      
      private function _5019(param1:StageNotification) : void
      {
         this._5182 = true;
         this._5183();
         this._5157._3024();
         this._5153._3833();
         this._5151._5000 = null;
         _1567(new TipNotification(TipNotification.SHOW_TIP_TEXT,{
            "showText":tr("Tip.Rig.addBone"),
            "x":stage.mouseX,
            "y":stage.mouseY
         }));
      }
      
      private function _5022(param1:StageNotification) : void
      {
         this._5182 = false;
         if(this._2123 != null)
         {
            this._5181();
            if(this._5015)
            {
               this._5179();
            }
         }
      }
      
      private function _5172(param1:PanelNotification) : void
      {
         this._5157._3024();
      }
      
      private function _3864(param1:StageNotification) : void
      {
         var _loc2_:_661 = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc3_:Vector.<_91> = new Vector.<_91>();
         if(_2220._2873 == _715.ARMATURE)
         {
            if(this._5174)
            {
               _loc4_ = 0;
               _loc5_ = int(this._5157._3823.length);
               while(_loc4_ < _loc5_)
               {
                  _loc3_.push(this._2123._3183(this._5157._3823[_loc4_]));
                  _loc4_++;
               }
               this._5157._2986(_loc3_);
            }
         }
         else if(_2220._2873 == _715.ANIMATE)
         {
            if(this._5174)
            {
               _loc4_ = 0;
               _loc5_ = int(this._5157._3823.length);
               while(_loc4_ < _loc5_)
               {
                  _loc3_.push(this._2123._3183(this._5157._3823[_loc4_]));
                  _loc4_++;
               }
               this._5157._2986(_loc3_);
            }
         }
         else
         {
            this._3024();
         }
         this._2902();
      }
      
      private function _4654(param1:TimelineNotification) : void
      {
         this._5161 = false;
      }
      
      private function _5176(param1:TimelineNotification) : void
      {
         this._2902();
      }
      
      public function _4906(param1:_885, param2:_956, param3:_887) : void
      {
         if(this._5097)
         {
            this._1838 = null;
            this._5183();
         }
         this._4269 = param1;
         this._5097 = param2;
         this._4313 = param3;
         this._5153._5098 = param2;
      }
      
      public function set _4269(param1:_885) : void
      {
         this._4211 = param1;
         if(this._4344)
         {
            this._4344._2026 = this._4211.transform.matrix;
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
      
      public function _3024() : void
      {
         if(this._5157._2889.length > 0)
         {
            this._5157._3024();
            this._3195();
         }
         this._4344._1897 = null;
         _1567(new StageNotification(StageNotification.UPDATE_SELECTED_VERTEX,this._5174));
      }
      
      public function set _1838(param1:_70) : void
      {
         if(this._4296 != param1)
         {
            this._4296 = param1;
            if(this._4296 == null && Boolean(this._5185))
            {
               this._5157._3024();
               this._5185._3823 = null;
               this._5185._4208(null,null);
               this._5185._4231(null,null);
               this._5185._4209 = null;
            }
            this._5185 = this._5187;
            if(this._4211)
            {
               this._4211.model = this._5185;
            }
            this._3195();
            if(this._4296 != null)
            {
               this._2123 = this._4296.mesh;
               this._4213 = this._4296._1760;
               if(!this._5015)
               {
                  this._5181();
               }
               if(this._10362)
               {
                  this._5168();
               }
            }
            else
            {
               if(!this._5015)
               {
                  this._5183();
               }
               this._2123 = null;
            }
            this._5156 = null;
            if(this._5015)
            {
               this._5151._4994();
               if(this._2123 == null)
               {
                  this._5183();
               }
               else
               {
                  this._5181();
               }
               this._5171();
               this._5179();
               this._4222();
            }
         }
      }
      
      public function _2902() : void
      {
         var _loc1_:_79 = this._4213;
         if(this._4213)
         {
            if(this._4213._2049 == null || this._4213._2049.type != _74.MESH)
            {
               this._1838 = null;
               this._5157._3024();
               this._4213 = _loc1_;
            }
            else if(this._4213._2049.type == _74.MESH)
            {
               this._1838 = this._4213._2049;
            }
         }
      }
      
      public function refresh(param1:_79) : void
      {
         this._4023(null);
      }
      
      public function _3173() : void
      {
         if(this._5185 == null)
         {
            return;
         }
         this._5185.invalid = false;
         this._5185._2466();
         if(this._4344 && this._2123 && this._4344._1897 is _661)
         {
            this._4344._1897 = this._2123._3183(this._4344._1897 as _661);
            if(this._4344._1897)
            {
               (this._4344._1897 as _661).update();
            }
            this._3139();
         }
      }
      
      private function get _5187() : _657
      {
         if(this._4296 == null)
         {
            return null;
         }
         var _loc1_:_657 = _705._5192[this._4296];
         if(_loc1_ == null)
         {
            _loc1_ = new _657(this._4296);
            _705._5192[this._4296] = _loc1_;
         }
         return _loc1_;
      }
      
      public function _5167(param1:_661) : void
      {
         if(this._5174 == null && param1 != null)
         {
            if(this._4296)
            {
               _2226._2484 = this._4296;
               this._5163();
            }
         }
         else if(this._5174 != null && param1 == null)
         {
            if(this._4296)
            {
               _2226._2484 = this._4296._1760;
            }
         }
         this._5174 = param1;
         if(!this._5185)
         {
         }
         if(this._5015)
         {
            this._4222();
            if(this._5174)
            {
               _1567(new StageNotification(StageNotification.START_EDIT_WEIGHT));
               if(Shortcut._1685(this.HARD_WEIGHT_KEYCODE) && Boolean(this._5156))
               {
                  this._5153._5160(this._5156,this._5174,1);
               }
            }
            else
            {
               _1567(new StageNotification(StageNotification.STOP_EDIT_WEIGHT));
            }
         }
         else
         {
            this._4344._1897 = this._5174;
            if(this._5174)
            {
               _1567(new StageNotification(StageNotification.START_EDIT_FFD));
               _14.setCursor(_12.CURSOR_MOVE,100);
               this._5174.update();
            }
            else
            {
               _1567(new StageNotification(StageNotification.STOP_EDIT_FFD));
               _14._1602(_12.CURSOR_MOVE);
            }
            this._3139();
         }
         _1567(new StageNotification(StageNotification.UPDATE_SELECTED_VERTEX,this._5174));
      }
      
      public function _5170(param1:Number) : void
      {
         this._zoom = param1;
         this._3139();
      }
      
      public function _3139() : void
      {
         var _loc1_:Matrix = null;
         if(this._5188 && Boolean(this._4344._1897))
         {
            this._2205 = this._4211._2162.clone();
            _loc1_ = this._4211.transform.matrix.clone();
            _loc1_.a = this._zoom;
            _loc1_.d = this._zoom;
            this._2205.concat(_loc1_);
            this._4344._2026 = this._2205;
            this._4344._1751();
         }
      }
      
      public function set _4313(param1:_887) : void
      {
         this._4344 = param1;
         if(this._4211)
         {
            this._4344._2026 = this._4211._2162;
         }
      }
      
      private function _5154(param1:MeshNotification) : void
      {
         if(this._5185)
         {
            this._5185._3823 = this._5157._3823;
            if(Boolean(this._5185._3823) && this._5185._3823.length > 0)
            {
               this._5167(this._5185._3823[0]);
            }
            else
            {
               this._5167(null);
            }
         }
      }
      
      private function _4023(param1:StageNotification) : void
      {
         var _loc2_:_79 = null;
         var _loc3_:_70 = null;
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
            if(_2226._2484 is _79 && (_2226._2484 as _79)._2049 && (_2226._2484 as _79)._2049.type == _74.MESH)
            {
               _loc3_ = (_2226._2484 as _79)._2049;
            }
            else if(_2226._2484 is _70 && (_2226._2484 as _70).type == _74.MESH && (_2226._2484 as _70)._1760._2049 == _2226._2484)
            {
               _loc3_ = _2226._2484 as _70;
            }
            else
            {
               _loc3_ = null;
            }
            if(_loc3_ != this._4296 || _loc2_ != this._4213)
            {
               this._4213 = _loc2_;
               this._1838 = _loc3_;
               this._5157._3024();
            }
         }
         else
         {
            this._1838 = null;
            this._4213 = null;
            this._5157._3024();
         }
         if(this._5015)
         {
            if(this._4296 == null && _2226._2889.length != 0)
            {
               this._5015 = false;
               _1567(new StageNotification(StageNotification.STOP_WEIGHT_TOOL));
            }
         }
         this._5153._1838 = this._4296;
      }
      
      private function _5181() : void
      {
         if(!this._5188)
         {
            if(this._4211 && this._4211.stage && this._5097 && Boolean(this._4344))
            {
               this._5188 = true;
               this._5162 = 0;
               this._4211.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
               this._4211.stage.addEventListener(MouseEvent.MOUSE_UP,this._4083);
               this._5097.addEventListener(MouseEvent.MOUSE_DOWN,this._4063,false,100);
               this._5097.addEventListener(MouseEvent.ROLL_OUT,this._10481);
               this._5097.addEventListener(MouseEvent.ROLL_OVER,this._10480);
               this._4344.addEventListener(MouseEvent.MOUSE_DOWN,this._4063);
            }
         }
      }
      
      private function _10480(param1:MouseEvent) : void
      {
         if(this._5015)
         {
            if(this._5156 != null && this._5174 != null)
            {
               _14.setCursor(_12.CURSOR_MESH_WEIGHT_EDIT,3);
            }
         }
      }
      
      private function _10481(param1:MouseEvent) : void
      {
         if(this._5015)
         {
            if(this._5156 != null && this._5174 != null)
            {
               return;
            }
         }
         _14._1602(_12.CURSOR_MESH_WEIGHT_EDIT);
      }
      
      private function _5183() : void
      {
         if(this._5188)
         {
            this._5188 = false;
            this._4344._1897 = null;
            if(Boolean(this._4211) && Boolean(this._4211.stage))
            {
               this._4211.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
               this._4211.stage.removeEventListener(MouseEvent.MOUSE_UP,this._4083);
            }
            this._5097.removeEventListener(MouseEvent.MOUSE_DOWN,this._4063);
            this._5097.removeEventListener(MouseEvent.ROLL_OUT,this._10481);
            this._5097.removeEventListener(MouseEvent.ROLL_OVER,this._10480);
            this._4344.removeEventListener(MouseEvent.MOUSE_DOWN,this._4063);
         }
      }
      
      private function _4083(param1:MouseEvent) : void
      {
         if(this._5015)
         {
            this._5153._5166();
         }
         this._4344._4341._4337();
         if(this._4342)
         {
            this._4342 = false;
         }
         if(this._5158)
         {
            this._5158 = false;
            this._4211._4340();
         }
         else if(!this._5169)
         {
            this._5157._3024();
         }
         else if(this._4356 && this._5157._2889.length > 0 && this._5185._4209 != null)
         {
            this._5157._2986(null,this._5185._4209);
         }
         this._4356 = false;
         _2217._1651();
         param1.stopPropagation();
      }
      
      private function _4063(param1:MouseEvent) : void
      {
         var _loc2_:Boolean = false;
         if(Boolean(this._2123) && this._2123.AABB == null)
         {
            this._4216._3187();
            return;
         }
         this._4216._3187();
         if(this._5174 != null)
         {
            if(!this._5161)
            {
               this._5163();
            }
            _loc2_ = this._4344._4341._4368 && !this._4344._4341._4369 || !this._4344._4341._4368 && this._4344._4341._4369;
            if(!_loc2_ && (this._5185._4209 != null && (this._5157._2889.length != 1 || this._5174 != this._5185._4209) || this._5185._5713[0] != null))
            {
               this._5186();
               this._4342 = true;
               this._5169 = true;
            }
            else
            {
               this._4342 = true;
               this._5169 = false;
            }
         }
         else
         {
            if(this._5185 == null)
            {
               this._5183();
               return;
            }
            this._5186();
            this._5169 = true;
         }
         if(this._5174 != null || Shortcut._1677())
         {
            this._4342 = true;
         }
         if(this._5015)
         {
            this._4342 = true;
            if(this._2123.meshRig == null || this._2123.meshRig._2922.length == 0)
            {
               _1567(new CommandNotification(CommandNotification.SHOW_TOOL_TIP,{
                  "showText":tr("Tip.weight.noRig"),
                  "type":_717.ANIMATE
               }));
            }
            else if(this._5174 == null)
            {
               _1567(new CommandNotification(CommandNotification.SHOW_TOOL_TIP,{
                  "showText":tr("Tip.weight.noVertex"),
                  "type":_717.ANIMATE
               }));
            }
            else if(this._5156 == null)
            {
               _1567(new CommandNotification(CommandNotification.SHOW_TOOL_TIP,{
                  "showText":tr("Tip.weight.noBone"),
                  "type":_717.ANIMATE
               }));
            }
         }
         this._4359.x = param1.stageX;
         this._4359.y = param1.stageY;
         this._4359 = this._4211.canvas.globalToLocal(this._4359);
         if(!this._4342 || this._5015)
         {
            return;
         }
         if(this._4344._4341._4368 && this._4344._4341._4369)
         {
            this._4367 = true;
            this._4366 = true;
         }
         else if(this._4344._4341._4368)
         {
            this._4367 = true;
            this._4366 = false;
            this._4344._4341._4365(this._4367,this._4366);
         }
         else if(this._4344._4341._4369)
         {
            this._4367 = false;
            this._4366 = true;
            this._4344._4341._4365(this._4367,this._4366);
         }
         else
         {
            this._4367 = true;
            this._4366 = true;
         }
         param1.stopImmediatePropagation();
      }
      
      private function _5186() : void
      {
         var _loc1_:_661 = null;
         var _loc2_:_661 = null;
         var _loc3_:Vector.<_91> = null;
         if(Shortcut._1677())
         {
            if(this._5185._4209)
            {
               if(this._5185._5155())
               {
                  this._5157._3876(null,this._5185._4209);
               }
               else
               {
                  this._5157._3877(null,this._5185._4209);
               }
            }
            else if(this._5185._5713 && this._5185._5713[0] && Boolean(this._5185._5713[1]))
            {
               _loc1_ = this._5185._5706(this._5185._5713[0]);
               _loc2_ = this._5185._5706(this._5185._5713[1]);
               if(!this._5157.isSelected(_loc1_))
               {
                  this._5157._3877(null,_loc1_);
               }
               if(!this._5157.isSelected(_loc2_))
               {
                  this._5157._3877(null,_loc2_);
               }
            }
            else
            {
               this._4356 = true;
            }
         }
         else if(Boolean(this._5185._4209) && !this._5157.isSelected(this._5185._4209))
         {
            this._5157._2986(null,this._5185._4209);
         }
         else if(this._5185._5713 && this._5185._5713[0] && Boolean(this._5185._5713[1]))
         {
            _loc3_ = new Vector.<_91>();
            _loc1_ = this._5185._5706(this._5185._5713[0]);
            _loc2_ = this._5185._5706(this._5185._5713[1]);
            _loc3_.push(_loc1_);
            _loc3_.push(_loc2_);
            if(Boolean(_loc1_) && Boolean(_loc2_))
            {
               this._5157._2986(_loc3_);
            }
            else
            {
               this._4356 = true;
            }
         }
         else
         {
            this._4356 = true;
         }
      }
      
      private function onMouseMove(param1:MouseEvent) : void
      {
         var _loc2_:_661 = null;
         var _loc3_:Vector.<_661> = null;
         var _loc4_:Point = null;
         var _loc5_:int = 0;
         var _loc6_:String = null;
         var _loc7_:Vector.<_661> = null;
         var _loc8_:int = 0;
         var _loc9_:Array = null;
         var _loc10_:Array = null;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         if(!this._5188)
         {
            return;
         }
         if(!this._4342)
         {
            this._4235.x = param1.stageX;
            this._4235.y = param1.stageY;
            this._4235 = this._4211.canvas.globalToLocal(this._4235);
            this._2205 = this._4211._2162.clone();
            this._2205.invert();
            this._4235 = this._2205.transformPoint(this._4235);
            _loc2_ = this._4206(this._4235.x,this._4235.y,this.NEAREST_RANGE / this._zoom);
            if(_loc2_)
            {
               this._5185._4209 = _loc2_;
               this._5185._4231(null,null);
               _1567(new StageNotification(StageNotification.OVER_FFD,true));
            }
            else
            {
               if(!this._5015)
               {
                  _loc3_ = this._11153(this._4235.x,this._4235.y,this.NEAREST_RANGE / this._zoom);
               }
               if(Boolean(_loc3_) && _loc3_.length == 2)
               {
                  this._5185._4231(_loc3_[0],_loc3_[1]);
                  this._5185._4209 = null;
                  _1567(new StageNotification(StageNotification.OVER_FFD,true));
               }
               else
               {
                  this._5185._4231(null,null);
                  this._5185._4209 = null;
                  _1567(new StageNotification(StageNotification.OVER_FFD,false));
               }
            }
         }
         else if(!this._5158 && (Shortcut._1677() || this._5015 && (this._5157._2889.length <= 0 || this._5156 == null)))
         {
            this._5158 = true;
            this._4338 = this._5157._2889.concat();
            _loc4_ = new Point(param1.stageX,param1.stageY);
            this._4345 = this._4211.globalToLocal(_loc4_);
            this._4211._4349(param1.stageX,param1.stageY);
         }
         else if(this._5158)
         {
            _loc4_ = new Point(param1.stageX,param1.stageY);
            this._4357 = this._4211.globalToLocal(_loc4_);
            this._4211._4347(param1.stageX,param1.stageY);
            this._4360 = this._5164(this._4345,this._4357);
            this._5157._2986(this._4338);
            this._5157._3874(this._4360);
            if(this._5157._2889.length > 0)
            {
               this._5169 = true;
            }
         }
         else if(this._5174)
         {
            this._5169 = true;
            this._4356 = false;
            this._5184.x = param1.stageX;
            this._5184.y = param1.stageY;
            this._5184 = this._4211.canvas.globalToLocal(this._5184);
            if(this._4367)
            {
               this._5189 = this._5184.x - this._4359.x;
            }
            else
            {
               this._5189 = 0;
            }
            if(this._4366)
            {
               this._5190 = this._5184.y - this._4359.y;
            }
            else
            {
               this._5190 = 0;
            }
            this._4235.x = this._5189;
            this._4235.y = this._5190;
            this._4235 = this._5180.transformPoint(this._4235);
            this._5189 = this._4235.x;
            this._5190 = this._4235.y;
            if(this._5015)
            {
               if(this._4213 && this._2123 && this._5156 && Boolean(this._5174))
               {
                  this._5162 += this._4359.y - this._5184.y;
                  if(Math.abs(this._5162) > this.WEIGHT_TOOL_INTENSITY)
                  {
                     _loc5_ = Math.ceil(this._5162 / this.WEIGHT_TOOL_INTENSITY);
                     this._5162 -= _loc5_ * this.WEIGHT_TOOL_INTENSITY;
                  }
                  if(_loc5_ != 0)
                  {
                     this._5153._5165(this._4213,this._2123,this._5156,this._5157._3823,_loc5_);
                  }
               }
            }
            else
            {
               _loc7_ = this._5157._3823.concat();
               if(_2214._2220._2873 == _715.ANIMATE)
               {
                  if(this._2852.autoKey)
                  {
                     _loc11_ = 0;
                     _loc12_ = int(_loc7_.length);
                     while(_loc11_ < _loc12_)
                     {
                        _loc7_[_loc11_].x += this._5189;
                        _loc7_[_loc11_].y += this._5190;
                        _loc11_++;
                     }
                     this._2123._3145();
                     _loc8_ = int(this._2123._2118.indexOf(this._5174));
                     this._2852._4624({
                        "index":_loc8_,
                        "deltaX":this._5189,
                        "deltaY":this._5190
                     });
                  }
                  else
                  {
                     if(this._4213._2112())
                     {
                        _loc6_ = CommandNotification.MODIFY_SKINED_MESH_CACHE_FFD;
                     }
                     else
                     {
                        _loc6_ = CommandNotification.MODIFY_ANIMATION_CACHE_FFD;
                     }
                     _loc9_ = [];
                     _loc10_ = [];
                     _loc11_ = 0;
                     _loc12_ = int(_loc7_.length);
                     while(_loc11_ < _loc12_)
                     {
                        _loc9_.push(_loc7_[_loc11_].x);
                        _loc10_.push(_loc7_[_loc11_].y);
                        _loc11_++;
                     }
                     _1567(new CommandNotification(_loc6_,{
                        "_1837":this._4213,
                        "_1838":this._4296,
                        "vertex":this._5174,
                        "vertices":_loc7_,
                        "deltaX":this._5189,
                        "deltaY":this._5190,
                        "_3147":_loc9_,
                        "_3146":_loc10_
                     }));
                  }
               }
               else
               {
                  if(this._4213._2112())
                  {
                     _loc6_ = CommandNotification.MODIFY_SKINED_MESH_FFD;
                  }
                  else
                  {
                     _loc6_ = CommandNotification.MODIFY_FFD;
                  }
                  _1567(new CommandNotification(_loc6_,{
                     "_1837":this._4213,
                     "_1838":this._4296,
                     "vertex":this._5174,
                     "vertices":_loc7_,
                     "deltaX":this._5189,
                     "deltaY":this._5190
                  }));
               }
            }
            this._4359.x = this._5184.x;
            this._4359.y = this._5184.y;
         }
         param1.stopPropagation();
      }
      
      public function _10534() : Boolean
      {
         return Boolean(this._2123) && Boolean(this._4213) && this._5157._3823.length > 0;
      }
      
      public function _10533(param1:Number, param2:Number) : void
      {
         var _loc3_:String = null;
         var _loc5_:int = 0;
         var _loc6_:Array = null;
         var _loc7_:Array = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc4_:Vector.<_661> = this._5157._3823.concat();
         if(_loc4_ == null || _loc4_.length == 0 || param1 == 0 && param2 == 0)
         {
            return;
         }
         if(_2214._2220._2873 == _715.ANIMATE)
         {
            if(this._2852.autoKey)
            {
               _loc8_ = 0;
               _loc9_ = int(_loc4_.length);
               while(_loc8_ < _loc9_)
               {
                  _loc4_[_loc8_].x += param1;
                  _loc4_[_loc8_].y += param2;
                  _loc8_++;
               }
               this._2123._3145();
               _loc5_ = int(this._2123._2118.indexOf(this._5174));
               this._2852._4624({
                  "index":_loc5_,
                  "deltaX":param1,
                  "deltaY":param2
               });
            }
            else
            {
               if(this._4213._2112())
               {
                  _loc3_ = CommandNotification.MODIFY_SKINED_MESH_CACHE_FFD;
               }
               else
               {
                  _loc3_ = CommandNotification.MODIFY_ANIMATION_CACHE_FFD;
               }
               _loc6_ = [];
               _loc7_ = [];
               _loc8_ = 0;
               _loc9_ = int(_loc4_.length);
               while(_loc8_ < _loc9_)
               {
                  _loc6_.push(_loc4_[_loc8_].x);
                  _loc7_.push(_loc4_[_loc8_].y);
                  _loc8_++;
               }
               _1567(new CommandNotification(_loc3_,{
                  "_1837":this._4213,
                  "_1838":this._4296,
                  "vertex":this._5174,
                  "vertices":_loc4_,
                  "deltaX":param1,
                  "deltaY":param2,
                  "_3147":_loc6_,
                  "_3146":_loc7_
               }));
            }
         }
         else
         {
            if(this._4213._2112())
            {
               _loc3_ = CommandNotification.MODIFY_SKINED_MESH_FFD;
            }
            else
            {
               _loc3_ = CommandNotification.MODIFY_FFD;
            }
            _1567(new CommandNotification(_loc3_,{
               "_1837":this._4213,
               "_1838":this._4296,
               "vertex":this._5174,
               "vertices":_loc4_,
               "deltaX":param1,
               "deltaY":param2
            }));
         }
      }
      
      protected function _5159(param1:Number, param2:Number, param3:Number = 10) : _661
      {
         var _loc4_:_661 = null;
         var _loc5_:int = 0;
         var _loc6_:int = int(this._2123._2118.length);
         while(_loc5_ < _loc6_)
         {
            _loc4_ = this._2123._2118[_loc5_];
            if(Math.abs(param1 - _loc4_.x) < param3 && Math.abs(param2 - _loc4_.y) < param3)
            {
               return _loc4_;
            }
            _loc5_++;
         }
         return null;
      }
      
      protected function _4206(param1:Number, param2:Number, param3:Number = 10) : _661
      {
         var _loc4_:_661 = null;
         var _loc5_:_661 = null;
         var _loc6_:Number = NaN;
         param3 *= param3;
         var _loc7_:int = 0;
         var _loc8_:int = int(this._2123._2118.length);
         while(_loc7_ < _loc8_)
         {
            _loc4_ = this._2123._2118[_loc7_];
            if(Math.abs(param1 - _loc4_.x) < param3 && Math.abs(param2 - _loc4_.y) < param3)
            {
               _loc6_ = (param1 - _loc4_.x) * (param1 - _loc4_.x) + (param2 - _loc4_.y) * (param2 - _loc4_.y);
               if(_loc6_ < param3)
               {
                  _loc5_ = _loc4_;
                  param3 = _loc6_;
               }
            }
            _loc7_++;
         }
         return _loc5_;
      }
      
      protected function _11153(param1:Number, param2:Number, param3:Number = 10) : Vector.<_661>
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc8_:_661 = null;
         var _loc9_:_661 = null;
         var _loc7_:Vector.<_661> = new Vector.<_661>();
         param3 *= param3;
         if(this._2123.outline)
         {
            _loc4_ = 0;
            _loc5_ = int(this._2123.outline.length);
            while(_loc4_ < _loc5_)
            {
               _loc8_ = this._2123._3183(this._2123.outline[_loc4_]);
               _loc9_ = this._2123._3183(this._2123.outline[_loc4_ + 1]);
               if(Boolean(_loc8_) && Boolean(_loc9_))
               {
                  _loc6_ = _654._4292(param1,param2,_loc8_.x,_loc8_.y,_loc9_.x,_loc9_.y,param3);
                  if(_loc6_ == 3)
                  {
                     _loc7_.push(this._2123.outline[_loc4_],this._2123.outline[_loc4_ + 1]);
                     return _loc7_;
                  }
               }
               _loc4_ += 2;
            }
         }
         if(this._2123.userEdges)
         {
            _loc4_ = 0;
            _loc5_ = int(this._2123.userEdges.length);
            while(_loc4_ < _loc5_)
            {
               _loc8_ = this._2123._3183(this._2123.userEdges[_loc4_]);
               _loc9_ = this._2123._3183(this._2123.userEdges[_loc4_ + 1]);
               if(Boolean(_loc8_) && Boolean(_loc9_))
               {
                  _loc6_ = _654._4292(param1,param2,_loc8_.x,_loc8_.y,_loc9_.x,_loc9_.y,param3);
                  if(_loc6_ == 3)
                  {
                     _loc7_.push(this._2123.userEdges[_loc4_],this._2123.userEdges[_loc4_ + 1]);
                     return _loc7_;
                  }
               }
               _loc4_ += 2;
            }
         }
         return null;
      }
      
      protected function _5164(param1:Point, param2:Point) : Vector.<_91>
      {
         var _loc8_:_661 = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc3_:Number = param1.x < param2.x ? param1.x : param2.x;
         var _loc4_:Number = param1.y < param2.y ? param1.y : param2.y;
         var _loc5_:Number = Math.abs(param1.x - param2.x);
         var _loc6_:Number = Math.abs(param1.y - param2.y);
         var _loc7_:Vector.<_91> = new Vector.<_91>();
         var _loc11_:Point = new Point();
         if(this._2123._2119())
         {
            _loc9_ = 0;
            _loc10_ = int(this._2123._2118.length);
            while(_loc9_ < _loc10_)
            {
               _loc8_ = this._2123._2118[_loc9_];
               if(_loc8_.x > _loc3_ && _loc8_.x < _loc3_ + _loc5_ && _loc8_.y > _loc4_ && _loc8_.y < _loc4_ + _loc6_)
               {
                  _loc7_.push(_loc8_);
               }
               _loc9_++;
            }
         }
         else
         {
            _loc9_ = 0;
            _loc10_ = int(this._2123._2118.length);
            while(_loc9_ < _loc10_)
            {
               _loc8_ = this._2123._2118[_loc9_];
               _loc11_.x = _loc8_.x;
               _loc11_.y = _loc8_.y;
               _loc11_ = this._4211._2162.transformPoint(_loc11_);
               if(_loc11_.x > _loc3_ && _loc11_.x < _loc3_ + _loc5_ && _loc11_.y > _loc4_ && _loc11_.y < _loc4_ + _loc6_)
               {
                  _loc7_.push(_loc8_);
               }
               _loc9_++;
            }
         }
         return _loc7_;
      }
      
      public function _3199() : void
      {
         this._5168();
      }
      
      private function _5175() : void
      {
         this._4211._5191 = false;
      }
      
      private function _3195() : void
      {
         if(Boolean(this._2123) && this._2123._2119())
         {
            this._2123.meshRig._3195();
            _1567(new StageNotification(StageNotification.UPDATE_BONE_COLOR));
         }
      }
      
      private function _5171() : void
      {
         if(this._2123)
         {
            this._4211._5191 = true;
         }
      }
      
      private function _5168() : void
      {
         if(Boolean(this._2123) && this._2123._2119())
         {
            this._2123.meshRig._5168();
         }
         _1567(new StageNotification(StageNotification.UPDATE_BONE_COLOR));
      }
      
      private function _4222() : void
      {
         if(this._5015)
         {
            if(this._5156 != null && this._5174 != null)
            {
               _14.setCursor(_12.CURSOR_MESH_WEIGHT_EDIT,3);
            }
            else
            {
               _14._1602(_12.CURSOR_MESH_WEIGHT_EDIT);
               _14.setCursor(_12.CURSOR_MESH_WEIGHT,2);
            }
         }
         else
         {
            _14._1602(_12.CURSOR_MESH_WEIGHT_EDIT);
         }
      }
      
      public function _12947() : void
      {
         if(this._4211)
         {
            this._4211._12947();
         }
      }
      
      private function get _4850() : _600
      {
         return _1407.getInstance(_600) as _600;
      }
      
      private function get _5152() : _601
      {
         return _1407.getInstance(_601) as _601;
      }
      
      private function get _2852() : TimelinePanelController
      {
         return _1407.getInstance(TimelinePanelController) as TimelinePanelController;
      }
      
      private function get _4216() : _568
      {
         return _1407.getInstance(_568) as _568;
      }
      
      public function get _4358() : _661
      {
         return this._5174;
      }
      
      public function get _2119() : Boolean
      {
         return this._5182;
      }
      
      public function get _12672() : _534
      {
         return this._5157;
      }
   }
}

