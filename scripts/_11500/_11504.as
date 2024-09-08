package _11500
{
   import _13._12;
   import _13._14;
   import _1404._1405;
   import _24.Shortcut;
   import _652._654;
   import _652._655;
   import _652._656;
   import _658._661;
   import _783.CommandNotification;
   import _783.MeshNotification;
   import _783.StageNotification;
   import _81._91;
   import _877._887;
   import flash.events.MouseEvent;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.ui.Mouse;
   
   public class _11504 extends _14073
   {
      private var _4342:Boolean;
      
      private var _11668:Point;
      
      private var _11667:Point;
      
      private var _11672:Point;
      
      private var _11670:Point;
      
      private var _11673:Point;
      
      private var _4359:Point;
      
      private var _4367:Boolean;
      
      private var _4366:Boolean;
      
      private var _4235:Point;
      
      private var _11671:Point;
      
      private var _2205:Matrix;
      
      private var _4370:Boolean;
      
      private var _4338:Vector.<_91>;
      
      private var _4360:Vector.<_91>;
      
      private var _4345:Point;
      
      private var _4357:Point;
      
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
      
      public function _11504()
      {
         super();
         this._11668 = new Point();
         this._11667 = new Point();
         this._11672 = new Point();
         this._11670 = new Point();
         this._11673 = new Point();
         this._4359 = new Point();
         this._4235 = new Point();
         this._11671 = new Point();
         _11418 = true;
         this._11676 = new _655(null,null,null);
         this._11674 = new _655(null,null,null);
         this._12667 = [];
         this._12666 = [];
         this._12669 = new Vector.<Number>();
         this._12668 = new Vector.<Number>();
      }
      
      override public function start() : void
      {
         super.start();
         _11418 = !_2212._11422();
         _14.setCursor(_12.AUTO,100);
      }
      
      override public function stop() : void
      {
         super.stop();
         _14._1602(_12.AUTO);
         _14.setCursor(_12.CURSOR_MESH_EDIT,100);
         _14._1602(_12.CURSOR_MESH_EDIT);
      }
      
      override protected function dispose() : void
      {
         _4348._3024();
         if(_4210)
         {
            _4210._4358 = null;
            _4210._4209 = null;
            _4210._11669.length = 0;
            _4210._11663 = false;
            _4210._11148();
         }
         _4264 = null;
         _4344._4341.removeEventListener(MouseEvent.MOUSE_DOWN,this._4343);
         _4344._1897 = null;
         super.dispose();
      }
      
      override protected function _4205() : void
      {
         super._4205();
         _1564(StageNotification.START_EDIT_FFD,this._4361);
         if(stage)
         {
            stage.removeEventListener(MouseEvent.MOUSE_UP,this._4083);
         }
         if(_5097)
         {
            _5097.removeEventListener(MouseEvent.MOUSE_DOWN,this._12654);
         }
         _1564(MeshNotification.UPDATE_SELECT_M_VERTICES,this._4353);
      }
      
      override protected function _1576() : void
      {
         super._1576();
         _1565(StageNotification.START_EDIT_FFD,this._4361);
         if(stage)
         {
            stage.addEventListener(MouseEvent.MOUSE_UP,this._4083);
         }
         if(_5097)
         {
            _5097.addEventListener(MouseEvent.MOUSE_DOWN,this._12654,false,1000);
         }
         _4344._4341.addEventListener(MouseEvent.MOUSE_DOWN,this._4343);
         _1565(MeshNotification.UPDATE_SELECT_M_VERTICES,this._4353);
      }
      
      private function _4353(param1:MeshNotification) : void
      {
         if(_4348._3823.length > 0)
         {
            this._4339(_4348._3823[0]);
         }
         else
         {
            this._4339(null);
         }
      }
      
      private function _4361(param1:StageNotification) : void
      {
         _4348._3024();
      }
      
      override public function _3024() : void
      {
         _4344._1897 = null;
         _4264 = null;
      }
      
      private function _4343(param1:MouseEvent) : void
      {
         this._12671 = false;
         this._12670 = true;
         this._4235.x = param1.stageX;
         this._4235.y = param1.stageY;
         this._11664();
         this._4355(this._4235.x,this._4235.y);
         param1.stopImmediatePropagation();
      }
      
      private function _4355(param1:Number, param2:Number) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:_661 = null;
         if(!this._4342)
         {
            this._4342 = true;
            _4211.stage.addEventListener(MouseEvent.MOUSE_MOVE,this._4363);
         }
         _14633 = false;
         this._4359.x = param1;
         this._4359.y = param2;
         this._4235 = this._11666(new Point(param1,param2));
         this._11668.x = this._4235.x;
         this._11668.y = this._4235.y;
         if(_11657)
         {
            this._11667 = this._4235;
            this._11668 = this._11677(this._11667);
         }
         if(_4344._4341._4368 || _4344._4341._4369)
         {
            this._4367 = _4344._4341._4368;
            this._4366 = _4344._4341._4369;
         }
         else
         {
            this._4367 = true;
            this._4366 = true;
         }
         _4344._4341._4365(this._4367,this._4366);
         if(this._11668.x > _4294 || this._11668.x < -_4294 || this._11668.y > _4293 || this._11668.y < -_4293)
         {
            this._10508 = false;
         }
         else
         {
            this._10508 = false;
         }
         this._12667.length = 0;
         this._12666.length = 0;
         this._12669.length = 0;
         this._12668.length = 0;
         _loc3_ = 0;
         _loc4_ = int(_4348._3823.length);
         while(_loc3_ < _loc4_)
         {
            this._12667.push(_4348._3823[_loc3_].x);
            this._12666.push(_4348._3823[_loc3_].y);
            _loc5_ = _2123._3183(_4348._3823[_loc3_]);
            if(_loc5_)
            {
               this._12669.push(_loc5_.x);
               this._12668.push(_loc5_.y);
            }
            _loc3_++;
         }
      }
      
      private function _4363(param1:MouseEvent) : void
      {
         if(this._4342)
         {
            this._11673.x = param1.stageX;
            this._11673.y = param1.stageY;
            if(!this._4367)
            {
               this._11673.x = this._4359.x;
            }
            if(!this._4366)
            {
               this._11673.y = this._4359.y;
            }
            this._4235 = this._11666(new Point(this._11673.x,this._11673.y));
            this._11672.x = this._4235.x;
            this._11672.y = this._4235.y;
            if(_11657)
            {
               this._11670 = this._4235;
               this._11672 = this._11677(this._11670);
            }
            if(this._11672.x != this._11668.x || this._11672.y != this._11668.y)
            {
               this.moveFrame(this._11672.x - this._11668.x,this._11672.y - this._11668.y);
               this._4356 = false;
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
         var _loc8_:Boolean = false;
         var _loc13_:Vector.<_661> = null;
         var _loc14_:_661 = null;
         var _loc15_:Vector.<Number> = null;
         var _loc16_:Vector.<Number> = null;
         var _loc17_:Object = null;
         var _loc18_:String = null;
         var _loc9_:Number = 1;
         if(_4264 == null)
         {
            return;
         }
         if(!this._10508)
         {
            _loc6_ = 0;
            _loc7_ = int(_4348._3823.length);
            while(_loc6_ < _loc7_)
            {
               _loc5_ = _4348._3823[_loc6_];
               _loc3_ = this._12667[_loc6_] + param1;
               _loc4_ = this._12666[_loc6_] + param2;
               if(_loc3_ < -_4294 || _loc3_ > _4294)
               {
                  _loc8_ = true;
                  if(_loc3_ < -_4294)
                  {
                     param1 = -_4294 - this._12667[_loc6_];
                  }
                  else if(_loc3_ > _4294)
                  {
                     param1 = _4294 - this._12667[_loc6_];
                  }
               }
               if(_loc4_ < -_4293 || _loc4_ > _4293)
               {
                  _loc8_ = true;
                  if(_loc4_ < -_4293)
                  {
                     param2 = -_4293 - this._12666[_loc6_];
                  }
                  else if(_loc4_ > _4293)
                  {
                     param2 = _4293 - this._12666[_loc6_];
                  }
               }
               if(param1 == 0 && param2 == 0)
               {
                  return;
               }
               this._11672.x = this._11668.x + param1;
               this._11672.y = this._11668.y + param2;
               if(_11657)
               {
                  this._11670 = this._11675(this._11672);
                  this._5189 = this._11670.x - this._11667.x;
                  this._5190 = this._11670.y - this._11667.y;
               }
               _loc6_++;
            }
         }
         if(param1 > 0 && param1 < _loc9_ || param1 < 0 && param1 > -_loc9_)
         {
            param1 = 0;
         }
         if(param2 > 0 && param2 < _loc9_ || param2 < 0 && param2 > -_loc9_)
         {
            param2 = 0;
         }
         if(Boolean(param1) || Boolean(param2))
         {
            if(this._4362(param1,param2,_4348._3823,this._12667,this._12666))
            {
               param1 = 0;
               param2 = 0;
               _4210._11663 = false;
               return;
            }
         }
         var _loc10_:Array = [];
         var _loc11_:Array = [];
         _loc6_ = 0;
         _loc7_ = int(_4348._3823.length);
         while(_loc6_ < _loc7_)
         {
            _loc10_.push(this._12667[_loc6_] + param1);
            _loc11_.push(this._12666[_loc6_] + param2);
            _loc6_++;
         }
         if(_4264 == null)
         {
            return;
         }
         var _loc12_:Object = {
            "vertex":_4264,
            "vertices":_4348._3823.concat(),
            "mesh":_2123,
            "_1837":_4213,
            "_3192":_loc10_.concat(),
            "_3191":_loc11_.concat(),
            "_3147":this._12667.concat(),
            "_3146":this._12666.concat()
         };
         if(_11657)
         {
            _loc13_ = new Vector.<_661>();
            _loc15_ = new Vector.<Number>();
            _loc16_ = new Vector.<Number>();
            _loc6_ = 0;
            _loc7_ = int(_4348._3823.length);
            while(_loc6_ < _loc7_)
            {
               _loc14_ = _2123._3183(_4348._3823[_loc6_]);
               if(_loc14_)
               {
                  _loc13_.push(_loc14_);
                  _loc15_.push(this._12669[_loc6_] + this._5189);
                  _loc16_.push(this._12668[_loc6_] + this._5190);
               }
               _loc6_++;
            }
            _loc17_ = {
               "_1837":_4213,
               "_1838":_4296,
               "vertex":_2123._3183(_4264),
               "vertices":_loc13_,
               "_3192":_loc15_.concat(),
               "_3191":_loc16_.concat(),
               "_3147":this._12669.concat(),
               "_3146":this._12668.concat()
            };
            if(_4213._2112())
            {
               _loc18_ = CommandNotification.MODIFY_SKINED_FFD_UV;
            }
            else
            {
               _loc18_ = CommandNotification.MODIFY_FFD_UV;
            }
            _1567(new CommandNotification(_loc18_,{
               "uvObj":_loc12_,
               "ffdObj":_loc17_
            }));
         }
         else
         {
            _1567(new CommandNotification(CommandNotification.MODIFY_VERTEX,_loc12_));
         }
         if(_4210)
         {
            _4210._11663 = true;
         }
      }
      
      private function _12654(param1:MouseEvent) : void
      {
         if(Mouse.cursor == _1405.DESKTOP_RESIZE_EW || Mouse.cursor == _1405.DESKTOP_RESIZE_NS || Mouse.cursor == _1405.DESKTOP_RESIZE_NESW || Mouse.cursor == _1405.DESKTOP_RESIZE_NWSE)
         {
            return;
         }
         if(!Shortcut._1677())
         {
            if(_4264)
            {
               if(_11657)
               {
                  this._11664();
               }
               this._4235.x = param1.stageX;
               this._4235.y = param1.stageY;
               this._4355(this._4235.x,this._4235.y);
            }
         }
      }
      
      private function _11666(param1:Point) : Point
      {
         this._4235 = _4211.canvas.globalToLocal(param1);
         if(_11657)
         {
            this._2205 = _4211._2162.clone();
            this._2205.invert();
            this._4235 = this._2205.transformPoint(this._4235);
         }
         return this._4235.clone();
      }
      
      private function _11677(param1:Point) : Point
      {
         return _654._11665(this._11674,this._11676,param1);
      }
      
      private function _11675(param1:Point) : Point
      {
         return _654._11665(this._11676,this._11674,param1);
      }
      
      private function _4362(param1:Number, param2:Number, param3:Vector.<_661>, param4:Array, param5:Array) : Boolean
      {
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:_661 = null;
         var _loc6_:Vector.<_661> = new Vector.<_661>();
         var _loc7_:Vector.<_661> = new Vector.<_661>();
         var _loc8_:Array = [];
         var _loc9_:Array = [];
         var _loc14_:Point = new Point();
         var _loc15_:Point = new Point();
         var _loc16_:Point = new Point();
         var _loc17_:Point = new Point();
         _loc10_ = 0;
         _loc11_ = int(_2123.outline.length);
         while(_loc10_ < _loc11_)
         {
            _loc18_ = int(param3.indexOf(_2123.outline[_loc10_]));
            if(_loc18_ != -1)
            {
               _loc6_.push(_2123.outline[_loc10_],_2123.outline[_loc10_ + 1]);
               _loc8_.push(param4[_loc18_]);
               _loc9_.push(param5[_loc18_]);
               _loc18_ = int(param3.indexOf(_2123.outline[_loc10_ + 1]));
               if(_loc18_ != -1)
               {
                  _loc8_.push(param4[_loc18_]);
                  _loc9_.push(param5[_loc18_]);
               }
               else
               {
                  _loc8_.push(_2123.outline[_loc10_ + 1].x);
                  _loc9_.push(_2123.outline[_loc10_ + 1].y);
               }
            }
            else
            {
               _loc18_ = int(param3.indexOf(_2123.outline[_loc10_ + 1]));
               if(_loc18_ != -1)
               {
                  _loc6_.push(_2123.outline[_loc10_ + 1],_2123.outline[_loc10_]);
                  _loc8_.push(param4[_loc18_]);
                  _loc9_.push(param5[_loc18_]);
                  _loc18_ = int(param3.indexOf(_2123.outline[_loc10_]));
                  if(_loc18_ != -1)
                  {
                     _loc8_.push(param4[_loc18_]);
                     _loc9_.push(param5[_loc18_]);
                  }
                  else
                  {
                     _loc8_.push(_2123.outline[_loc10_].x);
                     _loc9_.push(_2123.outline[_loc10_].y);
                  }
               }
               else
               {
                  _loc7_.push(_2123.outline[_loc10_],_2123.outline[_loc10_ + 1]);
               }
            }
            _loc10_ += 2;
         }
         _loc10_ = 0;
         _loc11_ = int(_2123.userEdges.length);
         while(_loc10_ < _loc11_)
         {
            _loc18_ = int(param3.indexOf(_2123.userEdges[_loc10_]));
            if(_loc18_ != -1)
            {
               _loc6_.push(_2123.userEdges[_loc10_],_2123.userEdges[_loc10_ + 1]);
               _loc8_.push(param4[_loc18_]);
               _loc9_.push(param5[_loc18_]);
               _loc18_ = int(param3.indexOf(_2123.userEdges[_loc10_ + 1]));
               if(_loc18_ != -1)
               {
                  _loc8_.push(param4[_loc18_]);
                  _loc9_.push(param5[_loc18_]);
               }
               else
               {
                  _loc8_.push(_2123.userEdges[_loc10_ + 1].x);
                  _loc9_.push(_2123.userEdges[_loc10_ + 1].y);
               }
            }
            else
            {
               _loc18_ = int(param3.indexOf(_2123.userEdges[_loc10_ + 1]));
               if(_loc18_ != -1)
               {
                  _loc6_.push(_2123.userEdges[_loc10_ + 1],_2123.userEdges[_loc10_]);
                  _loc8_.push(param4[_loc18_]);
                  _loc9_.push(param5[_loc18_]);
                  _loc18_ = int(param3.indexOf(_2123.userEdges[_loc10_]));
                  if(_loc18_ != -1)
                  {
                     _loc8_.push(param4[_loc18_]);
                     _loc9_.push(param5[_loc18_]);
                  }
                  else
                  {
                     _loc8_.push(_2123.userEdges[_loc10_].x);
                     _loc9_.push(_2123.userEdges[_loc10_].y);
                  }
               }
               else
               {
                  _loc7_.push(_2123.userEdges[_loc10_],_2123.userEdges[_loc10_ + 1]);
               }
            }
            _loc10_ += 2;
         }
         _loc10_ = 0;
         _loc11_ = int(_loc6_.length);
         if(_loc11_ <= 0)
         {
            return false;
         }
         while(_loc10_ < _loc11_)
         {
            _loc19_ = _loc6_[_loc10_];
            _loc14_.x = _loc8_[_loc10_] + param1;
            _loc14_.y = _loc9_[_loc10_] + param2;
            _loc19_ = _loc6_[_loc10_ + 1];
            if(param3.indexOf(_loc19_) == -1)
            {
               _loc15_.x = _loc19_.x;
               _loc15_.y = _loc19_.y;
            }
            else
            {
               _loc15_.x = _loc8_[_loc10_ + 1] + param1;
               _loc15_.y = _loc9_[_loc10_ + 1] + param2;
            }
            _loc12_ = 0;
            _loc13_ = int(_loc7_.length);
            while(_loc12_ < _loc13_)
            {
               _loc16_.x = _loc7_[_loc12_].x;
               _loc16_.y = _loc7_[_loc12_].y;
               _loc17_.x = _loc7_[_loc12_ + 1].x;
               _loc17_.y = _loc7_[_loc12_ + 1].y;
               if(_654.cross2(_loc14_,_loc15_,_loc16_,_loc17_))
               {
                  return true;
               }
               _loc12_ += 2;
            }
            _loc10_ += 2;
         }
         return false;
      }
      
      private function _4083(param1:MouseEvent) : void
      {
         if(this._4342)
         {
            this._4342 = false;
            _14633 = true;
            _4211.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this._4363);
            _2217._1651();
            if(_4344)
            {
               _4344._4341._4337();
            }
         }
         if(_4210)
         {
            _4210._11663 = false;
         }
         this._12670 = false;
         this._12671 = false;
      }
      
      override public function _4339(param1:_661) : void
      {
         var _loc2_:_661 = null;
         super._4339(param1);
         if(_4264)
         {
            if(_11657)
            {
               _loc2_ = _4210._5706(_4264);
               _4344._1897 = _loc2_;
            }
            else
            {
               _4344._1897 = _4264;
            }
         }
         else
         {
            _4344._1897 = null;
         }
         if(_11657)
         {
            if(_4264)
            {
               this._11664();
            }
         }
      }
      
      private function _11664() : void
      {
         var _loc1_:_655 = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Point = null;
         var _loc5_:Point = null;
         var _loc6_:Point = null;
         var _loc7_:Point = null;
         var _loc8_:_656 = null;
         var _loc9_:_656 = null;
         var _loc10_:_656 = null;
         var _loc11_:Point = null;
         var _loc12_:Point = null;
         var _loc13_:Point = null;
         var _loc14_:Point = null;
         if(_4264)
         {
            _loc2_ = 0;
            _loc3_ = int(_2123.triangles.length);
            while(_loc2_ < _loc3_)
            {
               if(_2123.triangles[_loc2_]._4260 == _4264 || _2123.triangles[_loc2_].bp == _4264 || _2123.triangles[_loc2_].cp == _4264)
               {
                  _loc1_ = _2123.triangles[_loc2_];
                  break;
               }
               _loc2_++;
            }
            if(_loc1_)
            {
               this._11676._4260 = _loc1_._4260.clone() as _656;
               this._11676.bp = _loc1_.bp.clone() as _656;
               this._11676.cp = _loc1_.cp.clone() as _656;
               _loc4_ = new Point(-_2123.maxWidth / 2,-_2123.maxHeight / 2);
               _loc5_ = new Point(_2123.maxWidth / 2,-_2123.maxHeight / 2);
               _loc6_ = new Point(-_2123.maxWidth / 2,_2123.maxHeight / 2);
               _loc7_ = new Point(_2123.maxWidth / 2,_2123.maxHeight / 2);
               _loc8_ = _2123._3183(_loc1_._4260);
               _loc9_ = _2123._3183(_loc1_.bp);
               _loc10_ = _2123._3183(_loc1_.cp);
               _loc8_ = _loc8_.clone() as _656;
               _loc9_ = _loc9_.clone() as _656;
               _loc10_ = _loc10_.clone() as _656;
               _loc11_ = _654._4257(this._11676._4260,this._11676.bp,this._11676.cp,_loc4_,_loc8_,_loc9_,_loc10_);
               _loc12_ = _654._4257(this._11676._4260,this._11676.bp,this._11676.cp,_loc5_,_loc8_,_loc9_,_loc10_);
               _loc13_ = _654._4257(this._11676._4260,this._11676.bp,this._11676.cp,_loc6_,_loc8_,_loc9_,_loc10_);
               _loc14_ = _654._4257(this._11676._4260,this._11676.bp,this._11676.cp,_loc7_,_loc8_,_loc9_,_loc10_);
               if(this._11674 == null)
               {
                  this._11674 = new _655(_loc8_,_loc9_,_loc10_);
               }
               else
               {
                  this._11674._4260 = _loc8_;
                  this._11674.bp = _loc9_;
                  this._11674.cp = _loc10_;
               }
               _4210._11669.length = 0;
               _4210._11669.push(_loc11_);
               _4210._11669.push(_loc12_);
               _4210._11669.push(_loc14_);
               _4210._11669.push(_loc13_);
            }
         }
      }
      
      public function set _4313(param1:_887) : void
      {
         _4344 = param1;
      }
      
      override public function _3173() : void
      {
         _4344._1751();
         super._3173();
      }
      
      override public function set _11662(param1:Boolean) : void
      {
         super._11662 = param1;
         if(_4264)
         {
            this._4339(_4264);
         }
      }
   }
}

