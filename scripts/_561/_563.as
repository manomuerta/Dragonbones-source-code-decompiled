package _561
{
   import _51._79;
   import _652._654;
   import _652._655;
   import _652._656;
   import _658._659;
   import _658._661;
   import _658._662;
   import _783.CommandNotification;
   import _877._886;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class _563 extends _567
   {
      private var _4225:_886;
      
      private var _4235:Point;
      
      private var _4256:Boolean;
      
      private var _4258:Boolean;
      
      private var _4259:Boolean;
      
      private var _4243:Vector.<_661>;
      
      private var _4075:Boolean;
      
      private var _4214:_661;
      
      private var _4215:_661;
      
      private var _4212:_661;
      
      private var _4247:Point;
      
      public function _563()
      {
         this.HELP_VERTEX = new _661(0,0,uint.MAX_VALUE);
         super();
         this._4235 = new Point();
         this._4243 = new Vector.<_661>(2);
         this._4247 = new Point();
      }
      
      public function set _4229(param1:_886) : void
      {
         this._4225 = param1;
         this._4225.visible = _2123 != null;
      }
      
      override protected function dispose() : void
      {
         if(this._4225)
         {
            this._4225.visible = false;
         }
         _4210._4209 = null;
         _4210._4208(null,null);
         this._4075 = false;
         this._4214 = null;
         this._4215 = null;
         this._4212 = null;
         super.dispose();
      }
      
      override public function update() : void
      {
         if(Boolean(_4211) && Boolean(_4211.stage))
         {
            this._4228(_4211.stage.mouseX,_4211.stage.mouseY);
         }
      }
      
      override public function _4242(param1:_659, param2:_79) : void
      {
         super._4242(param1,param2);
         if(this._4225)
         {
            this._4225.visible = _2123 != null;
         }
      }
      
      override protected function _4205() : void
      {
         _4211.stage.removeEventListener(MouseEvent.MOUSE_UP,this._4083);
         _4211.stage.removeEventListener(MouseEvent.MOUSE_DOWN,this._4063);
         _4211.removeEventListener(MouseEvent.ROLL_OVER,this._4233);
         _4211.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
      }
      
      override protected function _1576() : void
      {
         _4211.stage.addEventListener(MouseEvent.MOUSE_DOWN,this._4063);
         _4211.addEventListener(MouseEvent.ROLL_OVER,this._4233);
         _4211.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
      }
      
      override public function set _4230(param1:Boolean) : void
      {
         super._4230 = param1;
         if(param1)
         {
            this._4225.visible = false;
         }
         else
         {
            this._4228(_4211.stage.mouseX,_4211.stage.mouseY);
         }
      }
      
      override public function set scale(param1:Number) : void
      {
         this._4230 = false;
      }
      
      private function _4237(param1:MouseEvent) : void
      {
         this._4225.visible = false;
         if(_4210)
         {
            _4210._4209 = null;
            _4210._4231(null,null);
         }
      }
      
      private function _4233(param1:MouseEvent) : void
      {
         if(_4220)
         {
            return;
         }
      }
      
      private function _4063(param1:MouseEvent) : void
      {
         if(_4220)
         {
            return;
         }
         this._4075 = true;
         _4211.stage.addEventListener(MouseEvent.MOUSE_UP,this._4083);
         if(!this._4259 && this._4225.visible)
         {
            this._4254(this._4247.x,this._4247.y);
         }
         else if(this._4225.visible && this._4259)
         {
            this._4214 = _4210._4209;
         }
      }
      
      private function onMouseMove(param1:MouseEvent) : void
      {
         if(_4220)
         {
            return;
         }
         this._4228(param1.stageX,param1.stageY);
      }
      
      private function _4228(param1:Number, param2:Number) : void
      {
         var _loc5_:Vector.<_661> = null;
         this._4235.x = param1;
         this._4235.y = param2;
         this._4235 = this._4225.parent.globalToLocal(this._4235);
         this._4225.x = this._4235.x;
         this._4225.y = this._4235.y;
         this._4235.x = param1;
         this._4235.y = param2;
         this._4235 = _4211.globalToLocal(this._4235);
         this._4225.visible = true;
         this._4258 = false;
         this._4256 = false;
         this._4259 = false;
         this._4243[0] = null;
         this._4243[1] = null;
         var _loc3_:Number = this._4235.x;
         var _loc4_:Number = this._4235.y;
         this._4247.x = _loc3_;
         this._4247.y = _loc4_;
         var _loc6_:_661 = _4206(_loc3_,_loc4_);
         if(_loc6_)
         {
            this._4232(_loc6_);
         }
         else
         {
            _loc5_ = _4217(_loc3_,_loc4_);
            if((Boolean(_loc5_)) && _loc5_.length == 2)
            {
               this._4241(_loc3_,_loc4_,_loc5_,true,false);
            }
            else
            {
               _loc5_ = _4245(_loc3_,_loc4_);
               if((Boolean(_loc5_)) && _loc5_.length == 2)
               {
                  this._4241(_loc3_,_loc4_,_loc5_,false,true);
               }
               else
               {
                  this._4225.visible = _654._4252(this._4235,Vector.<_656>(_2123.outline));
                  _4210._4209 = null;
                  _4210._4231(null,null);
               }
            }
         }
         if(this._4075)
         {
            if(this._4214 != null)
            {
               this._4215 = _loc6_;
               if(this._4212 == null)
               {
                  this._4212 = this.HELP_VERTEX;
               }
               this._4212.x = this._4247.x;
               this._4212.y = this._4247.y;
               if(this._3188())
               {
                  this._4215 = null;
                  _4210._4208(null,null);
                  this._4225.visible = false;
                  this._4212 = null;
               }
               else
               {
                  _4210._4208(this._4214,this._4212);
               }
               _4210._2466();
            }
         }
         if(!this._4225.visible)
         {
            _4210._4208(null,null);
            _4210._4209 = null;
            _4210._4231(null,null);
         }
      }
      
      private function _4232(param1:_661) : void
      {
         _4210._4209 = param1;
         _4210._4231(null,null);
         this._4235.x = param1.x;
         this._4235.y = param1.y;
         this._4247.x = this._4235.x;
         this._4247.y = this._4235.y;
         this._4235 = _4211.localToGlobal(this._4235);
         this._4235 = this._4225.parent.globalToLocal(this._4235);
         this._4225.x = this._4235.x;
         this._4225.y = this._4235.y;
         this._4259 = true;
      }
      
      private function _4241(param1:Number, param2:Number, param3:Vector.<_661>, param4:Boolean, param5:Boolean) : void
      {
         _4210._4209 = null;
         _4210._4231(param3[0],param3[1]);
         var _loc6_:Array = _654._4219(param1,param2,param3[0].x,param3[0].y,param3[1].x,param3[1].y);
         if(_loc6_)
         {
            this._4243[0] = param3[0];
            this._4243[1] = param3[1];
            this._4235.x = _loc6_[0];
            this._4235.y = _loc6_[1];
            this._4247.x = this._4235.x;
            this._4247.y = this._4235.y;
            this._4235 = _4211.localToGlobal(this._4235);
            this._4235 = this._4225.parent.globalToLocal(this._4235);
            this._4225.x = this._4235.x;
            this._4225.y = this._4235.y;
            this._4256 = param5;
            this._4258 = param4;
         }
      }
      
      private function _4083(param1:MouseEvent) : void
      {
         if(_4211.stage)
         {
            _4211.stage.removeEventListener(MouseEvent.MOUSE_UP,this._4083);
         }
         this._4075 = false;
         if(this._4212)
         {
            _4210._4208(null,null);
         }
         if(Boolean(this._4225) && this._4225.visible)
         {
            if(this._4215 == null && this._4212 != null)
            {
               this._4255(this._4212.x,this._4212.y);
            }
            if(Boolean(this._4214) && Boolean(this._4215) && this._4214 != this._4215)
            {
               if(!this._4207())
               {
                  _1567(new CommandNotification(CommandNotification.ADD_EDGE,{
                     "_1837":_4213,
                     "mesh":_2123,
                     "v0":this._4214,
                     "v1":this._4215
                  }));
               }
            }
         }
         this._4214 = null;
         this._4215 = null;
         this._4212 = null;
         this._4228(param1.stageX,param1.stageY);
         _2217._1651();
      }
      
      private function _4255(param1:Number, param2:Number) : void
      {
         var _loc3_:_661 = this._4248(param1,param2);
         this._4215 = _loc3_;
      }
      
      private function _4254(param1:Number, param2:Number) : void
      {
         var _loc3_:_661 = this._4248(param1,param2);
         this._4214 = _loc3_;
      }
      
      private function _4248(param1:Number, param2:Number) : _661
      {
         var _loc6_:Point = null;
         var _loc7_:_662 = null;
         var _loc8_:_661 = null;
         var _loc9_:_661 = null;
         var _loc10_:_655 = null;
         var _loc11_:_661 = null;
         var _loc12_:_661 = null;
         var _loc13_:_661 = null;
         if(_2123 == null || this._4243 == null)
         {
            return null;
         }
         var _loc3_:_661 = _2123._1750(param1,param2);
         var _loc4_:Vector.<_661> = this._4243.concat();
         var _loc5_:_661 = _loc3_.clone() as _661;
         if(this._4256 || this._4258)
         {
            _loc8_ = _2123._3183(_loc4_[0]);
            _loc9_ = _2123._3183(_loc4_[1]);
            _loc6_ = _654._4250(_loc4_[0],_loc4_[1],_loc3_,_loc8_,_loc9_);
            _loc5_.x = _loc6_.x;
            _loc5_.y = _loc6_.y;
         }
         else
         {
            _loc10_ = this._4246(_loc3_);
            if(_loc10_ == null)
            {
               return null;
            }
            _loc11_ = _2123._3183(_loc10_._4260);
            _loc12_ = _2123._3183(_loc10_.bp);
            _loc13_ = _2123._3183(_loc10_.cp);
            _loc6_ = _654._4257(_loc10_._4260,_loc10_.bp,_loc10_.cp,_loc3_,_loc11_,_loc12_,_loc13_);
            _loc5_.x = _loc6_.x;
            _loc5_.y = _loc6_.y;
            if(_2123._2119())
            {
               _loc7_ = _2123._4251(_loc5_);
               _loc5_.x = _loc7_._4253.x;
               _loc5_.y = _loc7_._4253.y;
            }
         }
         _1567(new CommandNotification(CommandNotification.ADD_VERTEX,{
            "_1837":_4213,
            "mesh":_2123,
            "vertex":_loc3_,
            "_3169":_loc5_,
            "onUserEdge":this._4256,
            "edge":_loc4_,
            "_3168":this._4258,
            "addRig":_loc7_
         }));
         return _loc3_;
      }
      
      private function _4246(param1:_661) : _655
      {
         var _loc2_:int = 0;
         var _loc3_:int = int(_2123.triangles.length);
         while(_loc2_ < _loc3_)
         {
            if(_654._4249(param1,_2123.triangles[_loc2_]))
            {
               return _2123.triangles[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      private function _3188() : Boolean
      {
         var _loc1_:_661 = null;
         var _loc2_:_661 = null;
         var _loc3_:int = 0;
         var _loc4_:int = int(_2123.userEdges.length);
         while(_loc3_ < _loc4_)
         {
            _loc1_ = _2123.userEdges[_loc3_];
            _loc2_ = _2123.userEdges[_loc3_ + 1];
            if(!(_loc1_ == this._4243[0] && _loc2_ == this._4243[1] || _loc1_ == this._4243[1] && _loc2_ == this._4243[0]))
            {
               if(this._4214.equals(_loc1_) && this._4212.equals(_loc2_) || this._4214.equals(_loc2_) && this._4212.equals(_loc1_))
               {
                  return true;
               }
               if(_654.cross2(_loc1_,_loc2_,this._4214,this._4212))
               {
                  return true;
               }
            }
            _loc3_ += 2;
         }
         return false;
      }
      
      private function _4207() : Boolean
      {
         var _loc1_:_661 = null;
         var _loc2_:_661 = null;
         var _loc3_:int = 0;
         var _loc4_:int = int(_2123.outline.length);
         while(_loc3_ < _loc4_)
         {
            _loc1_ = _2123.outline[_loc3_];
            _loc2_ = _2123.outline[_loc3_ + 1];
            if(this._4214.id == _loc1_.id && this._4215.id == _loc2_.id || this._4214.id == _loc2_.id && this._4215.id == _loc1_.id)
            {
               return true;
            }
            _loc3_ += 2;
         }
         return false;
      }
   }
}

