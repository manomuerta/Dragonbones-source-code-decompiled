package _214
{
   import _13492._13496;
   import _13505._13510;
   
   public class _13512
   {
      public var _frames:Vector.<_13496>;
      
      private var _2839:int;
      
      public function _13512()
      {
         super();
      }
      
      private function clear() : void
      {
         if(this._frames)
         {
            this._frames.length = 0;
         }
         this._2839 = int.MAX_VALUE;
      }
      
      public function _2847() : Boolean
      {
         return Boolean(this._frames) && this._frames.length == 1;
      }
      
      public function _2840() : Boolean
      {
         var _loc1_:_13510 = null;
         var _loc3_:int = 0;
         var _loc2_:int = 0;
         if(this._frames)
         {
            _loc2_ = 0;
            _loc3_ = int(this._frames.length);
            while(_loc2_ < _loc3_)
            {
               if(_loc1_ == null)
               {
                  _loc1_ = this._frames[_loc2_].parent;
               }
               else if(_loc1_ != this._frames[_loc2_].parent)
               {
                  return false;
               }
               _loc2_++;
            }
         }
         return _loc1_ != null;
      }
      
      public function _13698() : String
      {
         if(this._2840())
         {
            return this._frames[0].parent.flag;
         }
         return null;
      }
      
      public function _2838(param1:Vector.<_13496>) : void
      {
         this._frames = new Vector.<_13496>();
         var _loc2_:int = int(param1.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this._frames.push(param1[_loc3_].clone());
            _loc3_++;
         }
      }
      
      public function _2845(param1:int) : Vector.<_13496>
      {
         var _loc3_:int = 0;
         var _loc7_:_13496 = null;
         var _loc2_:int = 0;
         var _loc4_:int = int.MAX_VALUE;
         _loc2_ = 0;
         _loc3_ = int(this._frames.length);
         while(_loc2_ < _loc3_)
         {
            if(_loc4_ > this._frames[_loc2_].startPos)
            {
               _loc4_ = this._frames[_loc2_].startPos;
            }
            _loc2_++;
         }
         var _loc5_:int = param1 - _loc4_;
         var _loc6_:Vector.<_13496> = new Vector.<_13496>();
         _loc2_ = 0;
         _loc3_ = int(this._frames.length);
         while(_loc2_ < _loc3_)
         {
            _loc7_ = this._frames[_loc2_].clone();
            _loc7_.startPos += _loc5_;
            _loc6_.push(_loc7_);
            _loc2_++;
         }
         return _loc6_;
      }
      
      private function _14381() : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:_13510 = null;
         var _loc1_:int = 0;
         _loc1_ = 0;
         _loc2_ = int(this._frames.length);
         while(_loc1_ < _loc2_)
         {
            if(_loc3_ == null)
            {
               _loc3_ = this._frames[_loc1_].parent.parent;
            }
            else if(_loc3_ != this._frames[_loc1_].parent.parent)
            {
               return false;
            }
            _loc1_++;
         }
         return _loc3_ != null;
      }
      
      private function _14386() : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:_13496 = null;
         var _loc1_:int = 0;
         if(this._frames)
         {
            _loc1_ = 0;
            _loc2_ = int(this._frames.length);
            while(_loc1_ < _loc2_)
            {
               _loc3_ = this._frames[_loc1_];
               if(_loc3_.flag != _13510.FLAG_TRANSLATE && _loc3_.flag != _13510.FLAG_ROTATE && _loc3_.flag != _13510.FLAG_SCALE)
               {
                  return false;
               }
               _loc1_++;
            }
         }
         return true;
      }
      
      public function _14382() : Boolean
      {
         if(this._14381() == false || this._14386() == false)
         {
            return false;
         }
         return true;
      }
      
      private function _14385() : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:_13496 = null;
         var _loc1_:int = 0;
         if(this._frames)
         {
            _loc1_ = 0;
            _loc2_ = int(this._frames.length);
            while(_loc1_ < _loc2_)
            {
               _loc3_ = this._frames[_loc1_];
               if(_loc3_.flag != _13510.FLAG_COLOR && _loc3_.flag != _13510.FLAG_DISPLAY_INDEX)
               {
                  return false;
               }
               _loc1_++;
            }
         }
         return true;
      }
      
      private function _14387() : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:_13496 = null;
         var _loc1_:int = 0;
         if(this._frames)
         {
            _loc1_ = 0;
            _loc2_ = int(this._frames.length);
            while(_loc1_ < _loc2_)
            {
               _loc3_ = this._frames[_loc1_];
               if(_loc3_.flag != _13510.FLAG_IK)
               {
                  return false;
               }
               _loc1_++;
            }
         }
         return true;
      }
      
      public function _14383() : Boolean
      {
         if(this._14381() == false || this._14385() == false)
         {
            return false;
         }
         return true;
      }
      
      private function _14380() : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:_13510 = null;
         var _loc1_:int = 0;
         _loc1_ = 0;
         _loc2_ = int(this._frames.length);
         while(_loc1_ < _loc2_)
         {
            if(_loc3_ == null)
            {
               _loc3_ = this._frames[_loc1_].parent;
            }
            else if(_loc3_ != this._frames[_loc1_].parent)
            {
               return false;
            }
            _loc1_++;
         }
         return _loc3_ != null;
      }
      
      public function _14384() : Boolean
      {
         if(this._14380() == false || this._14387() == false)
         {
            return false;
         }
         return true;
      }
   }
}

