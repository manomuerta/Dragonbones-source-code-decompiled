package _11500
{
   import _1404._1405;
   import _1404._1407;
   import _24.Shortcut;
   import _521._529;
   import _652._655;
   import _658._661;
   import _783.MeshNotification;
   import _783.StageNotification;
   import _81._91;
   import flash.events.MouseEvent;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.ui.Mouse;
   
   public class _14073 extends _11501
   {
      protected var _4264:_661;
      
      protected var _4348:_529;
      
      protected var _14633:Boolean = true;
      
      protected var _14630:Boolean = true;
      
      private var _4235:Point;
      
      private var _2205:Matrix;
      
      private var _4370:Boolean;
      
      private var _4338:Vector.<_91>;
      
      private var _4360:Vector.<_91>;
      
      private var _4345:Point;
      
      private var _4357:Point;
      
      protected var _4350:Boolean;
      
      private var _4351:Boolean;
      
      private var _4352:Boolean;
      
      private var _4356:Boolean;
      
      private var _10508:Boolean;
      
      private var _11676:_655;
      
      private var _11674:_655;
      
      private var _5189:Number;
      
      private var _5190:Number;
      
      private var _12667:Array;
      
      private var _12666:Array;
      
      private var _12669:Vector.<Number>;
      
      private var _12668:Vector.<Number>;
      
      private var _12670:Boolean;
      
      private var _12671:Boolean;
      
      public function _14073()
      {
         super();
         this._4235 = new Point();
         this._4348 = _1407.getInstance(_529) as _529;
         _11418 = true;
         this._11676 = new _655(null,null,null);
         this._11674 = new _655(null,null,null);
         this._12667 = [];
         this._12666 = [];
         this._12669 = new Vector.<Number>();
         this._12668 = new Vector.<Number>();
      }
      
      override protected function dispose() : void
      {
         this._4348._3024();
         if(_4210)
         {
            _4210._4358 = null;
            _4210._4209 = null;
            _4210._11669.length = 0;
            _4210._11663 = false;
            _4210._11148();
         }
         this._4264 = null;
         super.dispose();
      }
      
      override protected function _4205() : void
      {
         super._4205();
         _1564(StageNotification.START_EDIT_FFD,this._4361);
         if(stage)
         {
            stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
            stage.removeEventListener(MouseEvent.MOUSE_UP,this._4083);
         }
         if(_5097)
         {
            _5097.removeEventListener(MouseEvent.MOUSE_DOWN,this._4063);
         }
         _1564(MeshNotification.UPDATE_SELECT_M_VERTICES,this._4353);
      }
      
      override protected function _1576() : void
      {
         super._1576();
         _1565(StageNotification.START_EDIT_FFD,this._4361);
         if(stage)
         {
            stage.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
            stage.addEventListener(MouseEvent.MOUSE_UP,this._4083);
         }
         if(_5097)
         {
            _5097.addEventListener(MouseEvent.MOUSE_DOWN,this._4063,false,2000);
         }
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
      
      override public function _3024() : void
      {
         this._4264 = null;
      }
      
      protected function _11150() : Boolean
      {
         if(this._14630)
         {
            return _4210._5713 && _4210._5713.length == 2 && _4210._5713[0] != null && _4210._5713[1] != null;
         }
         return false;
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
         this._4370 = false;
         if(!this._14633)
         {
            return;
         }
         if(_4239)
         {
            this._4348._3024();
            return;
         }
         if(_11657)
         {
         }
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
            else if(!this._4348.isSelected(_4210._4209) || this._4348._2889.length > 1)
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
            this._4345 = _4211.canvas.globalToLocal(_loc2_);
            this._4352 = false;
         }
         if(!Shortcut._1677())
         {
            if(!_4210._4209 && this._4264 == null)
            {
               this._4350 = true;
               _loc2_ = new Point(param1.stageX,param1.stageY);
               this._4345 = _4211.canvas.globalToLocal(_loc2_);
               this._4352 = false;
            }
         }
      }
      
      private function onMouseMove(param1:MouseEvent) : void
      {
         this._4228(param1.stageX,param1.stageY);
         if(this._12670)
         {
            this._12671 = true;
         }
      }
      
      private function _4354(param1:Point, param2:Point) : Vector.<_91>
      {
         var _loc8_:Point = null;
         var _loc3_:Number = param1.x < param2.x ? param1.x : param2.x;
         var _loc4_:Number = param1.y < param2.y ? param1.y : param2.y;
         var _loc5_:Number = Math.abs(param1.x - param2.x);
         var _loc6_:Number = Math.abs(param1.y - param2.y);
         var _loc7_:Vector.<_91> = new Vector.<_91>();
         var _loc9_:int = 0;
         var _loc10_:int = int(_2123.vertices.length);
         while(_loc9_ < _loc10_)
         {
            if(_11657)
            {
               _loc8_ = _2123._3183(_2123.vertices[_loc9_]);
               this._2205 = _4211._2162.clone();
               _loc8_ = this._2205.transformPoint(_loc8_);
            }
            else
            {
               _loc8_ = _2123.vertices[_loc9_];
            }
            if(_loc8_)
            {
               if(_loc8_.x > _loc3_ && _loc8_.x < _loc3_ + _loc5_ && _loc8_.y > _loc4_ && _loc8_.y < _loc4_ + _loc6_)
               {
                  _loc7_.push(_2123.vertices[_loc9_]);
               }
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
         var _loc5_:_661 = null;
         var _loc6_:Vector.<_661> = null;
         this._4370 = true;
         if(this._4350)
         {
            if(!this._4352)
            {
               _4211._4349(param1,param2);
               this._4352 = true;
            }
            this._4357 = _4211.canvas.globalToLocal(new Point(param1,param2));
            _4211._4347(param1,param2);
            this._4346();
         }
         else if(this._14633)
         {
            this._4235 = _4211.canvas.globalToLocal(new Point(param1,param2));
            _loc3_ = this._4235.x;
            _loc4_ = this._4235.y;
            _loc5_ = _4206(_loc3_,_loc4_);
            if(_loc5_)
            {
               _4210._4209 = _loc5_;
               _4210._4231(null,null);
            }
            else if(this._14630)
            {
               _loc6_ = _4217(_loc3_,_loc4_);
               if((Boolean(_loc6_)) && _loc6_.length == 2)
               {
                  _4210._4209 = null;
                  _4210._4231(_loc6_[0],_loc6_[1]);
               }
               else
               {
                  _loc6_ = _4245(_loc3_,_loc4_);
                  if((Boolean(_loc6_)) && _loc6_.length == 2)
                  {
                     _4210._4209 = null;
                     _4210._4231(_loc6_[0],_loc6_[1]);
                  }
                  else
                  {
                     _4210._4209 = null;
                     _4210._4231(null,null);
                  }
               }
            }
            else
            {
               _4210._4209 = null;
               _4210._4231(null,null);
            }
         }
      }
      
      private function onMouseOut(param1:MouseEvent) : void
      {
         if(this._14633)
         {
            _4210._4209 = null;
            _4210._4231(null,null);
            _4210.invalid = false;
            _4210._2466();
         }
      }
      
      private function _4083(param1:MouseEvent) : void
      {
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
         this._4356 = false;
         if(_4210)
         {
            _4210._11663 = false;
         }
         if(this._12670 && !this._12671)
         {
            if(_4210._4209)
            {
               this._4348._2986(null,_4210._4209);
            }
         }
         this._12670 = false;
         this._12671 = false;
      }
      
      public function _4339(param1:_661) : void
      {
         var _loc2_:_661 = null;
         this._4264 = param1;
         _4210._4358 = this._4264;
         _4210._3823 = this._4348._3823;
         if(this._14630)
         {
            _4210._11148();
         }
         if(_11657)
         {
            if(this._4264)
            {
               _loc2_ = _4210._5706(this._4264);
               if(_loc2_)
               {
                  _loc2_.update();
               }
            }
         }
         if(this._4264)
         {
            this._4264.update();
            _1567(new MeshNotification(MeshNotification.UPDATE_SELECT_UV));
         }
         else
         {
            _4210._11669.length = 0;
         }
      }
      
      override public function _3173() : void
      {
         _4344._1751();
         super._3173();
      }
      
      override public function set _11662(param1:Boolean) : void
      {
         super._11662 = param1;
         if(this._4264)
         {
            this._4339(this._4264);
         }
      }
   }
}

