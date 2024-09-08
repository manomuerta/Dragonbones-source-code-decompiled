package _11500
{
   import _1404._1407;
   import _51._70;
   import _51._79;
   import _555._570;
   import _579._580;
   import _586._603;
   import _652._654;
   import _658.Mesh;
   import _658._659;
   import _658._661;
   import _783.MeshNotification;
   import _877._885;
   import _877._887;
   import _93._94;
   import _953._956;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Matrix;
   import flash.geom.Point;
   
   public class _11501 extends _94
   {
      private const NEAREST_RANGE:int = 10;
      
      private const NEAREST_RANGE_SQUARE:int = 900;
      
      protected var _4344:_887;
      
      protected var _4211:_885;
      
      protected var _5097:_956;
      
      protected var _4210:_659;
      
      protected var _4296:_70;
      
      protected var _2123:Mesh;
      
      protected var _4213:_79;
      
      protected var _2348:Number;
      
      protected var _2343:Number;
      
      protected var _4294:Number;
      
      protected var _4293:Number;
      
      protected var _4239:Boolean;
      
      protected var _11418:Boolean;
      
      protected var _11414:Boolean;
      
      protected var _11657:Boolean;
      
      private var _2205:Matrix;
      
      private var _4235:Point;
      
      public function _11501()
      {
         super();
      }
      
      public function _4906(param1:_885, param2:_956, param3:_887) : void
      {
         this._4211 = param1;
         this._5097 = param2;
         this._4344 = param3;
         this._4235 = new Point();
      }
      
      override protected function _1576() : void
      {
         super._1576();
         this._5097.addEventListener(MouseEvent.MOUSE_DOWN,this._11659,false,100);
         this._5097.addEventListener(MouseEvent.ROLL_OUT,this._10481);
         this._5097.addEventListener(MouseEvent.ROLL_OVER,this._10480);
         this._5097.addEventListener(Event.REMOVED_FROM_STAGE,this._11484);
         stage.addEventListener(MouseEvent.MOUSE_DOWN,this._11430,true,1000);
         stage.addEventListener(MouseEvent.MOUSE_UP,this._11427,true,1000);
         stage.addEventListener(MouseEvent.CLICK,this._11427,true,1000);
      }
      
      protected function _4205() : void
      {
         if(this._5097)
         {
            this._5097.removeEventListener(MouseEvent.MOUSE_DOWN,this._11659);
            this._5097.removeEventListener(MouseEvent.ROLL_OUT,this._10481);
            this._5097.removeEventListener(MouseEvent.ROLL_OVER,this._10480);
            this._5097.removeEventListener(Event.REMOVED_FROM_STAGE,this._11484);
         }
         if(stage)
         {
            stage.removeEventListener(MouseEvent.MOUSE_DOWN,this._11430,true);
            stage.removeEventListener(MouseEvent.MOUSE_UP,this._11427,true);
            stage.removeEventListener(MouseEvent.CLICK,this._11427,true);
         }
      }
      
      private function _11484(param1:Event) : void
      {
         _1567(new MeshNotification(MeshNotification.STOP_EDIT));
      }
      
      private function _10480(param1:MouseEvent) : void
      {
         this._11418 = false;
      }
      
      private function _10481(param1:MouseEvent) : void
      {
         if(!this._2212._11422())
         {
            this._11418 = true;
         }
      }
      
      private function _11430(param1:MouseEvent) : void
      {
         this._11414 = false;
         if(this._11418)
         {
            if(!this._2853._11622())
            {
               this._11414 = true;
               param1.stopImmediatePropagation();
               _1567(new MeshNotification(MeshNotification.STOP_EDIT));
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
      
      public function stop() : void
      {
         this._4205();
         dispose();
         this._4210 = null;
         this._4296 = null;
         this._2123 = null;
      }
      
      public function _4242(param1:_659, param2:_79) : void
      {
         this._4210 = param1;
         this._4296 = this._4210.vo;
         this._2123 = this._4296.mesh;
         this._4213 = param2;
         if(this._2123)
         {
            this._2348 = this._2123.maxWidth;
            this._2343 = this._2123.maxHeight;
            this._4294 = this._2348 / 2 - 0.001;
            this._4293 = this._2343 / 2 - 0.001;
         }
         this._4344._2026 = new Matrix();
      }
      
      public function update() : void
      {
      }
      
      public function _3173() : void
      {
      }
      
      public function _3024() : void
      {
      }
      
      protected function _11659(param1:MouseEvent) : void
      {
         param1.stopImmediatePropagation();
      }
      
      protected function _11660(param1:Number, param2:Number, param3:Number = 10) : _661
      {
         var _loc4_:_661 = null;
         var _loc5_:_661 = null;
         var _loc6_:Number = NaN;
         param3 *= param3;
         param3 /= this._4210.scale;
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
      
      protected function _4206(param1:Number, param2:Number) : _661
      {
         var _loc3_:_661 = null;
         var _loc5_:_661 = null;
         var _loc6_:Number = NaN;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc4_:Number = this.NEAREST_RANGE / this._4210.scale;
         _loc4_ *= _loc4_;
         if(this._11657)
         {
            this._4235.x = param1;
            this._4235.y = param2;
            this._2205 = this._4211._2162.clone();
            this._2205.invert();
            this._4235 = this._2205.transformPoint(this._4235);
            _loc5_ = this._11660(this._4235.x,this._4235.y);
            if(_loc5_)
            {
               _loc5_ = this._2123._11661(_loc5_);
            }
         }
         else
         {
            _loc7_ = 0;
            _loc8_ = int(this._2123.vertices.length);
            while(_loc7_ < _loc8_)
            {
               _loc3_ = this._2123.vertices[_loc7_];
               if(Math.abs(param1 - _loc3_.x) < _loc4_ && Math.abs(param2 - _loc3_.y) < _loc4_)
               {
                  _loc6_ = (param1 - _loc3_.x) * (param1 - _loc3_.x) + (param2 - _loc3_.y) * (param2 - _loc3_.y);
                  if(_loc6_ < _loc4_)
                  {
                     _loc5_ = _loc3_;
                     _loc4_ = _loc6_;
                  }
               }
               _loc7_++;
            }
         }
         return _loc5_;
      }
      
      protected function _4217(param1:Number, param2:Number) : Vector.<_661>
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Vector.<_661> = new Vector.<_661>();
         var _loc7_:Number = this.NEAREST_RANGE / this._4210.scale;
         _loc7_ *= _loc7_;
         if(this._11657)
         {
            this._4235.x = param1;
            this._4235.y = param2;
            this._2205 = this._4211._2162.clone();
            this._2205.invert();
            this._4235 = this._2205.transformPoint(this._4235);
            param1 = this._4235.x;
            param2 = this._4235.y;
            _loc3_ = 0;
            _loc4_ = int(this._2123._5739.length);
            while(_loc3_ < _loc4_)
            {
               _loc5_ = _654._4292(param1,param2,this._2123._5739[_loc3_].x,this._2123._5739[_loc3_].y,this._2123._5739[_loc3_ + 1].x,this._2123._5739[_loc3_ + 1].y,_loc7_);
               if(_loc5_ == 1)
               {
                  _loc6_.push(this._2123.outline[_loc3_]);
                  return _loc6_;
               }
               if(_loc5_ == 2)
               {
                  _loc6_.push(this._2123.outline[_loc3_ + 1]);
                  return _loc6_;
               }
               if(_loc5_ == 3)
               {
                  _loc6_.push(this._2123.outline[_loc3_],this._2123.outline[_loc3_ + 1]);
                  return _loc6_;
               }
               _loc3_ += 2;
            }
         }
         else
         {
            _loc3_ = 0;
            _loc4_ = int(this._2123.outline.length);
            while(_loc3_ < _loc4_)
            {
               _loc5_ = _654._4292(param1,param2,this._2123.outline[_loc3_].x,this._2123.outline[_loc3_].y,this._2123.outline[_loc3_ + 1].x,this._2123.outline[_loc3_ + 1].y,_loc7_);
               if(_loc5_ == 1)
               {
                  _loc6_.push(this._2123.outline[_loc3_]);
                  return _loc6_;
               }
               if(_loc5_ == 2)
               {
                  _loc6_.push(this._2123.outline[_loc3_ + 1]);
                  return _loc6_;
               }
               if(_loc5_ == 3)
               {
                  _loc6_.push(this._2123.outline[_loc3_],this._2123.outline[_loc3_ + 1]);
                  return _loc6_;
               }
               _loc3_ += 2;
            }
         }
         return null;
      }
      
      protected function _4245(param1:Number, param2:Number) : Vector.<_661>
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc8_:_661 = null;
         var _loc9_:_661 = null;
         var _loc6_:Vector.<_661> = new Vector.<_661>();
         var _loc7_:Number = this.NEAREST_RANGE / this._4210.scale;
         _loc7_ *= _loc7_;
         if(this._11657)
         {
            this._4235.x = param1;
            this._4235.y = param2;
            this._2205 = this._4211._2162.clone();
            this._2205.invert();
            this._4235 = this._2205.transformPoint(this._4235);
            param1 = this._4235.x;
            param2 = this._4235.y;
            _loc3_ = 0;
            _loc4_ = int(this._2123.userEdges.length);
            while(_loc3_ < _loc4_)
            {
               _loc8_ = this._2123._3183(this._2123.userEdges[_loc3_]);
               _loc9_ = this._2123._3183(this._2123.userEdges[_loc3_ + 1]);
               if(Boolean(_loc8_) && Boolean(_loc9_))
               {
                  _loc5_ = _654._4292(param1,param2,_loc8_.x,_loc8_.y,_loc9_.x,_loc9_.y,_loc7_);
               }
               if(_loc5_ == 1)
               {
                  _loc6_.push(this._2123.userEdges[_loc3_]);
                  return _loc6_;
               }
               if(_loc5_ == 2)
               {
                  _loc6_.push(this._2123.userEdges[_loc3_ + 1]);
                  return _loc6_;
               }
               if(_loc5_ == 3)
               {
                  _loc6_.push(this._2123.userEdges[_loc3_],this._2123.userEdges[_loc3_ + 1]);
                  return _loc6_;
               }
               _loc3_ += 2;
            }
         }
         else
         {
            _loc3_ = 0;
            _loc4_ = int(this._2123.userEdges.length);
            while(_loc3_ < _loc4_)
            {
               _loc5_ = _654._4292(param1,param2,this._2123.userEdges[_loc3_].x,this._2123.userEdges[_loc3_].y,this._2123.userEdges[_loc3_ + 1].x,this._2123.userEdges[_loc3_ + 1].y,_loc7_);
               if(_loc5_ == 1)
               {
                  _loc6_.push(this._2123.userEdges[_loc3_]);
                  return _loc6_;
               }
               if(_loc5_ == 2)
               {
                  _loc6_.push(this._2123.userEdges[_loc3_ + 1]);
                  return _loc6_;
               }
               if(_loc5_ == 3)
               {
                  _loc6_.push(this._2123.userEdges[_loc3_],this._2123.userEdges[_loc3_ + 1]);
                  return _loc6_;
               }
               _loc3_ += 2;
            }
         }
         return null;
      }
      
      protected function _11658(param1:Number, param2:Number) : Vector.<_661>
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc7_:_661 = null;
         var _loc8_:_661 = null;
         this._4235.x = param1;
         this._4235.y = param2;
         this._2205 = this._4211._2162.clone();
         this._2205.invert();
         this._4235 = this._2205.transformPoint(this._4235);
         param1 = this._4235.x;
         param2 = this._4235.y;
         var _loc6_:Vector.<_661> = new Vector.<_661>();
         var _loc9_:Number = this.NEAREST_RANGE / this._4210.scale;
         _loc9_ *= _loc9_;
         var _loc10_:_661 = this._4206(param1,param2);
         if(_loc10_)
         {
            _loc6_.push(_loc10_);
            return _loc6_;
         }
         _loc3_ = 0;
         _loc4_ = int(this._2123.outline.length);
         while(_loc3_ < _loc4_)
         {
            _loc5_ = _654._4292(param1,param2,this._2123._5739[_loc3_].x,this._2123._5739[_loc3_].y,this._2123._5739[_loc3_ + 1].x,this._2123._5739[_loc3_ + 1].y,_loc9_);
            if(_loc5_ == 1)
            {
               _loc6_.push(this._2123.outline[_loc3_]);
               return _loc6_;
            }
            if(_loc5_ == 2)
            {
               _loc6_.push(this._2123.outline[_loc3_ + 1]);
               return _loc6_;
            }
            if(_loc5_ == 3)
            {
               _loc6_.push(this._2123.outline[_loc3_],this._2123.outline[_loc3_ + 1]);
               return _loc6_;
            }
            _loc3_ += 2;
         }
         _loc3_ = 0;
         _loc4_ = int(this._2123.userEdges.length);
         while(_loc3_ < _loc4_)
         {
            _loc7_ = this._2123._3183(this._2123.userEdges[_loc3_]);
            _loc8_ = this._2123._3183(this._2123.userEdges[_loc3_ + 1]);
            _loc5_ = _654._4292(param1,param2,_loc7_.x,_loc7_.y,_loc8_.x,_loc8_.y,_loc9_);
            if(_loc5_ == 1)
            {
               _loc6_.push(this._2123.userEdges[_loc3_]);
               return _loc6_;
            }
            if(_loc5_ == 2)
            {
               _loc6_.push(this._2123.userEdges[_loc3_ + 1]);
               return _loc6_;
            }
            if(_loc5_ == 3)
            {
               _loc6_.push(this._2123.userEdges[_loc3_],this._2123.userEdges[_loc3_ + 1]);
               return _loc6_;
            }
            _loc3_ += 2;
         }
         return null;
      }
      
      protected function _4290(param1:Number, param2:Number) : Vector.<_661>
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(this._11657)
         {
            return this._11658(param1,param2);
         }
         var _loc6_:Vector.<_661> = new Vector.<_661>();
         var _loc7_:Number = this.NEAREST_RANGE / this._4210.scale;
         _loc7_ *= _loc7_;
         var _loc8_:_661 = this._4206(param1,param2);
         if(_loc8_)
         {
            _loc6_.push(_loc8_);
            return _loc6_;
         }
         _loc3_ = 0;
         _loc4_ = int(this._2123.outline.length);
         while(_loc3_ < _loc4_)
         {
            _loc5_ = _654._4292(param1,param2,this._2123.outline[_loc3_].x,this._2123.outline[_loc3_].y,this._2123.outline[_loc3_ + 1].x,this._2123.outline[_loc3_ + 1].y,_loc7_);
            if(_loc5_ == 1)
            {
               _loc6_.push(this._2123.outline[_loc3_]);
               return _loc6_;
            }
            if(_loc5_ == 2)
            {
               _loc6_.push(this._2123.outline[_loc3_ + 1]);
               return _loc6_;
            }
            if(_loc5_ == 3)
            {
               _loc6_.push(this._2123.outline[_loc3_],this._2123.outline[_loc3_ + 1]);
               return _loc6_;
            }
            _loc3_ += 2;
         }
         _loc3_ = 0;
         _loc4_ = int(this._2123.userEdges.length);
         while(_loc3_ < _loc4_)
         {
            _loc5_ = _654._4292(param1,param2,this._2123.userEdges[_loc3_].x,this._2123.userEdges[_loc3_].y,this._2123.userEdges[_loc3_ + 1].x,this._2123.userEdges[_loc3_ + 1].y,_loc7_);
            if(_loc5_ == 1)
            {
               _loc6_.push(this._2123.userEdges[_loc3_]);
               return _loc6_;
            }
            if(_loc5_ == 2)
            {
               _loc6_.push(this._2123.userEdges[_loc3_ + 1]);
               return _loc6_;
            }
            if(_loc5_ == 3)
            {
               _loc6_.push(this._2123.userEdges[_loc3_],this._2123.userEdges[_loc3_ + 1]);
               return _loc6_;
            }
            _loc3_ += 2;
         }
         return null;
      }
      
      protected function get _2212() : _603
      {
         return (_1407.getInstance(_580) as _580)._2212;
      }
      
      protected function get _2853() : _570
      {
         return _1407.getInstance(_570) as _570;
      }
      
      public function set _11662(param1:Boolean) : void
      {
         this._11657 = param1;
      }
   }
}

