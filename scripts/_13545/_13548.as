package _13545
{
   import _1038._1037;
   import _13492._13496;
   import _13503._13502;
   import _13505._13504;
   import _13505._13508;
   import _13505._13510;
   import _703._704;
   
   public class _13548 extends _704
   {
      public var locked:Boolean = true;
      
      private var _selected:Boolean;
      
      public var _1945:_13510;
      
      public var frames:_1037;
      
      protected var _13928:Array;
      
      private var _5820:Vector.<_13547>;
      
      private var _13930:Array;
      
      private var _6620:Boolean;
      
      public var _2713:Boolean;
      
      public function _13548(param1:_13510)
      {
         super();
         this._1945 = param1;
         this._3670 = param1;
         this._5820 = new Vector.<_13547>();
         this._13928 = [];
         this._13930 = [];
         this.frames = new _1037(this._13928);
      }
      
      public function _13839() : void
      {
         var _loc1_:Array = null;
         var _loc2_:Array = null;
         var _loc3_:Array = null;
         this.clearFrames();
         if(this._1945 is _13502)
         {
            _loc1_ = (this._1945 as _13502)._13675();
            this._13927(_loc1_);
         }
         else if(this._1945 is _13504)
         {
            _loc2_ = [];
            _loc2_.push((this._1945 as _13504)._13581);
            _loc2_.push((this._1945 as _13504)._13586);
            _loc2_.push((this._1945 as _13504)._13598);
            _loc2_ = _loc2_.concat((this._1945 as _13504)._13677());
            this._13927(_loc2_);
         }
         else if(this._1945 is _13508)
         {
            _loc3_ = [];
            _loc3_.push((this._1945 as _13508)._13599);
            _loc3_.push((this._1945 as _13508)._13572);
            _loc3_.push((this._1945 as _13508)._13592);
            this._13927(_loc3_);
         }
         else
         {
            this._13932(this._1945);
         }
         this.frames.source = this._13928;
         this.frames.refresh();
      }
      
      private function _13932(param1:_13510) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         _loc2_ = 0;
         _loc3_ = int(param1._1816.length);
         while(_loc2_ < _loc3_)
         {
            this._13928.push(this._13931(param1._1816[_loc2_]));
            _loc2_++;
         }
      }
      
      protected function _13927(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:_13510 = null;
         var _loc7_:int = 0;
         var _loc9_:_13547 = null;
         var _loc8_:Vector.<_13496> = new Vector.<_13496>();
         _loc2_ = 0;
         _loc3_ = int(param1.length);
         while(_loc2_ < _loc3_)
         {
            _loc6_ = param1[_loc2_];
            if(_loc6_)
            {
               _loc4_ = 0;
               _loc5_ = int(_loc6_._1816.length);
               while(_loc4_ < _loc5_)
               {
                  _loc8_.push(_loc6_._1816[_loc4_]);
                  _loc4_++;
               }
            }
            _loc2_++;
         }
         _loc8_ = _loc8_.sort(this._13933);
         _loc7_ = -1;
         _loc2_ = 0;
         _loc3_ = int(_loc8_.length);
         while(_loc2_ < _loc3_)
         {
            if(_loc8_[_loc2_].startPos != _loc7_)
            {
               _loc9_ = this._13931(_loc8_[_loc2_]);
               if(!this._6620)
               {
                  this._13928.push(_loc9_);
               }
               _loc7_ = _loc8_[_loc2_].startPos;
            }
            else if(_loc9_)
            {
               _loc9_.frames.push(_loc8_[_loc2_]);
               if(this._6620)
               {
                  if(this._13928.indexOf(_loc9_) == -1)
                  {
                     this._13928.push(_loc9_);
                  }
               }
            }
            _loc2_++;
         }
      }
      
      private function _13933(param1:_13496, param2:_13496) : int
      {
         if(param1.startPos < param2.startPos)
         {
            return -1;
         }
         return 1;
      }
      
      protected function clearFrames() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:_13547 = null;
         this._13930.length = 0;
         _loc1_ = 0;
         _loc2_ = int(this._13928.length);
         while(_loc1_ < _loc2_)
         {
            _loc3_ = this._13928[_loc1_];
            if(_loc3_)
            {
               if(_loc3_.selected)
               {
                  this._13930.push(_loc3_.frameIndex);
               }
               _loc3_.clear();
               this._5820.push(_loc3_);
            }
            _loc1_++;
         }
         this._13928.length = 0;
      }
      
      private function _13931(param1:_13496) : _13547
      {
         var _loc2_:_13547 = null;
         if(this._5820.length > 0)
         {
            _loc2_ = this._5820.pop();
            _loc2_.frames.push(param1);
            _loc2_.parent = this.frames;
         }
         else
         {
            _loc2_ = _13547._3996(this.frames,param1);
         }
         _loc2_.flag = this._1945.flag;
         _loc2_._2713 = this._2713;
         return _loc2_;
      }
      
      public function get opened() : Boolean
      {
         return this._6620;
      }
      
      public function set opened(param1:Boolean) : void
      {
         if(this._6620 != param1)
         {
            this._6620 = param1;
            this._13839();
         }
      }
      
      public function get selected() : Boolean
      {
         if(this._1945)
         {
            return this._1945.selected;
         }
         return false;
      }
      
      public function _1944(param1:int, param2:int) : Vector.<_13547>
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc6_:_13547 = null;
         var _loc5_:Vector.<_13547> = new Vector.<_13547>();
         _loc3_ = 0;
         _loc4_ = int(this._13928.length);
         while(_loc3_ < _loc4_)
         {
            _loc6_ = this._13928[_loc3_] as _13547;
            if(_loc6_.frameIndex >= param1 && _loc6_.frameIndex <= param2)
            {
               _loc5_.push(_loc6_);
            }
            _loc3_++;
         }
         return _loc5_;
      }
   }
}

