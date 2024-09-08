package _11243
{
   import _11220._11219;
   import _11250._11249;
   import _11254._11253;
   import _13._12;
   import _13._14;
   import _1404._1407;
   import _24.Shortcut;
   import _521._11241;
   import _652._654;
   import _658._661;
   import _783.BoundingBoxNotification;
   import _783.CommandNotification;
   import _783.StageNotification;
   import _81._88;
   import _81._91;
   import _877._887;
   import _93._94;
   import _953._956;
   import flash.events.MouseEvent;
   import flash.geom.Matrix;
   import flash.geom.Point;
   
   public class _11245 extends _94
   {
      private const NEAREST_RANGE:Number = 10;
      
      protected var _4344:_887;
      
      protected var _11394:_11253;
      
      protected var _5097:_956;
      
      protected var _11381:_11249;
      
      protected var _11383:_11219;
      
      protected var _4342:Boolean;
      
      protected var _4235:Point;
      
      protected var _2205:Matrix;
      
      protected var _zoom:Number;
      
      protected var _4356:Boolean;
      
      protected var _5174:_661;
      
      protected var _5157:_11241;
      
      protected var _4359:Point;
      
      protected var _5184:Point;
      
      protected var _4367:Boolean;
      
      protected var _4366:Boolean;
      
      protected var _5189:Number;
      
      protected var _5190:Number;
      
      protected var _5180:Matrix;
      
      protected var _5169:Boolean;
      
      protected var _12637:Boolean;
      
      protected var _4350:Boolean;
      
      protected var _12649:Point;
      
      protected var _12650:Point;
      
      protected var _12651:Vector.<_91>;
      
      protected var _12655:Point;
      
      protected var _3024:Boolean;
      
      protected var _12653:Boolean;
      
      public function _11245()
      {
         super();
         this._4235 = new Point();
         this._4359 = new Point();
         this._5184 = new Point();
         this._12649 = new Point();
         this._12650 = new Point();
         this._12655 = new Point();
         this._5157 = _1407.getInstance(_11241) as _11241;
      }
      
      override public function start() : void
      {
         super.start();
         if(Boolean(this._5157._3823) && this._5157._3823.length > 0)
         {
            this._5167(this._5157._3823[0]);
         }
      }
      
      public function _4906(param1:_11253, param2:_956, param3:_887) : void
      {
         this._11394 = param1;
         this._5097 = param2;
         this._4344 = param3;
      }
      
      override protected function _1576() : void
      {
         super._1576();
         this._11394.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         this._11394.stage.addEventListener(MouseEvent.MOUSE_UP,this._4083);
         this._5097.addEventListener(MouseEvent.MOUSE_DOWN,this._4063,false,100);
         this._5097.addEventListener(MouseEvent.MOUSE_DOWN,this._12654,false,1000);
         this._4344.addEventListener(MouseEvent.MOUSE_DOWN,this._4063);
         _1565(BoundingBoxNotification.UPDATE_SELECT_VERTICES,this._5154);
      }
      
      private function _12654(param1:MouseEvent) : void
      {
         this._3024 = true;
         this._12655.x = param1.stageX;
         this._12655.y = param1.stageY;
         this._12639();
      }
      
      protected function _12639() : void
      {
         this._12637 = Shortcut._1677();
      }
      
      protected function _4004(param1:MouseEvent) : void
      {
         if(this._11381 && this._11381._11397 && this._11381._11397.hitTest(this._4235))
         {
            _1567(new BoundingBoxNotification(BoundingBoxNotification.DOUBLE_CLICK));
            param1.stopImmediatePropagation();
         }
      }
      
      protected function _5154(param1:BoundingBoxNotification) : void
      {
         if(this._11381)
         {
            this._11381._3823 = this._5157._3823;
            if(Boolean(this._11381._3823) && this._11381._3823.length > 0)
            {
               this._5167(this._11381._3823[0]);
            }
            else
            {
               this._5167(null);
            }
         }
         this._3024 = false;
      }
      
      public function _5167(param1:_661) : void
      {
         this._5174 = param1;
         this._4344._1897 = this._5174;
         _1567(new BoundingBoxNotification(BoundingBoxNotification.UPDATE_SELECTED_VERTEX,this._5174));
         if(this._5174)
         {
            this._5174.update();
         }
         this._11382();
      }
      
      protected function _11382() : void
      {
         if(this._5174)
         {
            _1567(new StageNotification(StageNotification.START_EDIT_BOUNDINGBOX));
            _14.setCursor(_12.CURSOR_MOVE,100);
         }
         else
         {
            _1567(new StageNotification(StageNotification.STOP_EDIT_BOUNDINGBOX));
            _14._1602(_12.CURSOR_MOVE);
         }
      }
      
      protected function _11396() : void
      {
         this._4344._1897 = null;
         if(Boolean(this._11394) && Boolean(this._11394.stage))
         {
            this._11394.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
            this._11394.stage.removeEventListener(MouseEvent.MOUSE_UP,this._4083);
            this._11394.stage.removeEventListener(MouseEvent.DOUBLE_CLICK,this._4004,true);
         }
         this._5097.removeEventListener(MouseEvent.MOUSE_DOWN,this._4063);
         this._5097.removeEventListener(MouseEvent.MOUSE_DOWN,this._4063,false);
         this._5097.removeEventListener(MouseEvent.MOUSE_DOWN,this._12654,false);
         this._4344.removeEventListener(MouseEvent.MOUSE_DOWN,this._4063);
         _1564(BoundingBoxNotification.UPDATE_SELECT_VERTICES,this._5154);
      }
      
      public function stop() : void
      {
         this._11396();
         this._12637 = false;
         dispose();
         this._11381 = null;
         this._11383 = null;
      }
      
      protected function onMouseMove(param1:MouseEvent) : void
      {
         var _loc2_:Vector.<_661> = null;
         var _loc3_:_661 = null;
         var _loc4_:Vector.<_661> = null;
         if(!_2227)
         {
            return;
         }
         if(this._4350 && this._12637)
         {
            this._12650.x = param1.stageX;
            this._12650.y = param1.stageY;
            this._11394._4347(this._12650.x,this._12650.y);
            _loc2_ = this._12648();
            if(_loc2_.length > 0)
            {
               this._3024 = false;
            }
            if(_loc2_.length > 0 || this._12653)
            {
               this._5157._2986(this._12651);
               this._5157._3877(Vector.<_91>(_loc2_));
            }
            this._12653 = _loc2_.length > 0;
         }
         else if(!this._4342)
         {
            this._4235.x = param1.stageX;
            this._4235.y = param1.stageY;
            this._4235 = this._11394.canvas.globalToLocal(this._4235);
            this._2205 = this._11394._2162.clone();
            this._2205.invert();
            this._4235 = this._2205.transformPoint(this._4235);
            _loc3_ = this._4206(this._4235.x,this._4235.y,this.NEAREST_RANGE / this._zoom);
            if(_loc3_)
            {
               this._11381._4209 = _loc3_;
               this._11381._4231(null,null);
            }
            else
            {
               _loc4_ = this._11153(this._4235.x,this._4235.y,this.NEAREST_RANGE / this._zoom);
               if((Boolean(_loc4_)) && _loc4_.length == 2)
               {
                  this._11381._4231(_loc4_[0],_loc4_[1]);
                  this._11381._4209 = null;
               }
               else
               {
                  this._11381._4231(null,null);
                  this._11381._4209 = null;
               }
            }
         }
         else
         {
            this._11393(param1.stageX,param1.stageY);
         }
         this._5169 = true;
         param1.stopPropagation();
      }
      
      protected function _11393(param1:Number, param2:Number) : void
      {
         var _loc3_:String = null;
         this._5169 = true;
         this._4356 = false;
         this._5184.x = param1;
         this._5184.y = param2;
         this._5184 = this._11394.canvas.globalToLocal(this._5184);
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
         var _loc4_:Vector.<_661> = this._5157._3823.concat();
         _loc3_ = CommandNotification.MODIFY_BOUNDINGBOX;
         var _loc5_:Point;
         (_loc5_ = new Point()).x = this._5189 * _loc4_.length / this._11383.vertices.length;
         _loc5_.y = this._5190 * _loc4_.length / this._11383.vertices.length;
         this._2205 = new Matrix();
         _88._2013(this._11381.vo.localTransform,this._2205);
         this._2205.tx = 0;
         this._2205.ty = 0;
         var _loc6_:Point = this._2205.transformPoint(_loc5_);
         _1567(new CommandNotification(_loc3_,{
            "_1837":this._11381._1837,
            "_11299":this._11381.vo,
            "_11278":this._11383,
            "boundingBoxModel":this._11381,
            "vertex":this._5174,
            "vertices":_loc4_,
            "deltaX":this._5189,
            "deltaY":this._5190,
            "_11305":_loc5_,
            "_11304":_loc6_
         }));
         this._4359.x = this._5184.x;
         this._4359.y = this._5184.y;
      }
      
      protected function _4063(param1:MouseEvent) : void
      {
         this._12655.x = param1.stageX;
         this._12655.y = param1.stageY;
         if(this._5174 != null)
         {
            if(this._11381._4209 != null && this._5174 != this._11381._4209 || this._11381._5713[0] != null)
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
            this._5186();
            this._5169 = true;
         }
         if(this._5174 != null)
         {
            this._4342 = true;
         }
         this._4359.x = param1.stageX;
         this._4359.y = param1.stageY;
         this._4359 = this._11394.canvas.globalToLocal(this._4359);
         if(!this._4342)
         {
            this._12638();
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
      
      protected function _12638() : void
      {
         if(!this._12637)
         {
            return;
         }
         this._4350 = true;
         this._12649.x = stage.mouseX;
         this._12649.y = stage.mouseY;
         this._12650.x = this._12649.x;
         this._12650.y = this._12649.y;
         this._11394._4349(this._12649.x,this._12649.y);
         this._12651 = this._5157._2889.concat();
      }
      
      protected function _4083(param1:MouseEvent) : void
      {
         this._4350 = false;
         this._11394._4340();
         this._4344._4341._4337();
         if(this._4342)
         {
            this._4342 = false;
         }
         if(this._3024)
         {
            if(Math.abs(param1.stageX - this._12655.x) + Math.abs(param1.stageY - this._12655.y) < 10)
            {
               this._5157._3024();
            }
         }
         if(!this._5169)
         {
            this._5157._3024();
         }
         else if(this._4356 && this._5157._2889.length > 0 && this._11381._4209 != null)
         {
            this._5157._2986(null,this._11381._4209);
         }
         this._4356 = false;
         _2217._1651();
         param1.stopPropagation();
      }
      
      protected function _5186() : void
      {
         var _loc1_:_661 = null;
         var _loc2_:_661 = null;
         var _loc3_:Vector.<_91> = null;
         if(Shortcut._1677())
         {
            if(this._11381._4209)
            {
               if(this._11381._5155())
               {
                  this._5157._3876(null,this._11381._4209);
               }
               else
               {
                  this._5157._3877(null,this._11381._4209);
               }
            }
            else if(this._11381._5713 && this._11381._5713[0] && Boolean(this._11381._5713[1]))
            {
               _loc1_ = this._11381._5713[0];
               _loc2_ = this._11381._5713[1];
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
         else if(Boolean(this._11381._4209) && !this._5157.isSelected(this._11381._4209))
         {
            this._5157._2986(null,this._11381._4209);
         }
         else if(this._11381._5713 && this._11381._5713[0] && Boolean(this._11381._5713[1]))
         {
            _loc3_ = new Vector.<_91>();
            _loc1_ = this._11381._5713[0];
            _loc2_ = this._11381._5713[1];
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
      
      protected function _4206(param1:Number, param2:Number, param3:Number = 10) : _661
      {
         var _loc4_:_661 = null;
         var _loc5_:_661 = null;
         var _loc6_:Number = NaN;
         param3 *= param3;
         var _loc7_:int = 0;
         var _loc8_:int = int(this._11383.vertices.length);
         while(_loc7_ < _loc8_)
         {
            _loc4_ = this._11383.vertices[_loc7_];
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
         _loc4_ = 0;
         _loc5_ = int(this._11383.vertices.length);
         while(_loc4_ < _loc5_)
         {
            _loc8_ = this._11383.vertices[_loc4_];
            if(_loc4_ < _loc5_ - 1)
            {
               _loc9_ = this._11383.vertices[_loc4_ + 1];
            }
            else
            {
               _loc9_ = this._11383.vertices[0];
            }
            if(Boolean(_loc8_) && Boolean(_loc9_))
            {
               _loc6_ = _654._4292(param1,param2,_loc8_.x,_loc8_.y,_loc9_.x,_loc9_.y,param3);
               if(_loc6_ == 3)
               {
                  _loc7_.push(_loc8_,_loc9_);
                  return _loc7_;
               }
            }
            _loc4_++;
         }
         return null;
      }
      
      public function set boundingBoxModel(param1:_11249) : void
      {
         this._11381 = param1;
         this._11383 = this._11381._11397;
      }
      
      public function set zoom(param1:Number) : void
      {
         this._zoom = param1;
      }
      
      public function set _11398(param1:Matrix) : void
      {
         this._5180 = param1;
      }
      
      public function _12652() : void
      {
         this._11394._4340();
         this._4350 = false;
      }
      
      public function _12648() : Vector.<_661>
      {
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:_661 = null;
         var _loc1_:Point = this._11394.canvas.globalToLocal(this._12649);
         var _loc2_:Point = this._11394.canvas.globalToLocal(this._12650);
         var _loc3_:Matrix = this._11394._2162.clone();
         _loc3_.invert();
         _loc1_ = _loc3_.transformPoint(_loc1_);
         _loc2_ = _loc3_.transformPoint(_loc2_);
         var _loc4_:Number = _loc1_.x < _loc2_.x ? _loc1_.x : _loc2_.x;
         var _loc5_:Number = _loc1_.x < _loc2_.x ? _loc2_.x : _loc1_.x;
         var _loc6_:Number = _loc1_.y < _loc2_.y ? _loc1_.y : _loc2_.y;
         var _loc7_:Number = _loc1_.y < _loc2_.y ? _loc2_.y : _loc1_.y;
         var _loc11_:Vector.<_661> = new Vector.<_661>();
         _loc8_ = 0;
         _loc9_ = int(this._11383.vertices.length);
         while(_loc8_ < _loc9_)
         {
            _loc10_ = this._11383.vertices[_loc8_];
            if(_loc10_.x > _loc4_ && _loc10_.x < _loc5_ && _loc10_.y > _loc6_ && _loc10_.y < _loc7_)
            {
               _loc11_.push(_loc10_);
            }
            _loc8_++;
         }
         return _loc11_;
      }
   }
}

