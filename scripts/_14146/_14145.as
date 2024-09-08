package _14146
{
   public class _14145
   {
      private var _14313:_14149;
      
      private var _14314:_14149;
      
      private var _15107:_14149;
      
      private var _15096:Boolean = false;
      
      public function _14145(param1:_14149 = null, param2:_14149 = null)
      {
         super();
         this._14313 = param1.clone();
         this._14314 = param2.clone();
         this._15096 = false;
      }
      
      public function _15103(param1:_14149) : void
      {
         this._14313 = param1.clone();
         this._15096 = false;
      }
      
      public function _15104(param1:_14149) : void
      {
         this._14314 = param1.clone();
         this._15096 = false;
      }
      
      private function _15101(param1:_14149, param2:_14149) : void
      {
         this._14313 = param1.clone();
         this._14314 = param2.clone();
         this._15096 = false;
      }
      
      private function _15102() : _14149
      {
         if(!this._15096)
         {
            this._15099();
         }
         return this._15107;
      }
      
      public function _15097(param1:_14149) : Number
      {
         if(!this._15096)
         {
            this._15099();
         }
         var _loc2_:_14149 = param1.subtract(this._14313);
         var _loc3_:_14149 = new _14149(_loc2_.x,_loc2_.y);
         return _loc3_.dot(this._15107);
      }
      
      public function _15098(param1:_14149, param2:Number = 0.000001) : int
      {
         var _loc3_:int = _14148.ON_LINE;
         var _loc4_:Number = this._15097(param1);
         if(_loc4_ > param2)
         {
            _loc3_ = _14148.RIGHT_SIDE;
         }
         else if(_loc4_ < -param2)
         {
            _loc3_ = _14148.LEFT_SIDE;
         }
         return _loc3_;
      }
      
      public function intersection(param1:_14145, param2:_14149 = null) : int
      {
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc3_:Number = (param1._14314.y - param1._14313.y) * (this._14314.x - this._14313.x) - (param1._14314.x - param1._14313.x) * (this._14314.y - this._14313.y);
         var _loc4_:Number = (param1._14314.x - param1._14313.x) * (this._14313.y - param1._14313.y) - (param1._14314.y - param1._14313.y) * (this._14313.x - param1._14313.x);
         var _loc5_:Number = (param1._14313.x - this._14313.x) * (this._14314.y - this._14313.y) - (param1._14313.y - this._14313.y) * (this._14314.x - this._14313.x);
         if(_loc3_ == 0)
         {
            if(_loc4_ == 0 && _loc5_ == 0)
            {
               return _14147.COLLINEAR;
            }
            return _14147.PARALELL;
         }
         _loc4_ /= _loc3_;
         _loc5_ /= _loc3_;
         _loc6_ = this._14313.x + _loc4_ * (this._14314.x - this._14313.x);
         _loc7_ = this._14313.y + _loc4_ * (this._14314.y - this._14313.y);
         if(param2 != null)
         {
            param2.x = _loc6_;
            param2.y = _loc7_;
         }
         if(_loc4_ >= 0 && _loc4_ <= 1 && _loc5_ >= 0 && _loc5_ <= 1)
         {
            return _14147.SEGMENTS_INTERSECT;
         }
         if(_loc5_ >= 0 && _loc5_ <= 1)
         {
            return _14147.A_BISECTS_B;
         }
         if(_loc4_ >= 0 && _loc4_ <= 1)
         {
            return _14147.B_BISECTS_A;
         }
         return _14147.LINES_INTERSECT;
      }
      
      public function _15105() : _14149
      {
         return this._14313;
      }
      
      public function _15106() : _14149
      {
         return this._14314;
      }
      
      public function length() : Number
      {
         var _loc1_:Number = this._14314.x - this._14313.x;
         var _loc2_:Number = this._14314.y - this._14313.y;
         _loc1_ *= _loc1_;
         _loc2_ *= _loc2_;
         return Number(Math.sqrt(_loc1_ + _loc2_));
      }
      
      public function _15100() : _14149
      {
         var _loc1_:_14149 = this._14314.subtract(this._14313);
         var _loc2_:_14149 = new _14149(_loc1_.x,_loc1_.y);
         return _loc2_.normalize();
      }
      
      private function _15099() : void
      {
         this._15107 = this._15100();
         var _loc1_:Number = this._15107.y;
         this._15107.y = this._15107.x;
         this._15107.x = -_loc1_;
         this._15096 = true;
      }
      
      public function move(param1:Number) : void
      {
         var _loc2_:_14149 = null;
         _loc2_ = this._15102();
         this._14313.x += _loc2_.x * param1;
         this._14314.x += _loc2_.x * param1;
         this._14313.y += _loc2_.y * param1;
         this._14314.y += _loc2_.y * param1;
      }
      
      public function equals(param1:_14145) : Boolean
      {
         return this._14313.equals(param1._15105()) && this._14314.equals(param1._15106()) || this._14313.equals(param1._15106()) && this._14314.equals(param1._15105());
      }
      
      public function clone() : _14145
      {
         return new _14145(this._14313.clone(),this._14314.clone());
      }
      
      public function toString() : String
      {
         return "Line:" + this._14313 + " -> " + this._14314;
      }
   }
}

