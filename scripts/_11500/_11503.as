package _11500
{
   import _13._12;
   import _13._14;
   import _652._654;
   import _658._661;
   import _783.CommandNotification;
   import _783.MeshNotification;
   import _877._885;
   import _877._886;
   import _877._887;
   import _953._956;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class _11503 extends _11501
   {
      public static const NEAREST_RANGE:int = 10;
      
      private var _4225:_886;
      
      private var _4235:Point;
      
      private var _4243:Vector.<_661>;
      
      private var _4227:_661;
      
      private var _4234:_661;
      
      private var _4224:Vector.<_661>;
      
      private var _end:Boolean;
      
      private var _4223:_661;
      
      private var _4342:Boolean;
      
      private var _4264:_661;
      
      private var _5708:_661;
      
      private var _11668:Point;
      
      private var _11672:Point;
      
      private var _12667:Array;
      
      private var _12666:Array;
      
      private var _3822:Vector.<_661>;
      
      private var _12655:Point;
      
      private var _12665:Boolean;
      
      private var _12664:Boolean;
      
      private var _12662:Point;
      
      public function _11503()
      {
         this.HELP_VERTEX = new _661(0,0,uint.MAX_VALUE - 1);
         super();
         this._4235 = new Point();
         this._4243 = new Vector.<_661>(2);
         this._4224 = new Vector.<_661>();
         this._11668 = new Point();
         this._11672 = new Point();
         this._12655 = new Point();
         this._12662 = new Point();
         this._12667 = [];
         this._12666 = [];
         this._3822 = new Vector.<_661>();
      }
      
      override public function _4906(param1:_885, param2:_956, param3:_887) : void
      {
         super._4906(param1,param2,param3);
         this._4229 = param1._4324;
      }
      
      public function set _4229(param1:_886) : void
      {
         this._4225 = param1;
         this._4225.visible = _2123 != null;
      }
      
      override protected function dispose() : void
      {
         if(!this._end)
         {
            this._end = true;
            if(_2123.vertices.length < 3)
            {
               _2217._1650();
            }
            else
            {
               _1567(new CommandNotification(CommandNotification.END_ADD_OUTLINE,{
                  "_1837":_4213,
                  "mesh":_2123,
                  "_3174":this._4234
               }));
               _2217._1652();
            }
            this._4234 = null;
         }
         if(this._4225)
         {
            this._4225.visible = false;
         }
         if(_4210)
         {
            _4210._4208(null,null);
            _4210._4226(null,null);
         }
         super.dispose();
      }
      
      override protected function init() : void
      {
         this._end = false;
         this._4223 = null;
         _2217._3792();
         _1567(new CommandNotification(CommandNotification.START_ADD_OUTLINE,{
            "_1837":_4213,
            "mesh":_2123
         }));
      }
      
      override protected function _4205() : void
      {
         super._4205();
         _1564(CommandNotification.SHOW_CLOSE_PROJECT_CONFIRMATION_DIALOG,this._4236);
         if(_4211)
         {
            _4211.removeEventListener(MouseEvent.ROLL_OVER,this._4233);
            _4211.removeEventListener(MouseEvent.ROLL_OUT,this._4237);
            if(_5097)
            {
               _5097.removeEventListener(MouseEvent.MOUSE_DOWN,this._4063);
            }
            if(_4211.stage)
            {
               _4211.stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
               _4211.stage.removeEventListener(MouseEvent.MOUSE_UP,this._4083);
            }
         }
      }
      
      override protected function _1576() : void
      {
         super._1576();
         _1565(CommandNotification.SHOW_CLOSE_PROJECT_CONFIRMATION_DIALOG,this._4236,100);
         if(_5097)
         {
            _5097.addEventListener(MouseEvent.MOUSE_DOWN,this._4063,false,1000);
         }
         _4211.addEventListener(MouseEvent.ROLL_OVER,this._4233);
         _4211.addEventListener(MouseEvent.ROLL_OUT,this._4237);
         _4211.stage.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         _4211.stage.addEventListener(MouseEvent.MOUSE_UP,this._4083);
      }
      
      private function _4083(param1:MouseEvent) : void
      {
         this._5708 = null;
         this._4264 = null;
         this._3822.length = 0;
         this._4342 = false;
         if(this._12665 && this._4225.visible)
         {
            if(Math.abs(this._12655.x - this._4225.x) + Math.abs(this._12655.y - this._4225.y) <= 5)
            {
               this._4235.x = this._4225.x;
               this._4235.y = this._4225.y;
               this._4235 = this._4225.parent.localToGlobal(this._4235);
               this._4235 = _4211.canvas.globalToLocal(this._4235);
               this._4221(this._4235.x,this._4235.y);
            }
         }
      }
      
      private function _4236(param1:CommandNotification) : void
      {
         _1567(new MeshNotification(MeshNotification.END_ADD_OUTLINE));
      }
      
      private function _4237(param1:MouseEvent) : void
      {
         this._4225.visible = false;
      }
      
      private function _4233(param1:MouseEvent) : void
      {
         this._4225.visible = true;
      }
      
      private function _4063(param1:MouseEvent) : void
      {
         this._12665 = false;
         if(_4239)
         {
            if(_4239)
            {
               _1567(new MeshNotification(MeshNotification.END_ADD_OUTLINE));
            }
            return;
         }
         if(this._4225.visible)
         {
            this._12655.x = this._4225.x;
            this._12655.y = this._4225.y;
            this._12665 = true;
         }
         if(this._5708)
         {
            this._4342 = true;
            this._4264 = this._5708;
            this._3822.push(this._4264);
            if(this._12664)
            {
               this._11668.x = this._12662.x;
               this._11668.y = this._12662.y;
            }
            else
            {
               this._11668.x = this._4235.x;
               this._11668.y = this._4235.y;
            }
            this._4355(this._11668.x,this._11668.y);
         }
      }
      
      private function onMouseMove(param1:MouseEvent) : void
      {
         this._4228(param1.stageX,param1.stageY);
      }
      
      private function _4228(param1:Number, param2:Number) : void
      {
         var _loc5_:Vector.<_661> = null;
         var _loc6_:_661 = null;
         this._4235.x = param1;
         this._4235.y = param2;
         this._4235 = _4211.canvas.globalToLocal(this._4235);
         if(this._4235.x < -_4210.width / 2)
         {
            this._4235.x = -_4210.width / 2;
         }
         else if(this._4235.x > _4210.width / 2)
         {
            this._4235.x = _4210.width / 2;
         }
         if(this._4235.y < -_4210.height / 2)
         {
            this._4235.y = -_4210.height / 2;
         }
         else if(this._4235.y > _4210.height / 2)
         {
            this._4235.y = _4210.height / 2;
         }
         var _loc3_:Number = this._4235.x;
         var _loc4_:Number = this._4235.y;
         this._4235 = _4211.canvas.localToGlobal(this._4235);
         this._4235 = this._4225.parent.globalToLocal(this._4235);
         this._4225.x = this._4235.x;
         this._4225.y = this._4235.y;
         this._4235.x = _loc3_;
         this._4235.y = _loc4_;
         if(this._4342)
         {
            this._11672.x = _loc3_;
            this._11672.y = _loc4_;
            this.moveFrame(this._11672.x - this._11668.x,this._11672.y - this._11668.y);
            if(this._4223)
            {
               this.HELP_VERTEX.x = _loc3_;
               this.HELP_VERTEX.y = _loc4_;
               _4210._4226(this._4223,this.HELP_VERTEX);
            }
            _4210._4231(null,null);
            _4210._4208(null,null);
            _4210._4226(null,null);
            this._4225.visible = false;
         }
         else
         {
            this._12664 = false;
            this._5708 = null;
            _loc5_ = _4217(_loc3_,_loc4_);
            if(_loc5_)
            {
               if(_loc5_.length == 1)
               {
                  _loc6_ = _loc5_[0];
               }
               else if(_2123.outline.length >= 4 && this._12663(_loc3_,_loc4_,this._4223.x,this._4223.y))
               {
                  _loc6_ = this._4223;
                  _loc5_.length = 0;
               }
            }
            if(_loc6_ == null)
            {
               if(_loc5_ != null && _loc5_.length == 2)
               {
                  this._4225.visible = true;
               }
               else
               {
                  this._4225.visible = !this._4218();
               }
            }
            else if(_loc6_ == _2123.vertices[0] && _2123.outline.length >= 4)
            {
               this._4225.visible = true;
               this._5708 = _loc6_;
               this._12664 = true;
               this._12662.x = this._4235.x;
               this._12662.y = this._4235.y;
            }
            else
            {
               this._4225.visible = false;
               _4210._4209 = _loc6_;
               this._5708 = _loc6_;
            }
            this._4227 = null;
            this._4243[0] = null;
            this._4243[1] = null;
            if(this._4225.visible)
            {
               if(_loc6_)
               {
                  this._4232(_loc6_);
               }
               else if(Boolean(_loc5_) && _loc5_.length == 2)
               {
                  this._4241(_loc3_,_loc4_,_loc5_);
               }
               else
               {
                  _4210._4209 = null;
                  _4210._4231(null,null);
                  this.HELP_VERTEX.x = _loc3_;
                  this.HELP_VERTEX.y = _loc4_;
               }
               if(this._4223)
               {
                  _4210._4226(this._4223,this.HELP_VERTEX);
               }
               if(Boolean(this._4234) && this._4243[0] == null)
               {
                  _4210._4208(this._4234,this.HELP_VERTEX);
               }
               else
               {
                  _4210._4208(null,null);
                  _4210._4226(this._4223,this._4234);
               }
               _4210._2466();
            }
            else
            {
               if(this._5708 == null)
               {
                  _4210._4209 = null;
               }
               this.HELP_VERTEX.x = this._4235.x;
               this.HELP_VERTEX.y = this._4235.y;
               _4210._4231(null,null);
               _4210._4208(null,null);
               _4210._4226(null,null);
            }
         }
         this._4222();
      }
      
      private function _4222() : void
      {
         if(this._4227 && _2123.outline.length >= 4 && this._4227 == _2123.vertices[0])
         {
            if(this._4342)
            {
               _14.setCursor(_12.CURSOR_MOVE);
            }
            else
            {
               _14.setCursor(_12.CURSOR_MESH_OUTLINE_END);
            }
         }
         else if(this._5708 != null)
         {
            _14.setCursor(_12.CURSOR_MOVE);
         }
         else
         {
            _14.setCursor(_12.CURSOR_MESH_OUTLINE);
         }
      }
      
      private function _4218() : Boolean
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(this._4234 != null)
         {
            _loc1_ = 0;
            _loc2_ = int(_2123.outline.length);
            while(_loc1_ < _loc2_)
            {
               if(_654.cross2(this._4234,this.HELP_VERTEX,_2123.outline[_loc1_],_2123.outline[_loc1_ + 1]))
               {
                  return true;
               }
               _loc1_ += 2;
            }
         }
         return false;
      }
      
      private function _12663(param1:Number, param2:Number, param3:Number, param4:Number) : Boolean
      {
         var _loc5_:Number = NEAREST_RANGE / _4210.scale;
         _loc5_ *= _loc5_;
         if((param1 - param3) * (param1 - param3) + (param2 - param4) * (param2 - param4) < _loc5_)
         {
            return true;
         }
         return false;
      }
      
      private function _4232(param1:_661) : void
      {
         this._4227 = param1;
         _4210._4209 = param1;
         _4210._4231(null,null);
         this._4235.x = param1.x;
         this._4235.y = param1.y;
         this._4235 = _4211.canvas.localToGlobal(this._4235);
         this._4235 = this._4225.parent.globalToLocal(this._4235);
         this._4225.x = this._4235.x;
         this._4225.y = this._4235.y;
         this.HELP_VERTEX.x = param1.x;
         this.HELP_VERTEX.y = param1.y;
      }
      
      private function _4241(param1:Number, param2:Number, param3:Vector.<_661>) : void
      {
         _4210._4209 = null;
         _4210._4231(param3[0],param3[1]);
         var _loc4_:Array = _654._4219(param1,param2,param3[0].x,param3[0].y,param3[1].x,param3[1].y);
         if(_loc4_)
         {
            this._4243[0] = param3[0];
            this._4243[1] = param3[1];
            this._4235.x = _loc4_[0];
            this._4235.y = _loc4_[1];
            this._4235 = _4211.canvas.localToGlobal(this._4235);
            this._4235 = this._4225.parent.globalToLocal(this._4235);
            this._4225.x = this._4235.x;
            this._4225.y = this._4235.y;
            this.HELP_VERTEX.x = _loc4_[0];
            this.HELP_VERTEX.y = _loc4_[1];
         }
      }
      
      private function _4221(param1:Number, param2:Number) : void
      {
         var _loc3_:_661 = null;
         var _loc4_:_661 = null;
         var _loc5_:Vector.<_661> = null;
         if(this._4227 && _2123.outline.length >= 4 && this._4227 == _2123.vertices[0])
         {
            this._end = true;
            _1567(new CommandNotification(CommandNotification.END_ADD_OUTLINE,{
               "_1837":_4213,
               "mesh":_2123,
               "_3174":this._4234
            }));
            this._4234 = null;
            _2217._1652();
         }
         else if(!this._4227)
         {
            _loc3_ = _2123._1750(param1,param2);
            _loc4_ = _loc3_.clone() as _661;
            _loc5_ = this._4243.concat();
            _1567(new CommandNotification(CommandNotification.ADD_OUTLINE_VERTEX,{
               "_1837":_4213,
               "mesh":_2123,
               "vertex":_loc3_,
               "_3169":_loc4_,
               "edge":_loc5_,
               "_3174":this._4234
            }));
            if(_loc5_ == null || _loc5_[0] == null)
            {
               this._4234 = _loc3_;
            }
            if(this._4223 == null)
            {
               this._4223 = _loc3_;
            }
         }
      }
      
      public function execute(param1:_661, param2:_661) : void
      {
         if(param2)
         {
            this._4234 = param2;
         }
         this._4224.push(param1);
         this._4228(_4211.stage.mouseX,_4211.stage.mouseY);
      }
      
      public function revert() : void
      {
         this._4234 = this._4224.pop();
         this._4228(_4211.stage.mouseX,_4211.stage.mouseY);
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
      
      private function _4355(param1:Number, param2:Number) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:_661 = null;
         if(!this._4342)
         {
            this._4342 = true;
         }
         this._12667.length = 0;
         this._12666.length = 0;
         this._12667.push(this._4264.x);
         this._12666.push(this._4264.y);
      }
      
      private function moveFrame(param1:Number, param2:Number) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:_661 = null;
         var _loc7_:int = 0;
         var _loc8_:Boolean = false;
         var _loc6_:int = 0;
         var _loc9_:Number = 1;
         if(this._4264 == null)
         {
            return;
         }
         _loc5_ = this._4264;
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
            if(this._4362(param1,param2,this._3822,this._12667,this._12666))
            {
               param1 = 0;
               param2 = 0;
               return;
            }
         }
         var _loc10_:Array = [];
         var _loc11_:Array = [];
         _loc6_ = 0;
         _loc10_.push(this._12667[_loc6_] + param1);
         _loc11_.push(this._12666[_loc6_] + param2);
         if(this._4264 == null)
         {
            return;
         }
         var _loc12_:Object = {
            "vertex":this._4264,
            "vertices":this._3822.concat(),
            "mesh":_2123,
            "_1837":_4213,
            "_3192":_loc10_.concat(),
            "_3191":_loc11_.concat(),
            "_3147":this._12667.concat(),
            "_3146":this._12666.concat()
         };
         _1567(new CommandNotification(CommandNotification.MODIFY_OUTLINE_VERTEX,_loc12_));
      }
   }
}

