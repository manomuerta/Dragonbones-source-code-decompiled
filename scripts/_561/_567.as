package _561
{
   import _1404._1407;
   import _51._70;
   import _51._79;
   import _586._594;
   import _652._654;
   import _658.Mesh;
   import _658._659;
   import _658._661;
   import _877._876;
   import _93._94;
   
   public class _567 extends _94 implements _565
   {
      private const NEAREST_RANGE:int = 10;
      
      private const NEAREST_RANGE_SQUARE:int = 900;
      
      protected var _4211:_876;
      
      protected var _4210:_659;
      
      protected var _4296:_70;
      
      protected var _2123:Mesh;
      
      protected var _4213:_79;
      
      protected var _2348:Number;
      
      protected var _2343:Number;
      
      protected var _4294:Number;
      
      protected var _4293:Number;
      
      protected var _4220:Boolean;
      
      protected var _4239:Boolean;
      
      protected var _4295:Boolean;
      
      public function _567()
      {
         super();
      }
      
      override public function start() : void
      {
         if(this._4295)
         {
            return;
         }
         super.start();
         this._4295 = true;
      }
      
      public function stop() : void
      {
         this._4295 = false;
         this.dispose();
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
            this._4294 = this._2348 / 2;
            this._4293 = this._2343 / 2;
         }
      }
      
      public function set _4269(param1:_876) : void
      {
         this._4211 = param1;
      }
      
      public function set _4230(param1:Boolean) : void
      {
         this._4220 = param1;
      }
      
      public function set _4240(param1:Boolean) : void
      {
         this._4239 = param1;
      }
      
      override protected function dispose() : void
      {
         super.dispose();
         this._4205();
         this._4210 = null;
         this._4296 = null;
         this._2123 = null;
         this._4211 = null;
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
      
      protected function _4205() : void
      {
      }
      
      protected function _4206(param1:Number, param2:Number) : _661
      {
         var _loc3_:_661 = null;
         var _loc5_:_661 = null;
         var _loc6_:Number = NaN;
         var _loc4_:Number = this.NEAREST_RANGE / this._4210.scale;
         _loc4_ *= _loc4_;
         var _loc7_:int = 0;
         var _loc8_:int = int(this._2123.vertices.length);
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
         return null;
      }
      
      protected function _4245(param1:Number, param2:Number) : Vector.<_661>
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Vector.<_661> = new Vector.<_661>();
         var _loc7_:Number = this.NEAREST_RANGE / this._4210.scale;
         _loc7_ *= _loc7_;
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
      
      protected function _4290(param1:Number, param2:Number) : Vector.<_661>
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
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
      
      public function set scale(param1:Number) : void
      {
      }
      
      protected function get _4291() : _594
      {
         return _1407.getInstance(_594) as _594;
      }
      
      protected function get _4216() : _568
      {
         return _1407.getInstance(_568) as _568;
      }
   }
}

