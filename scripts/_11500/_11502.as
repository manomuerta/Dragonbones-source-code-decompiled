package _11500
{
   import _13._12;
   import _13._14;
   import _1404._1407;
   import _472._623;
   import _652._654;
   import _652._655;
   import _652._656;
   import _658._661;
   import _708._717;
   import _783.CommandNotification;
   import egret.utils.tr;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class _11502 extends _14073
   {
      private var _4235:Point;
      
      private var _4267:Vector.<_661>;
      
      private var _12641:Vector.<_661>;
      
      public function _11502()
      {
         super();
         this._4235 = new Point();
         this._4267 = new Vector.<_661>(2);
         this._12641 = new Vector.<_661>();
         _14630 = false;
      }
      
      override public function start() : void
      {
         super.start();
         _14.setCursor(_12.CURSOR_MESH_DELETE,100);
      }
      
      override public function stop() : void
      {
         super.stop();
         _14._1602(_12.CURSOR_MESH_DELETE);
      }
      
      override protected function dispose() : void
      {
         this._4237(null);
         super.dispose();
      }
      
      override protected function _4205() : void
      {
         super._4205();
         if(_5097)
         {
            _5097.removeEventListener(MouseEvent.MOUSE_DOWN,this._4063);
         }
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         _4211.removeEventListener(MouseEvent.ROLL_OUT,this._4237);
      }
      
      override protected function _1576() : void
      {
         super._1576();
         if(_5097)
         {
            _5097.addEventListener(MouseEvent.MOUSE_DOWN,this._4063,false,1000);
         }
         stage.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         _4211.addEventListener(MouseEvent.ROLL_OUT,this._4237);
      }
      
      private function _4237(param1:MouseEvent) : void
      {
         this._4267[0] = null;
         this._4267[1] = null;
         this._12641.length = 0;
         _4210._4266 = null;
         _4210._4265 = null;
         _4210._12695 = null;
         _4210.invalid = false;
         _4210._2466();
      }
      
      override public function _3173() : void
      {
         _4210._4265 = null;
         _4210._4266 = null;
         _4210._2466();
         super._3173();
      }
      
      override public function _3024() : void
      {
         if(this._4267)
         {
            this._4267[0] = null;
            this._4267[1] = null;
         }
         this._12641.length = 0;
      }
      
      override public function update() : void
      {
         if(Boolean(_4211) && Boolean(_4211.stage))
         {
            this._4228(_4211.stage.mouseX,_4211.stage.mouseY);
         }
      }
      
      private function _4063(param1:MouseEvent) : void
      {
         if(this._12641.length > 0)
         {
            this._14631(this._12641);
         }
         else if(this._4267[0] != null)
         {
            this._4268(this._4267);
         }
      }
      
      private function onMouseMove(param1:MouseEvent) : void
      {
         if(_4350)
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
         this._4235 = _4211.canvas.globalToLocal(this._4235);
         var _loc3_:Number = this._4235.x;
         var _loc4_:Number = this._4235.y;
         var _loc6_:_661 = _4206(_loc3_,_loc4_);
         if(_loc6_)
         {
            this._4232(_loc6_);
         }
         else
         {
            _loc5_ = _4245(_loc3_,_loc4_);
            if(_loc5_)
            {
               this._4241(_loc3_,_loc4_,_loc5_);
            }
            else
            {
               _4210._4266 = null;
               _4210._4265 = null;
               _4210._12695 = null;
               _4210._2466();
               this._4267[0] = null;
               this._12641.length = 0;
            }
         }
      }
      
      private function _4232(param1:_661) : void
      {
         var _loc2_:Vector.<_661> = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Vector.<_661> = null;
         if(_4348._2889.indexOf(param1) != -1 && _2123.vertices.length - _4348._2889.length >= 3)
         {
            _loc2_ = this._13888(Vector.<_661>(_4348._2889));
            _loc5_ = this._14629(Vector.<_661>(_4348._2889));
            _loc2_ = _loc2_.concat(_loc5_);
            _4210._4266 = _loc2_;
            _4210._12695 = Vector.<_661>(_4348._2889.concat());
            _4210._2466();
            this._12641.length = 0;
            _loc3_ = 0;
            _loc4_ = int(_4348._2889.length);
            while(_loc3_ < _loc4_)
            {
               this._12641.push(_4348._2889[_loc3_] as _661);
               _loc3_++;
            }
            this._4267[0] = null;
         }
         else
         {
            _loc2_ = this._4262(param1);
            if(_2123.vertices.length <= 3 && this._3168(param1))
            {
               _loc2_.length = 0;
               param1 = null;
            }
            else
            {
               _loc2_ = _loc2_.concat(this._4261(param1));
            }
            _4210._4266 = _loc2_;
            _4210._4265 = param1;
            _4210._2466();
            this._12641.length = 0;
            this._12641.push(param1);
            this._4267[0] = null;
         }
      }
      
      private function _3168(param1:_661) : Boolean
      {
         return _2123.outline.indexOf(param1) != -1;
      }
      
      private function _13892(param1:Vector.<_661>) : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         _loc2_ = 0;
         _loc3_ = int(param1.length);
         while(_loc2_ < _loc3_)
         {
            if(_2123.outline.indexOf(param1[1]) != -1)
            {
               return true;
            }
            _loc2_++;
         }
         return false;
      }
      
      private function _4241(param1:Number, param2:Number, param3:Vector.<_661>) : void
      {
         _4210._12695 = null;
         _4210._4266 = param3;
         _4210._2466();
         if(param3.length == 2)
         {
            this._4267[0] = param3[0];
            this._4267[1] = param3[1];
         }
         else
         {
            this._4267[0] = null;
            this._4267[1] = null;
         }
         this._12641.length = 0;
      }
      
      private function _4268(param1:Vector.<_661>) : void
      {
         _1567(new CommandNotification(CommandNotification.DELETE_EDGE,{
            "_1837":_4213,
            "mesh":_2123,
            "v0":param1[0],
            "v1":param1[1]
         }));
      }
      
      private function _4261(param1:_661) : Vector.<_661>
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Vector.<_661> = new Vector.<_661>();
         _loc2_ = 0;
         _loc3_ = int(_2123.userEdges.length);
         while(_loc2_ < _loc3_)
         {
            if(_2123.userEdges[_loc2_] == param1 || _2123.userEdges[_loc2_ + 1] == param1)
            {
               _loc4_.push(_2123.userEdges[_loc2_],_2123.userEdges[_loc2_ + 1]);
            }
            _loc2_ += 2;
         }
         return _loc4_;
      }
      
      private function _13888(param1:Vector.<_661>) : Vector.<_661>
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Vector.<_661> = new Vector.<_661>();
         _loc2_ = 0;
         _loc3_ = int(_2123.userEdges.length);
         while(_loc2_ < _loc3_)
         {
            if(param1.indexOf(_2123.userEdges[_loc2_]) >= 0 || param1.indexOf(_2123.userEdges[_loc2_ + 1]) >= 0)
            {
               _loc4_.push(_2123.userEdges[_loc2_],_2123.userEdges[_loc2_ + 1]);
            }
            _loc2_ += 2;
         }
         return _loc4_;
      }
      
      private function _14629(param1:Vector.<_661>) : Vector.<_661>
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Vector.<_661> = new Vector.<_661>();
         _loc2_ = 0;
         _loc3_ = int(_2123.outline.length);
         while(_loc2_ < _loc3_)
         {
            if(param1.indexOf(_2123.outline[_loc2_]) >= 0 || param1.indexOf(_2123.outline[_loc2_ + 1]) >= 0)
            {
               _loc4_.push(_2123.outline[_loc2_],_2123.outline[_loc2_ + 1]);
            }
            _loc2_ += 2;
         }
         return _loc4_;
      }
      
      private function _4262(param1:_661) : Vector.<_661>
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Vector.<_661> = new Vector.<_661>();
         _loc2_ = 0;
         _loc3_ = int(_2123.outline.length);
         while(_loc2_ < _loc3_)
         {
            if(_2123.outline[_loc2_] == param1 || _2123.outline[_loc2_ + 1] == param1)
            {
               _loc4_.push(_2123.outline[_loc2_],_2123.outline[_loc2_ + 1]);
            }
            _loc2_ += 2;
         }
         return _loc4_;
      }
      
      private function _14628(param1:Vector.<_661>) : Vector.<_661>
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Vector.<_661> = new Vector.<_661>();
         _loc2_ = 0;
         _loc3_ = int(param1.length);
         while(_loc2_ < _loc3_)
         {
            if(_2123.outline.indexOf(param1[_loc2_]) >= 0)
            {
               _loc4_.push(param1[_loc2_]);
            }
            _loc2_++;
         }
         return _loc4_;
      }
      
      private function _13887(param1:Vector.<_661>, param2:Vector.<_661>) : Vector.<Vector.<_661>>
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc6_:_661 = null;
         var _loc9_:Vector.<_661> = null;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc5_:Vector.<Vector.<_661>> = new Vector.<Vector.<_661>>();
         var _loc7_:Vector.<_661> = new Vector.<_661>();
         _loc3_ = 0;
         _loc4_ = int(param2.length);
         while(_loc3_ < _loc4_)
         {
            _loc7_.push(param2[_loc3_]);
            _loc3_ += 2;
         }
         var _loc8_:Vector.<_661> = param1.concat();
         _loc6_ = _loc8_[0];
         _loc8_.shift();
         while(_loc6_ != null)
         {
            _loc9_ = new Vector.<_661>();
            _loc3_ = 0;
            _loc4_ = int(_loc7_.length);
            while(_loc3_ < _loc4_)
            {
               if(_loc7_[_loc3_] == _loc6_)
               {
                  _loc10_ = (_loc3_ - 1 + _loc4_) % _loc4_;
                  _loc11_ = (_loc3_ + 1) % _loc4_;
                  _loc9_.push(_loc7_[_loc10_],_loc7_[_loc3_],_loc7_[_loc11_]);
                  break;
               }
               _loc3_++;
            }
            _loc12_ = int(_loc8_.indexOf(_loc9_[0]));
            while(_loc12_ >= 0)
            {
               _loc8_.splice(_loc12_,1);
               _loc10_ = (_loc10_ - 1 + _loc4_) % _loc4_;
               _loc9_.unshift(_loc7_[_loc10_]);
               _loc12_ = int(_loc8_.indexOf(_loc9_[0]));
            }
            _loc13_ = int(_loc8_.indexOf(_loc9_[_loc9_.length - 1]));
            while(_loc13_ >= 0)
            {
               _loc8_.splice(_loc13_,1);
               _loc11_ = (_loc11_ + 1) % _loc4_;
               _loc9_.push(_loc7_[_loc11_]);
               _loc13_ = int(_loc8_.indexOf(_loc9_[_loc9_.length - 1]));
            }
            _loc5_.push(_loc9_);
            if(_loc8_.length > 0)
            {
               _loc6_ = _loc8_[0];
               _loc8_.shift();
            }
            else
            {
               _loc6_ = null;
            }
         }
         return _loc5_;
      }
      
      private function _13891(param1:Vector.<_661>, param2:Vector.<_661>) : Vector.<_661>
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc3_:Vector.<_661> = new Vector.<_661>();
         _loc5_ = 0;
         _loc4_ = int(_2123.outline.length);
         while(_loc5_ < _loc4_)
         {
            if(param1.indexOf(_2123.outline[_loc5_]) == -1 && param1.indexOf(_2123.outline[_loc5_ + 1]) == -1)
            {
               _loc3_.push(_2123.outline[_loc5_],_2123.outline[_loc5_ + 1]);
            }
            _loc5_ += 2;
         }
         _loc5_ = 0;
         _loc4_ = int(param2.length);
         while(_loc5_ < _loc4_)
         {
            _loc3_.push(param2[_loc5_],param2[_loc5_ + 1]);
            _loc5_ += 2;
         }
         return _loc3_;
      }
      
      private function _13890(param1:Vector.<_661>, param2:Vector.<_661>) : Vector.<_661>
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:_661 = null;
         var _loc7_:Boolean = false;
         var _loc9_:_655 = null;
         var _loc10_:Vector.<_661> = null;
         var _loc11_:_661 = null;
         var _loc12_:_661 = null;
         var _loc13_:Vector.<Point> = null;
         var _loc14_:Vector.<_661> = null;
         var _loc3_:Vector.<_661> = new Vector.<_661>();
         if(param1.length - 1 >= _2123.outline.length / 2)
         {
            _loc7_ = true;
            _loc4_ = 0;
            _loc5_ = int(_2123.vertices.length);
            while(_loc4_ < _loc5_)
            {
               _loc6_ = _2123.vertices[_loc4_];
               if(param2.indexOf(_loc6_) == -1)
               {
                  _loc3_.push(_loc6_);
               }
               _loc4_++;
            }
         }
         else if(param1.length == 3)
         {
            _loc9_ = new _655(param1[0],param1[1],param1[2]);
            _loc4_ = 0;
            _loc5_ = int(_2123.vertices.length);
            while(_loc4_ < _loc5_)
            {
               _loc6_ = _2123.vertices[_loc4_];
               if(param1.indexOf(_loc6_) == -1 && param2.indexOf(_loc6_) == -1 && _2123.outline.indexOf(_loc6_) == -1)
               {
                  if(_654._4249(_loc6_,_loc9_))
                  {
                     _loc3_.push(_loc6_);
                  }
               }
               _loc4_++;
            }
         }
         else
         {
            _loc10_ = this._13886(param1);
            _loc4_ = 0;
            _loc5_ = int(_2123.vertices.length);
            while(_loc4_ < _loc5_)
            {
               _loc6_ = _2123.vertices[_loc4_];
               if(param1.indexOf(_loc6_) == -1 && param2.indexOf(_loc6_) == -1 && _2123.outline.indexOf(_loc6_) == -1)
               {
                  if(_654._4252(_loc6_,Vector.<_656>(_loc10_)))
                  {
                     _loc3_.push(_loc6_);
                  }
               }
               _loc4_++;
            }
         }
         if(_loc3_.length > 0)
         {
            if(!_loc7_)
            {
               _loc11_ = param1[0];
               _loc12_ = param1[param1.length - 1];
               _loc3_.push(_loc11_,_loc12_);
            }
            _loc13_ = _654._12660(Vector.<Point>(_loc3_),_loc11_,_loc12_);
            _loc14_ = Vector.<_661>(_loc13_);
            if(!_loc7_)
            {
               _loc4_ = 0;
               _loc5_ = int(_loc14_.length);
               while(_loc4_ < _loc5_)
               {
                  if(_loc14_[_loc4_] == _loc11_ && _loc14_[_loc4_ + 1] == _loc12_ || _loc14_[_loc4_] == _loc12_ && _loc14_[_loc4_ + 1] == _loc11_)
                  {
                     _loc14_.splice(_loc4_,2);
                  }
                  _loc4_ += 2;
               }
            }
            return _loc14_;
         }
         var _loc8_:Vector.<_661> = new Vector.<_661>();
         _loc8_.push(param1[0]);
         _loc8_.push(param1[param1.length - 1]);
         return _loc8_;
      }
      
      private function _13886(param1:Vector.<_661>) : Vector.<_661>
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc2_:Vector.<_661> = new Vector.<_661>();
         _loc3_ = 0;
         _loc4_ = int(param1.length);
         while(_loc3_ < _loc4_)
         {
            _loc5_ = (_loc3_ + 1) % _loc4_;
            _loc2_.push(param1[_loc3_],param1[_loc5_]);
            _loc3_++;
         }
         return _loc2_;
      }
      
      private function _14631(param1:Vector.<_661>) : void
      {
         var _loc6_:_661 = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:Vector.<_661> = null;
         var _loc10_:Vector.<Vector.<_661>> = null;
         var _loc11_:Vector.<_661> = null;
         var _loc12_:Vector.<_661> = null;
         var _loc13_:Vector.<_661> = null;
         var _loc14_:Vector.<_661> = null;
         var _loc15_:Vector.<_661> = null;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:Vector.<_661> = null;
         var _loc19_:Boolean = false;
         if(_2123.triangles.length <= 1 && this._13892(param1))
         {
            return;
         }
         var _loc2_:Vector.<_661> = this._13888(param1);
         var _loc3_:Vector.<_661> = this._14628(param1);
         var _loc4_:Object = {};
         if(_loc2_.length == 0)
         {
            _loc2_ = null;
         }
         if(_loc3_.length == 0)
         {
            _loc3_ = null;
         }
         else
         {
            _loc12_ = new Vector.<_661>();
            _loc13_ = Vector.<_661>(_654._5698(Vector.<_656>(_2123.outline)));
            _loc10_ = this._13887(_loc3_,_loc13_);
            _loc7_ = 0;
            _loc8_ = int(_loc10_.length);
            while(_loc7_ < _loc8_)
            {
               _loc9_ = _loc10_[_loc7_];
               _loc11_ = this._13890(_loc9_,param1);
               _loc16_ = 0;
               _loc17_ = int(_loc11_.length);
               while(_loc16_ < _loc17_)
               {
                  _loc12_.push(_loc11_[_loc16_]);
                  _loc16_++;
               }
               _loc7_++;
            }
            _loc14_ = this._13891(param1,_loc12_);
            _loc15_ = new Vector.<_661>();
            _loc7_ = 0;
            _loc8_ = int(_loc14_.length);
            while(_loc7_ < _loc8_)
            {
               _loc15_.push(_2123._3183(_loc14_[_loc7_]));
               _loc7_++;
            }
            if(!this._4207(_loc14_))
            {
               this._14632();
               return;
            }
            _loc4_._12548 = _2123.outline.concat();
            _loc4_._12549 = _loc14_;
            _loc4_._12545 = _2123._5739.concat();
            _loc4_._12544 = _loc15_;
         }
         if(Boolean(_2123.userEdges) && _2123.userEdges.length > 0)
         {
            _loc18_ = new Vector.<_661>();
            _loc7_ = 0;
            _loc8_ = int(_2123.userEdges.length);
            while(_loc7_ < _loc8_)
            {
               if(!(param1.indexOf(_2123.userEdges[_loc7_]) >= 0 || param1.indexOf(_2123.userEdges[_loc7_ + 1]) >= 0))
               {
                  if(!(Boolean(_loc14_) && _654._12661(_2123.userEdges[_loc7_],_2123.userEdges[_loc7_ + 1],Vector.<Point>(_loc14_))))
                  {
                     _loc18_.push(_2123.userEdges[_loc7_],_2123.userEdges[_loc7_ + 1]);
                  }
               }
               _loc7_ += 2;
            }
            if(_loc19_ || _loc18_.length != _2123.userEdges.length)
            {
               _loc4_._12547 = _2123.userEdges.concat();
               _loc4_._12546 = _loc18_;
               if(_loc14_)
               {
                  if(!this._14627(_loc14_,_loc18_))
                  {
                     this._14632();
                     return;
                  }
               }
            }
         }
         var _loc5_:Vector.<_661> = new Vector.<_661>();
         _loc7_ = 0;
         _loc8_ = int(param1.length);
         while(_loc7_ < _loc8_)
         {
            _loc6_ = _2123._4263(param1[_loc7_]);
            if(_loc6_)
            {
               _loc5_.push(_loc6_);
            }
            _loc7_++;
         }
         _loc4_._1837 = _4213;
         _loc4_.mesh = _2123;
         _loc4_.vertices = param1.concat();
         _loc4_._14436 = _loc5_;
         _1567(new CommandNotification(CommandNotification.DELETE_VERTICES,_loc4_));
         this._12641.length = 0;
         _4348._3024();
         _4210._4266 = null;
         _4210._4265 = null;
         _4210._12695 = null;
         _4210._4358 = null;
         _4210._3823.length = 0;
         _4210._4209 = null;
         _4210._5713[0] = null;
      }
      
      private function _4207(param1:Vector.<_661>) : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Point = null;
         var _loc6_:Point = null;
         var _loc7_:Point = null;
         var _loc8_:Point = null;
         _loc2_ = 0;
         _loc3_ = int(param1.length);
         while(_loc2_ < _loc3_)
         {
            _loc5_ = param1[_loc2_];
            _loc6_ = param1[_loc2_ + 1];
            _loc4_ = _loc2_ + 2;
            while(_loc4_ < _loc3_)
            {
               _loc7_ = param1[_loc4_];
               _loc8_ = param1[_loc4_ + 1];
               if(_654.cross2(_loc5_,_loc6_,_loc7_,_loc8_))
               {
                  return false;
               }
               _loc4_ += 2;
            }
            _loc2_ += 2;
         }
         return true;
      }
      
      private function _14627(param1:Vector.<_661>, param2:Vector.<_661>) : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:Point = null;
         var _loc8_:Point = null;
         var _loc9_:Point = null;
         var _loc10_:Point = null;
         _loc3_ = 0;
         _loc4_ = int(param1.length);
         while(_loc3_ < _loc4_)
         {
            _loc7_ = param1[_loc3_];
            _loc8_ = param1[_loc3_ + 1];
            _loc5_ = 0;
            _loc6_ = int(param2.length);
            while(_loc5_ < _loc6_)
            {
               _loc9_ = param2[_loc5_];
               _loc10_ = param2[_loc5_ + 1];
               if(_654.cross2(_loc7_,_loc8_,_loc9_,_loc10_))
               {
                  return false;
               }
               _loc5_ += 2;
            }
            _loc3_ += 2;
         }
         return true;
      }
      
      private function _14632() : void
      {
         _4348._3024();
         this._3024();
         this._4237(null);
         (_1407.getInstance(_623) as _623)._3351(tr("Tip.deleteVertex.fail"),_717.ANIMATE);
      }
      
      private function _12659(param1:_661) : void
      {
         var _loc4_:Vector.<_661> = null;
         var _loc6_:Vector.<_661> = null;
         var _loc7_:_655 = null;
         var _loc8_:Vector.<_661> = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:_661 = null;
         var _loc12_:_661 = null;
         var _loc13_:_661 = null;
         var _loc14_:Vector.<Point> = null;
         var _loc15_:Vector.<_661> = null;
         var _loc16_:Vector.<_661> = null;
         var _loc17_:Vector.<_661> = null;
         var _loc18_:Object = null;
         if(_2123.triangles.length <= 1 && this._3168(param1))
         {
            return;
         }
         var _loc2_:Vector.<_661> = this._4261(param1);
         var _loc3_:Vector.<_661> = this._4262(param1);
         if(_loc2_.length == 0)
         {
            _loc2_ = null;
         }
         if(_loc3_.length == 0)
         {
            _loc3_ = null;
         }
         else
         {
            _loc6_ = _loc3_.concat();
            if(_loc6_[0] == _loc6_[2] || _loc6_[0] == _loc6_[3])
            {
               _loc6_.splice(0,1);
            }
            else
            {
               _loc6_.splice(1,1);
            }
            if(_loc6_.length == 3)
            {
               _loc7_ = new _655(_loc6_[0],_loc6_[1],_loc6_[2]);
               _loc8_ = new Vector.<_661>();
               _loc9_ = 0;
               _loc10_ = int(_2123.vertices.length);
               while(_loc9_ < _loc10_)
               {
                  _loc11_ = _2123.vertices[_loc9_];
                  if(_loc6_.indexOf(_loc11_) == -1 && _2123.outline.indexOf(_loc11_) == -1)
                  {
                     if(_654._4249(_loc11_,_loc7_))
                     {
                        _loc8_.push(_loc11_);
                     }
                  }
                  _loc9_++;
               }
               if(_loc8_.length > 0)
               {
                  _loc12_ = _loc3_[0] == param1 ? _loc3_[1] : _loc3_[0];
                  _loc13_ = _loc3_[2] == param1 ? _loc3_[3] : _loc3_[2];
                  _loc8_.push(_loc12_,_loc13_);
                  _loc14_ = _654._12660(Vector.<Point>(_loc8_),_loc12_,_loc13_);
                  _loc15_ = Vector.<_661>(_loc14_);
                  _loc16_ = new Vector.<_661>();
                  _loc9_ = 0;
                  _loc10_ = int(_2123.userEdges.length);
                  while(_loc9_ < _loc10_)
                  {
                     if(!(_2123.userEdges[_loc9_] == param1 || _2123.userEdges[_loc9_ + 1] == param1))
                     {
                        if(!_654._12661(_2123.userEdges[_loc9_],_2123.userEdges[_loc9_ + 1],Vector.<Point>(_loc15_)))
                        {
                           _loc16_.push(_2123.userEdges[_loc9_],_2123.userEdges[_loc9_ + 1]);
                        }
                     }
                     _loc9_ += 2;
                  }
                  _loc9_ = 0;
                  _loc10_ = int(_2123.outline.length);
                  while(_loc9_ < _loc10_)
                  {
                     if(!(_2123.outline[_loc9_] == param1 || _2123.outline[_loc9_ + 1] == param1))
                     {
                        _loc15_.push(_2123.outline[_loc9_],_2123.outline[_loc9_ + 1]);
                     }
                     _loc9_ += 2;
                  }
                  _loc17_ = new Vector.<_661>();
                  _loc9_ = 0;
                  _loc10_ = int(_loc15_.length);
                  while(_loc9_ < _loc10_)
                  {
                     _loc17_.push(_2123._3183(_loc15_[_loc9_]));
                     _loc9_++;
                  }
                  _loc18_ = {};
                  if(Boolean(_loc2_) || _loc16_.length != _2123.userEdges.length)
                  {
                     _loc18_._12547 = _2123.userEdges.concat();
                     _loc18_._12546 = _loc16_;
                  }
                  _loc18_._12548 = _2123.outline.concat();
                  _loc18_._12549 = _loc15_;
                  _loc18_._12545 = _2123._5739.concat();
                  _loc18_._12544 = _loc17_;
                  var _loc5_:_661 = _2123._4263(param1);
                  _loc18_._1837 = _4213;
                  _loc18_.mesh = _2123;
                  _loc18_.vertex = param1;
                  _loc18_._3169 = _loc5_;
                  _1567(new CommandNotification(CommandNotification.DELETE_VERTEX_2,_loc18_));
                  return;
               }
            }
            if(_2123.outline.length > 6)
            {
               _loc12_ = _loc3_[0] == param1 ? _loc3_[1] : _loc3_[0];
               _loc13_ = _loc3_[2] == param1 ? _loc3_[3] : _loc3_[2];
               _loc4_ = new Vector.<_661>();
               _loc4_.push(_loc12_,_loc13_);
            }
            else
            {
               _loc3_ = null;
            }
         }
         if(_loc4_)
         {
            if(this._3188(_loc4_,_loc2_))
            {
               return;
            }
         }
         _loc5_ = _2123._4263(param1);
         _1567(new CommandNotification(CommandNotification.DELETE_VERTEX,{
            "_1837":_4213,
            "mesh":_2123,
            "vertex":param1,
            "_3169":_loc5_,
            "_3179":_loc2_,
            "_3181":_loc3_,
            "_3166":_loc4_
         }));
         this._12641.length = 0;
      }
      
      private function _3161(param1:_661) : void
      {
         var _loc4_:Vector.<_661> = null;
         var _loc6_:_661 = null;
         var _loc7_:_661 = null;
         if(_2123.triangles.length <= 1 && this._3168(param1))
         {
            return;
         }
         var _loc2_:Vector.<_661> = this._4261(param1);
         var _loc3_:Vector.<_661> = this._4262(param1);
         if(_loc2_.length == 0)
         {
            _loc2_ = null;
         }
         if(_loc3_.length == 0)
         {
            _loc3_ = null;
         }
         else if(_2123.outline.length > 6)
         {
            _loc6_ = _loc3_[0] == param1 ? _loc3_[1] : _loc3_[0];
            _loc7_ = _loc3_[2] == param1 ? _loc3_[3] : _loc3_[2];
            _loc4_ = new Vector.<_661>();
            _loc4_.push(_loc6_,_loc7_);
         }
         else
         {
            _loc3_ = null;
         }
         if(_loc4_)
         {
            if(this._3188(_loc4_,_loc2_))
            {
               return;
            }
         }
         var _loc5_:_661 = _2123._4263(param1);
         _1567(new CommandNotification(CommandNotification.DELETE_VERTEX,{
            "_1837":_4213,
            "mesh":_2123,
            "vertex":param1,
            "_3169":_loc5_,
            "_3179":_loc2_,
            "_3181":_loc3_,
            "_3166":_loc4_
         }));
         this._12641.length = 0;
      }
      
      private function _3188(param1:Vector.<_661>, param2:Vector.<_661>) : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         _loc3_ = 0;
         _loc4_ = int(_2123.outline.length);
         while(_loc3_ < _loc4_)
         {
            if(_654.cross2(param1[0],param1[1],_2123.outline[_loc3_],_2123.outline[_loc3_ + 1]))
            {
               return true;
            }
            _loc3_ += 2;
         }
         _loc3_ = 0;
         _loc4_ = int(_2123.userEdges.length);
         while(_loc3_ < _loc4_)
         {
            if(!(param2 != null && _654._12661(_2123.userEdges[_loc3_],_2123.userEdges[_loc3_ + 1],Vector.<Point>(param2))))
            {
               if(_654.cross2(param1[0],param1[1],_2123.userEdges[_loc3_],_2123.userEdges[_loc3_ + 1]))
               {
                  return true;
               }
            }
            _loc3_ += 2;
         }
         return false;
      }
   }
}

