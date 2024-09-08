package _561
{
   import _1404._1405;
   import _24.Shortcut;
   import _521._529;
   import _652._654;
   import _658._661;
   import _783.CommandNotification;
   import _783.MeshNotification;
   import _783.PanelNotification;
   import _783.StageNotification;
   import _81._91;
   import _877._876;
   import _877._887;
   import flash.events.MouseEvent;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.ui.Mouse;
   
   public class _569 extends _567
   {
      private var _4264:_661;
      
      private var _4348:_529;
      
      private var _4344:_887;
      
      private var _4342:Boolean;
      
      private var _4359:Point;
      
      private var _4367:Boolean;
      
      private var _4366:Boolean;
      
      private var _4235:Point;
      
      private var _2205:Matrix;
      
      private var _4370:Boolean;
      
      private var _4338:Vector.<_91>;
      
      private var _4360:Vector.<_91>;
      
      private var _4345:Point;
      
      private var _4357:Point;
      
      private var _4350:Boolean;
      
      private var _4351:Boolean;
      
      private var _4352:Boolean;
      
      private var _4356:Boolean;
      
      private var _10508:Boolean;
      
      public function _569()
      {
         super();
         this._4359 = new Point();
         this._4235 = new Point();
         this._4348 = new _529();
      }
      
      override protected function init() : void
      {
         super.init();
      }
      
      override protected function dispose() : void
      {
         if(_4210)
         {
            _4210._4358 = null;
            _4210._4209 = null;
         }
         this._4344._4341.removeEventListener(MouseEvent.MOUSE_DOWN,this._4343);
         this._4344._1897 = null;
         this._4344 = null;
         super.dispose();
      }
      
      override protected function _4205() : void
      {
         _1564(StageNotification.START_EDIT_FFD,this._4361);
         if(Boolean(_4211) && Boolean(_4211.stage))
         {
            _4211.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
            _4211.stage.removeEventListener(MouseEvent.MOUSE_UP,this._4083);
            _4211.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this._4363);
            _4211.stage.removeEventListener(MouseEvent.MOUSE_DOWN,this._4063);
         }
         _1564(MeshNotification.UPDATE_SELECT_M_VERTICES,this._4353);
      }
      
      override protected function _1576() : void
      {
         _1565(StageNotification.START_EDIT_FFD,this._4361);
         _4211.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         _4211.stage.addEventListener(MouseEvent.MOUSE_UP,this._4083);
         _4211.stage.addEventListener(MouseEvent.MOUSE_DOWN,this._4063);
         this._4344._4341.addEventListener(MouseEvent.MOUSE_DOWN,this._4343);
         _1565(MeshNotification.UPDATE_SELECT_M_VERTICES,this._4353);
      }
      
      private function _4353(param1:MeshNotification) : void
      {
         if(this._4348._3823.length > 0)
         {
            this._4339(this._4348._3823[0]);
         }
         else
         {
            this._4339(null);
         }
      }
      
      private function _4361(param1:StageNotification) : void
      {
         this._4348._3024();
      }
      
      override public function update() : void
      {
         if(Boolean(_4211) && Boolean(_4211.stage))
         {
            this._4228(_4211.stage.mouseX,_4211.stage.mouseY);
         }
      }
      
      override public function set _4269(param1:_876) : void
      {
         super._4269 = param1;
      }
      
      override public function _3024() : void
      {
         this._4344._1897 = null;
         this._4264 = null;
      }
      
      private function _4343(param1:MouseEvent) : void
      {
         this._4235 = _4211.globalToLocal(new Point(param1.stageX,param1.stageY));
         this._4355(this._4235.x,this._4235.y);
      }
      
      private function _4355(param1:Number, param2:Number) : void
      {
         if(!this._4342)
         {
            this._4342 = true;
            _4211.stage.addEventListener(MouseEvent.MOUSE_MOVE,this._4363);
         }
         this._4359.x = param1;
         this._4359.y = param2;
         if(this._4344._4341._4368 || this._4344._4341._4369)
         {
            this._4367 = this._4344._4341._4368;
            this._4366 = this._4344._4341._4369;
         }
         else
         {
            this._4367 = true;
            this._4366 = true;
         }
         this._4344._4341._4365(this._4367,this._4366);
         if(this._4359.x > _4294 || this._4359.x < -_4294 || this._4359.y > _4293 || this._4359.y < -_4293)
         {
            this._10508 = true;
         }
         else
         {
            this._10508 = false;
         }
      }
      
      private function _4363(param1:MouseEvent) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         if(_4220)
         {
            return;
         }
         if(this._4342)
         {
            this._4235 = _4211.globalToLocal(new Point(param1.stageX,param1.stageY));
            _loc2_ = this._4235.x;
            _loc3_ = this._4235.y;
            if(_loc2_ != this._4359.x || _loc3_ != this._4359.y)
            {
               this.moveFrame(_loc2_ - this._4359.x,_loc3_ - this._4359.y);
               this._4359.x = _loc2_;
               this._4359.y = _loc3_;
               this._4356 = false;
            }
         }
      }
      
      private function _11150() : Boolean
      {
         return _4210._5713 && _4210._5713.length == 2 && _4210._5713[0] != null && _4210._5713[1] != null;
      }
      
      private function _11149() : void
      {
         this._4348._3024();
         if(!this._4348.isSelected(_4210._5713[0]))
         {
            this._4348._2986(null,_4210._5713[0]);
         }
         if(!this._4348.isSelected(_4210._5713[1]))
         {
            this._4348._3877(null,_4210._5713[1]);
         }
      }
      
      private function _11147() : void
      {
         if(!this._4348.isSelected(_4210._5713[0]))
         {
            this._4348._3877(null,_4210._5713[0]);
         }
         if(!this._4348.isSelected(_4210._5713[1]))
         {
            this._4348._3877(null,_4210._5713[1]);
         }
      }
      
      private function _4063(param1:MouseEvent) : void
      {
         var _loc2_:Point = null;
         if(Mouse.cursor == _1405.DESKTOP_RESIZE_EW || Mouse.cursor == _1405.DESKTOP_RESIZE_NS || Mouse.cursor == _1405.DESKTOP_RESIZE_NESW || Mouse.cursor == _1405.DESKTOP_RESIZE_NWSE)
         {
            return;
         }
         if(_4220)
         {
            return;
         }
         if(_4239)
         {
            this._4348._3024();
            return;
         }
         this._4370 = false;
         if(_4210._4209)
         {
            if(Shortcut._1677())
            {
               if(this._4348.isSelected(_4210._4209))
               {
                  this._4348._3876(null,_4210._4209);
               }
               else
               {
                  this._4348._3877(null,_4210._4209);
               }
            }
            else if(!this._4348.isSelected(_4210._4209))
            {
               this._4348._2986(null,_4210._4209);
            }
            else
            {
               this._4356 = true;
            }
         }
         else if(this._11150())
         {
            if(Shortcut._1677())
            {
               this._11147();
            }
            else
            {
               this._11149();
            }
         }
         else if(Shortcut._1677())
         {
            this._4350 = true;
            this._4351 = true;
            this._4338 = this._4348._2889.concat();
            _loc2_ = new Point(param1.stageX,param1.stageY);
            this._4345 = _4211.globalToLocal(_loc2_);
            this._4352 = false;
         }
         if(!Shortcut._1677())
         {
            if(this._4264)
            {
               this._4235 = _4211.globalToLocal(new Point(param1.stageX,param1.stageY));
               this._4355(this._4235.x,this._4235.y);
            }
            else if(!_4210._4209)
            {
               this._4350 = true;
               _loc2_ = new Point(param1.stageX,param1.stageY);
               this._4345 = _4211.globalToLocal(_loc2_);
               this._4352 = false;
            }
         }
      }
      
      private function onMouseMove(param1:MouseEvent) : void
      {
         if(!_4295)
         {
            return;
         }
         if(_4220)
         {
            return;
         }
         this._4228(param1.stageX,param1.stageY);
      }
      
      private function _4354(param1:Point, param2:Point) : Vector.<_91>
      {
         var _loc8_:_661 = null;
         var _loc3_:Number = param1.x < param2.x ? param1.x : param2.x;
         var _loc4_:Number = param1.y < param2.y ? param1.y : param2.y;
         var _loc5_:Number = Math.abs(param1.x - param2.x);
         var _loc6_:Number = Math.abs(param1.y - param2.y);
         var _loc7_:Vector.<_91> = new Vector.<_91>();
         var _loc9_:int = 0;
         var _loc10_:int = int(_2123.vertices.length);
         while(_loc9_ < _loc10_)
         {
            _loc8_ = _2123.vertices[_loc9_];
            if(_loc8_.x > _loc3_ && _loc8_.x < _loc3_ + _loc5_ && _loc8_.y > _loc4_ && _loc8_.y < _loc4_ + _loc6_)
            {
               _loc7_.push(_loc8_);
            }
            _loc9_++;
         }
         return _loc7_;
      }
      
      private function _4346() : void
      {
         this._4360 = this._4354(this._4345,this._4357);
         if(this._4351)
         {
            this._4348._2986(this._4338);
            this._4348._3874(this._4360);
         }
         else
         {
            this._4348._2986(this._4360);
         }
      }
      
      private function _4228(param1:Number, param2:Number) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Vector.<_661> = null;
         this._4370 = true;
         if(this._4350)
         {
            if(!this._4352)
            {
               _4211._4349(param1,param2);
               this._4352 = true;
            }
            this._4357 = _4211.globalToLocal(new Point(param1,param2));
            _4211._4347(param1,param2);
            this._4346();
         }
         else if(!this._4342)
         {
            this._4235 = _4211.globalToLocal(new Point(param1,param2));
            _loc3_ = this._4235.x;
            _loc4_ = this._4235.y;
            _loc5_ = _4290(_loc3_,_loc4_);
            if(_loc5_)
            {
               if(_loc5_.length == 1)
               {
                  _4210._4209 = _loc5_[0];
                  _4210._4231(null,null);
               }
               else
               {
                  _4210._4209 = null;
                  _4210._4231(_loc5_[0],_loc5_[1]);
               }
            }
            else
            {
               _4210._4209 = null;
               _4210._4231(null,null);
            }
         }
      }
      
      private function moveFrame(param1:Number, param2:Number) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:_661 = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Array = null;
         var _loc9_:Array = null;
         var _loc10_:Array = null;
         var _loc11_:Array = null;
         if(this._4264 == null)
         {
            return;
         }
         if(!this._4367)
         {
            param1 = 0;
         }
         if(!this._4366)
         {
            param2 = 0;
         }
         if(!this._10508)
         {
            _loc6_ = 0;
            _loc7_ = int(this._4348._3823.length);
            while(_loc6_ < _loc7_)
            {
               _loc5_ = this._4348._3823[_loc6_];
               _loc3_ = _loc5_.x + param1;
               _loc4_ = _loc5_.y + param2;
               if(_loc3_ < -_4294 || _loc3_ > _4294)
               {
                  param1 = 0;
               }
               if(_loc4_ < -_4293 || _loc4_ > _4293)
               {
                  param2 = 0;
               }
               if(param1 == 0 && param2 == 0)
               {
                  return;
               }
               _loc6_++;
            }
         }
         if(Boolean(param1) || Boolean(param2))
         {
            if(this._4362(param1,param2,this._4348._3823))
            {
               param1 = 0;
               param2 = 0;
               return;
            }
         }
         if(Boolean(param1) || Boolean(param2))
         {
            _loc8_ = [];
            _loc9_ = [];
            _loc10_ = [];
            _loc11_ = [];
            _loc6_ = 0;
            _loc7_ = int(this._4348._3823.length);
            while(_loc6_ < _loc7_)
            {
               _loc8_.push(this._4348._3823[_loc6_].x + param1);
               _loc9_.push(this._4348._3823[_loc6_].y + param2);
               _loc10_.push(this._4348._3823[_loc6_].x);
               _loc11_.push(this._4348._3823[_loc6_].y);
               _loc6_++;
            }
            _1567(new CommandNotification(CommandNotification.MODIFY_VERTEX,{
               "vertex":this._4264,
               "vertices":this._4348._3823.concat(),
               "mesh":_2123,
               "_1837":_4213,
               "_3192":_loc8_,
               "_3191":_loc9_,
               "_3147":_loc10_,
               "_3146":_loc11_
            }));
         }
      }
      
      private function _4362(param1:Number, param2:Number, param3:Vector.<_661>) : Boolean
      {
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc14_:_661 = null;
         var _loc4_:Vector.<_661> = new Vector.<_661>();
         var _loc5_:Vector.<_661> = new Vector.<_661>();
         var _loc10_:Point = new Point();
         var _loc11_:Point = new Point();
         var _loc12_:Point = new Point();
         var _loc13_:Point = new Point();
         _loc6_ = 0;
         _loc7_ = int(_2123.outline.length);
         while(_loc6_ < _loc7_)
         {
            if(param3.indexOf(_2123.outline[_loc6_]) != -1)
            {
               _loc4_.push(_2123.outline[_loc6_],_2123.outline[_loc6_ + 1]);
            }
            else if(param3.indexOf(_2123.outline[_loc6_ + 1]) != -1)
            {
               _loc4_.push(_2123.outline[_loc6_ + 1],_2123.outline[_loc6_]);
            }
            else
            {
               _loc5_.push(_2123.outline[_loc6_],_2123.outline[_loc6_ + 1]);
            }
            _loc6_ += 2;
         }
         _loc6_ = 0;
         _loc7_ = int(_2123.userEdges.length);
         while(_loc6_ < _loc7_)
         {
            if(param3.indexOf(_2123.userEdges[_loc6_]) != -1)
            {
               _loc4_.push(_2123.userEdges[_loc6_],_2123.userEdges[_loc6_ + 1]);
            }
            else if(param3.indexOf(_2123.userEdges[_loc6_ + 1]) != -1)
            {
               _loc4_.push(_2123.userEdges[_loc6_ + 1],_2123.userEdges[_loc6_]);
            }
            else
            {
               _loc5_.push(_2123.userEdges[_loc6_],_2123.userEdges[_loc6_ + 1]);
            }
            _loc6_ += 2;
         }
         _loc6_ = 0;
         _loc7_ = int(_loc4_.length);
         if(_loc7_ <= 0)
         {
            return false;
         }
         while(_loc6_ < _loc7_)
         {
            _loc14_ = _loc4_[_loc6_];
            _loc10_.x = _loc14_.x + param1;
            _loc10_.y = _loc14_.y + param2;
            _loc14_ = _loc4_[_loc6_ + 1];
            if(param3.indexOf(_loc14_) == -1)
            {
               _loc11_.x = _loc14_.x;
               _loc11_.y = _loc14_.y;
            }
            else
            {
               _loc11_.x = _loc14_.x + param1;
               _loc11_.y = _loc14_.y + param2;
            }
            _loc8_ = 0;
            _loc9_ = int(_loc5_.length);
            while(_loc8_ < _loc9_)
            {
               _loc12_.x = _loc5_[_loc8_].x;
               _loc12_.y = _loc5_[_loc8_].y;
               _loc13_.x = _loc5_[_loc8_ + 1].x;
               _loc13_.y = _loc5_[_loc8_ + 1].y;
               if(_654.cross2(_loc10_,_loc11_,_loc12_,_loc13_))
               {
                  return true;
               }
               _loc8_ += 2;
            }
            _loc6_ += 2;
         }
         return false;
      }
      
      private function _4364(param1:Number, param2:Number) : Boolean
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc3_:Vector.<_661> = new Vector.<_661>();
         var _loc4_:Vector.<_661> = new Vector.<_661>();
         var _loc9_:Point = new Point();
         var _loc10_:Point = new Point();
         var _loc11_:Point = new Point();
         var _loc12_:Point = new Point();
         _loc5_ = 0;
         _loc6_ = int(_2123.outline.length);
         while(_loc5_ < _loc6_)
         {
            if(_2123.outline[_loc5_] == this._4264)
            {
               _loc3_.push(_2123.outline[_loc5_],_2123.outline[_loc5_ + 1]);
            }
            else if(_2123.outline[_loc5_ + 1] == this._4264)
            {
               _loc3_.push(_2123.outline[_loc5_ + 1],_2123.outline[_loc5_]);
            }
            else
            {
               _loc4_.push(_2123.outline[_loc5_],_2123.outline[_loc5_ + 1]);
            }
            _loc5_ += 2;
         }
         _loc5_ = 0;
         _loc6_ = int(_2123.userEdges.length);
         while(_loc5_ < _loc6_)
         {
            if(_2123.userEdges[_loc5_] == this._4264)
            {
               _loc3_.push(_2123.userEdges[_loc5_],_2123.userEdges[_loc5_ + 1]);
            }
            else if(_2123.userEdges[_loc5_ + 1] == this._4264)
            {
               _loc3_.push(_2123.userEdges[_loc5_ + 1],_2123.userEdges[_loc5_]);
            }
            else
            {
               _loc4_.push(_2123.userEdges[_loc5_],_2123.userEdges[_loc5_ + 1]);
            }
            _loc5_ += 2;
         }
         _loc5_ = 0;
         _loc6_ = int(_loc3_.length);
         if(_loc6_ <= 0)
         {
            return false;
         }
         while(_loc5_ < _loc6_)
         {
            _loc9_.x = _loc3_[_loc5_].x + param1;
            _loc9_.y = _loc3_[_loc5_].y + param2;
            _loc10_.x = _loc3_[_loc5_ + 1].x;
            _loc10_.y = _loc3_[_loc5_ + 1].y;
            _loc7_ = 0;
            _loc8_ = int(_loc4_.length);
            while(_loc7_ < _loc8_)
            {
               _loc11_.x = _loc4_[_loc7_].x;
               _loc11_.y = _loc4_[_loc7_].y;
               _loc12_.x = _loc4_[_loc7_ + 1].x;
               _loc12_.y = _loc4_[_loc7_ + 1].y;
               if(_654.cross2(_loc9_,_loc10_,_loc11_,_loc12_))
               {
                  return true;
               }
               _loc7_ += 2;
            }
            _loc5_ += 2;
         }
         return false;
      }
      
      private function onMouseOut(param1:MouseEvent) : void
      {
         if(!this._4342)
         {
            _4210._4209 = null;
            _4210._4231(null,null);
            _4210.invalid = false;
            _4210._2466();
         }
      }
      
      private function _4083(param1:MouseEvent) : void
      {
         if(_4220)
         {
            return;
         }
         if(this._4350)
         {
            this._4350 = false;
            this._4351 = false;
            this._4352 = false;
            _4211._4340();
         }
         if(!this._4370)
         {
            if(this._4356 && this._4348.isSelected(_4210._4209))
            {
               this._4348._2986(null,_4210._4209);
            }
            else if(_4210._4209 == null && !this._11150())
            {
               this._4348._3024();
            }
         }
         if(this._4342)
         {
            this._4342 = false;
            _4211.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this._4363);
            _2217._1651();
            if(this._4344)
            {
               this._4344._4341._4337();
            }
         }
         this._4356 = false;
      }
      
      public function _4339(param1:_661) : void
      {
         this._4264 = param1;
         _4210._4358 = this._4264;
         _4210._3823 = this._4348._3823;
         _4210._11148();
         if(this._4264)
         {
            this._4264.update();
            _1567(new PanelNotification(PanelNotification.SELECT_VERTEX));
         }
         this._4344._1897 = this._4264;
      }
      
      public function set _4313(param1:_887) : void
      {
         this._4344 = param1;
      }
      
      override public function _3173() : void
      {
         this._4344._1751();
         super._3173();
      }
   }
}

