package _178
{
   public final class _180
   {
      public var name:String;
      
      private var _2746:Vector.<_181>;
      
      private var _2745:Vector.<_192>;
      
      private var _2744:Vector.<_193>;
      
      private var _2743:Vector.<_179>;
      
      public function _180()
      {
         super();
         this._2746 = new Vector.<_181>(0,true);
         this._2745 = new Vector.<_192>(0,true);
         this._2744 = new Vector.<_193>(0,true);
         this._2743 = new Vector.<_179>(0,true);
      }
      
      public function _2750(param1:String) : void
      {
         var _loc4_:_192 = null;
         var _loc5_:_193 = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = int(this._2744.length);
         while(_loc2_ < _loc3_)
         {
            this._2744[_loc2_].dispose();
            _loc2_++;
         }
         if(!param1 && this._2745.length > 0)
         {
            _loc4_ = this._2745[0];
         }
         else
         {
            _loc2_ = 0;
            _loc3_ = int(this._2745.length);
            while(_loc2_ < _loc3_)
            {
               if(this._2745[_loc2_].name == param1)
               {
                  _loc4_ = this._2745[_loc2_];
                  break;
               }
               _loc2_++;
            }
         }
         if(_loc4_)
         {
            _loc2_ = 0;
            _loc3_ = int(_loc4_._1780.length);
            while(_loc2_ < _loc3_)
            {
               _loc5_ = this._2748(_loc4_._1780[_loc2_].name);
               if(_loc5_)
               {
                  _loc6_ = 0;
                  _loc7_ = int(_loc4_._1780[_loc2_]._1752.length);
                  while(_loc6_ < _loc7_)
                  {
                     _loc5_._1766(_loc4_._1780[_loc2_]._1752[_loc6_]);
                     _loc6_++;
                  }
               }
               _loc2_++;
            }
         }
      }
      
      public function dispose() : void
      {
         var _loc1_:int = int(this._2746.length);
         while(_loc1_--)
         {
            this._2746[_loc1_].dispose();
         }
         _loc1_ = int(this._2745.length);
         while(_loc1_--)
         {
            this._2745[_loc1_].dispose();
         }
         _loc1_ = int(this._2744.length);
         while(_loc1_--)
         {
            this._2744[_loc1_].dispose();
         }
         _loc1_ = int(this._2743.length);
         while(_loc1_--)
         {
            this._2743[_loc1_].dispose();
         }
         this._2746.fixed = false;
         this._2746.length = 0;
         this._2745.fixed = false;
         this._2745.length = 0;
         this._2744.fixed = false;
         this._2744.length = 0;
         this._2743.fixed = false;
         this._2743.length = 0;
         this._2746 = null;
         this._2745 = null;
         this._2744 = null;
         this._2743 = null;
      }
      
      public function _2749(param1:String) : _181
      {
         var _loc2_:int = int(this._2746.length);
         while(_loc2_--)
         {
            if(this._2746[_loc2_].name == param1)
            {
               return this._2746[_loc2_];
            }
         }
         return null;
      }
      
      public function _2748(param1:String) : _193
      {
         if(!param1 && this._2744.length > 0)
         {
            return this._2744[0];
         }
         var _loc2_:int = int(this._2744.length);
         while(_loc2_--)
         {
            if(this._2744[_loc2_].name == param1)
            {
               return this._2744[_loc2_];
            }
         }
         return null;
      }
      
      public function _2747(param1:String) : _192
      {
         if(!param1 && this._2745.length > 0)
         {
            return this._2745[0];
         }
         var _loc2_:int = int(this._2745.length);
         while(_loc2_--)
         {
            if(this._2745[_loc2_].name == param1)
            {
               return this._2745[_loc2_];
            }
         }
         return null;
      }
      
      public function _1969(param1:String) : _179
      {
         var _loc2_:int = int(this._2743.length);
         while(_loc2_--)
         {
            if(this._2743[_loc2_].name == param1)
            {
               return this._2743[_loc2_];
            }
         }
         return null;
      }
      
      public function _1794(param1:_181) : void
      {
         if(!param1)
         {
            throw new ArgumentError();
         }
         if(this._2746.indexOf(param1) < 0)
         {
            this._2746.fixed = false;
            this._2746[this._2746.length] = param1;
            this._2746.fixed = true;
            return;
         }
         throw new ArgumentError();
      }
      
      public function _1792(param1:_193) : void
      {
         if(!param1)
         {
            throw new ArgumentError();
         }
         if(this._2744.indexOf(param1) < 0)
         {
            this._2744.fixed = false;
            this._2744[this._2744.length] = param1;
            this._2744.fixed = true;
            return;
         }
         throw new ArgumentError();
      }
      
      public function _1790(param1:_192) : void
      {
         if(!param1)
         {
            throw new ArgumentError();
         }
         if(this._2745.indexOf(param1) < 0)
         {
            this._2745.fixed = false;
            this._2745[this._2745.length] = param1;
            this._2745.fixed = true;
            return;
         }
         throw new ArgumentError();
      }
      
      public function _1742(param1:_179) : void
      {
         if(!param1)
         {
            throw new ArgumentError();
         }
         if(this._2743.indexOf(param1) < 0)
         {
            this._2743.fixed = false;
            this._2743[this._2743.length] = param1;
            this._2743.fixed = true;
         }
      }
      
      public function _1741() : void
      {
         var _loc3_:_181 = null;
         var _loc4_:int = 0;
         var _loc5_:_181 = null;
         var _loc1_:int = int(this._2746.length);
         if(_loc1_ == 0)
         {
            return;
         }
         var _loc2_:Array = [];
         while(_loc1_--)
         {
            _loc3_ = this._2746[_loc1_];
            _loc4_ = 0;
            _loc5_ = _loc3_;
            while(_loc5_)
            {
               _loc4_++;
               _loc5_ = this._2749(_loc5_.parent);
            }
            _loc2_[_loc1_] = [_loc4_,_loc3_];
         }
         _loc2_.sortOn("0",Array.NUMERIC);
         _loc1_ = int(_loc2_.length);
         while(_loc1_--)
         {
            this._2746[_loc1_] = _loc2_[_loc1_][1];
         }
      }
      
      public function get _1779() : Vector.<_181>
      {
         return this._2746;
      }
      
      public function get _1781() : Vector.<_192>
      {
         return this._2745;
      }
      
      public function get _1963() : Vector.<_179>
      {
         return this._2743;
      }
      
      public function get _1780() : Vector.<_193>
      {
         return this._2744;
      }
   }
}

