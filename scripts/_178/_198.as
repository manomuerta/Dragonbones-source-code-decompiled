package _178
{
   public class _198
   {
      public var duration:int;
      
      public var scale:Number;
      
      public var offset:Number;
      
      private var _1885:Vector.<_189>;
      
      public function _198()
      {
         super();
         this._1885 = new Vector.<_189>(0,true);
         this.duration = 0;
         this.scale = 1;
      }
      
      public static function _2772(param1:Number, param2:Number) : Number
      {
         var _loc3_:Number = 1;
         if(param2 > 1)
         {
            _loc3_ = 0.5 * (1 - Math.cos(param1 * Math.PI));
            param2--;
         }
         else if(param2 > 0)
         {
            _loc3_ = 1 - Math.pow(1 - param1,2);
         }
         else if(param2 < 0)
         {
            param2 *= -1;
            _loc3_ = Math.pow(param1,2);
         }
         return (_loc3_ - param1) * param2 + param1;
      }
      
      public function dispose() : void
      {
         var _loc1_:int = int(this._1885.length);
         while(_loc1_--)
         {
            this._1885[_loc1_].dispose();
         }
         this._1885.fixed = false;
         this._1885.length = 0;
         this._1885 = null;
      }
      
      public function addFrame(param1:_189) : void
      {
         if(!param1)
         {
            throw new ArgumentError();
         }
         if(this._1885.indexOf(param1) < 0)
         {
            this._1885.fixed = false;
            this._1885[this._1885.length] = param1;
            this._1885.fixed = true;
            return;
         }
         throw new ArgumentError();
      }
      
      public function get _1816() : Vector.<_189>
      {
         return this._1885;
      }
      
      public function _2655(param1:Number) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(param1 != 1)
         {
            _loc3_ = 0;
            _loc4_ = int(this._1885.length);
            while(_loc3_ < _loc4_)
            {
               this._1885[_loc3_].duration *= param1;
               _loc3_++;
            }
         }
         var _loc2_:int = this.duration * param1 * this.offset % (this.duration * param1);
         if(_loc2_ > 0)
         {
            this._2774(_loc2_);
         }
      }
      
      private function _2774(param1:int) : void
      {
         var _loc2_:int = 0;
         var _loc5_:_189 = null;
         var _loc6_:_189 = null;
         var _loc9_:int = 0;
         var _loc3_:Vector.<_189> = new Vector.<_189>();
         var _loc4_:Vector.<_189> = new Vector.<_189>();
         var _loc7_:int = 0;
         var _loc8_:int = int(this._1885.length);
         while(_loc7_ < _loc8_)
         {
            _loc6_ = this._1885[_loc7_];
            _loc2_ += _loc6_.duration;
            _loc3_.push(_loc6_);
            if(_loc2_ >= param1)
            {
               _loc9_ = _loc7_ + 1;
               while(_loc9_ < _loc8_)
               {
                  _loc4_.push(this._1885[_loc9_]);
                  _loc9_++;
               }
               if(_loc2_ > param1)
               {
                  if(_loc7_ == _loc8_ - 1)
                  {
                     _loc5_ = this._2771(_loc6_,this._1885[0],_loc6_.duration - (_loc2_ - param1));
                  }
                  else
                  {
                     _loc5_ = this._2771(_loc6_,this._1885[_loc7_ + 1],_loc6_.duration - (_loc2_ - param1));
                  }
                  _loc6_.duration -= _loc2_ - param1;
                  _loc5_.duration -= _loc6_.duration;
                  _loc4_.unshift(_loc5_);
               }
               break;
            }
            _loc7_++;
         }
         this._1885 = _loc4_.concat(_loc3_);
      }
      
      protected function _2771(param1:_189, param2:_189, param3:int) : _189
      {
         return null;
      }
   }
}

