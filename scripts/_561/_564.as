package _561
{
   import _652._654;
   import _658._661;
   import _783.CommandNotification;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class _564 extends _567
   {
      private var _4235:Point;
      
      private var _4256:Boolean;
      
      private var _4258:Boolean;
      
      private var _4259:Boolean;
      
      private var _4267:Vector.<_661>;
      
      private var _4264:_661;
      
      public function _564()
      {
         super();
         this._4235 = new Point();
         this._4267 = new Vector.<_661>(2);
      }
      
      override protected function dispose() : void
      {
         this._4237(null);
         super.dispose();
      }
      
      override protected function _4205() : void
      {
         _4211.removeEventListener(MouseEvent.MOUSE_DOWN,this._4063);
         _4211.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         _4211.removeEventListener(MouseEvent.ROLL_OUT,this._4237);
      }
      
      override protected function _1576() : void
      {
         _4211.addEventListener(MouseEvent.MOUSE_DOWN,this._4063);
         _4211.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseMove);
         _4211.addEventListener(MouseEvent.ROLL_OUT,this._4237);
      }
      
      private function _4237(param1:MouseEvent) : void
      {
         this._4267[0] = null;
         this._4267[1] = null;
         this._4264 = null;
         _4210._4266 = null;
         _4210._4265 = null;
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
            this._4267.length = 0;
         }
         this._4264 = null;
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
         if(_4220)
         {
            return;
         }
         if(this._4264 != null)
         {
            this._3161(this._4264);
         }
         else if(this._4267[0] != null)
         {
            this._4268(this._4267);
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
         this._4235 = _4211.globalToLocal(this._4235);
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
               _4210._2466();
               this._4267[0] = null;
               this._4264 = null;
            }
         }
      }
      
      private function _4232(param1:_661) : void
      {
         var _loc2_:Vector.<_661> = null;
         _loc2_ = this._4262(param1);
         if(_2123.outline.length <= 6 && this._3168(param1))
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
         this._4264 = param1;
         this._4267[0] = null;
      }
      
      private function _3168(param1:_661) : Boolean
      {
         return _2123.outline.indexOf(param1) != -1;
      }
      
      private function _4241(param1:Number, param2:Number, param3:Vector.<_661>) : void
      {
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
         this._4264 = null;
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
            if(this._3188(_loc4_))
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
         this._4264 = null;
      }
      
      private function _3188(param1:Vector.<_661>) : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         _loc2_ = 0;
         _loc3_ = int(_2123.outline.length);
         while(_loc2_ < _loc3_)
         {
            if(_654.cross2(param1[0],param1[1],_2123.outline[_loc2_],_2123.outline[_loc2_ + 1]))
            {
               return true;
            }
            _loc2_ += 2;
         }
         _loc2_ = 0;
         _loc3_ = int(_2123.userEdges.length);
         while(_loc2_ < _loc3_)
         {
            if(_654.cross2(param1[0],param1[1],_2123.userEdges[_loc2_],_2123.userEdges[_loc2_ + 1]))
            {
               return true;
            }
            _loc2_ += 2;
         }
         return false;
      }
   }
}

