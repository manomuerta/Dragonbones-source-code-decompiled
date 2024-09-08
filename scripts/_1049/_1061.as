package _1049
{
   public final class _1061
   {
      public var _6589:int;
      
      private var _8005:Vector.<Number>;
      
      public var _7876:Number = -1;
      
      public var fixedHeight:Number = -1;
      
      public var next:_1061;
      
      public var prev:_1061;
      
      private var _7999:uint;
      
      public function _1061(param1:uint, param2:int)
      {
         super();
         this._6589 = param2;
         this._7999 = param1;
         this._8005 = new Vector.<Number>(param1);
         _1055._7891(this._8005,-1);
      }
      
      public function get _7899() : uint
      {
         return this._7999;
      }
      
      public function set _7899(param1:uint) : void
      {
         var _loc2_:int = 0;
         if(param1 == this._7999)
         {
            return;
         }
         this._8005.length = param1;
         if(param1 > this._7999)
         {
            _loc2_ = param1 - this._7999;
            while(_loc2_ < param1)
            {
               this._8005[_loc2_] = -1;
               _loc2_++;
            }
         }
         else
         {
            this._8004();
         }
         this._7999 = param1;
      }
      
      private function _8004() : Boolean
      {
         var _loc2_:Number = NaN;
         var _loc3_:* = false;
         var _loc1_:Number = -1;
         for each(_loc2_ in this._8005)
         {
            if(_loc2_ > _loc1_)
            {
               _loc1_ = _loc2_;
            }
         }
         _loc3_ = this._7876 != _loc1_;
         if(_loc3_)
         {
            this._7876 = _loc1_;
         }
         return _loc3_;
      }
      
      public function _7880(param1:int) : Number
      {
         if(param1 < 0 || param1 >= this._8005.length)
         {
            return NaN;
         }
         return this._8005[param1];
      }
      
      public function _7879(param1:int, param2:Number) : Boolean
      {
         if(this._8005[param1] == param2)
         {
            return false;
         }
         this._8005[param1] = param2;
         if(param2 == this._7876)
         {
            return false;
         }
         if(param2 > this._7876)
         {
            this._7876 = param2;
            return true;
         }
         return this._8004();
      }
      
      public function _7878(param1:int, param2:int) : void
      {
         _1055._7865(this._8005,param1,param2,-1);
      }
      
      public function _7892(param1:int, param2:int, param3:int) : void
      {
         _1055._7859(this._8005,param2,this._8005.splice(param1,param3));
      }
      
      public function _7884(param1:int, param2:int) : void
      {
         _1055._7891(this._8005,-1,param1,param2);
         this._8004();
      }
      
      public function _7877(param1:int, param2:int) : void
      {
         this._8005.splice(param1,param2);
         this._8004();
      }
      
      public function toString() : String
      {
         var _loc1_:* = "";
         _loc1_ += "(" + this._6589 + ", " + this._7876 + ") ";
         _loc1_ += this._8005 + "\n";
         if(this.prev)
         {
            _loc1_ += this.prev._6589;
         }
         else
         {
            _loc1_ += "null";
         }
         _loc1_ += " <- -> ";
         if(this.next)
         {
            _loc1_ += this.next._6589;
         }
         else
         {
            _loc1_ += "null";
         }
         return _loc1_;
      }
   }
}

