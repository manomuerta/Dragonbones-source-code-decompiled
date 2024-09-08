package _953
{
   import _1038._1037;
   import _1038._1039;
   import _127._131;
   import _51._52;
   import _521._535;
   import _6.Context;
   import _639._638;
   import _822._821;
   import _948._947;
   import _97._103;
   import flash.events.Event;
   
   public class _954 extends _131
   {
      protected var _6092:_52;
      
      protected var _6090:_947;
      
      private var _6759:Boolean = true;
      
      private var _6760:Boolean = true;
      
      private var _6755:Object;
      
      public function _954()
      {
         this._6755 = {};
         super();
         itemRenderer = _947;
         this._3854 = true;
      }
      
      public function dispose() : void
      {
      }
      
      public function _5128(param1:String, param2:Boolean) : void
      {
         this._6755[param1] = param2;
         this._6758();
      }
      
      private function _6758() : void
      {
         var _loc2_:Boolean = false;
         var _loc1_:Boolean = true;
         for each(_loc2_ in this._6755)
         {
            if(!_loc2_)
            {
               _loc1_ = false;
               break;
            }
         }
         mouseEnabled = _loc1_;
         mouseChildren = _loc1_;
      }
      
      override public function set dataProvider(param1:_1039) : void
      {
         super.dataProvider = param1;
      }
      
      public function _5370(param1:_52) : void
      {
         _103.addItem(param1);
         dataProvider._4016(param1);
      }
      
      public function set _6761(param1:Boolean) : void
      {
         if(this._6759 == param1)
         {
            return;
         }
         this._6759 = param1;
         if(this._6090)
         {
            if(this._6759)
            {
               this._6090._4901 = true;
            }
            else
            {
               this._6090._4901 = false;
            }
         }
      }
      
      public function get _5021() : _52
      {
         return !!this._6090 ? this._6090._1823 : null;
      }
      
      public function set _5021(param1:_52) : void
      {
         if(this._6092 == param1)
         {
            return;
         }
         this._6092 = param1;
         var _loc2_:_947 = !!param1 ? _2474(param1) as _947 : null;
         if(Boolean(this._6090) && Boolean(this._6090.owner))
         {
            this._6090._4901 = false;
            if(this._5024)
            {
               this._6090._2033 = !this._6759;
            }
         }
         this._6090 = _loc2_;
         if(Boolean(this._6090) && this._6759)
         {
            this._6090._4901 = true;
         }
         if(this._6090 && this._5024 && _535.instance._3371(this._6092))
         {
            this._6090._2033 = true;
         }
         this._3194();
         dispatchEvent(new Event("rolloveredItemChanged"));
      }
      
      public function _3194() : void
      {
         var _loc1_:_947 = null;
         var _loc2_:int = 0;
         var _loc3_:int = _2490._2249;
         while(_loc2_ < _loc3_)
         {
            _loc1_ = _2490.getElementAt(_loc2_) as _947;
            if(_loc1_)
            {
               _loc1_._1988();
            }
            _loc2_++;
         }
      }
      
      public function _14656() : void
      {
         var _loc1_:_947 = null;
         var _loc2_:_821 = null;
         var _loc3_:int = 0;
         var _loc4_:int = _2490._2249;
         while(_loc3_ < _loc4_)
         {
            _loc1_ = _2490.getElementAt(_loc3_) as _947;
            _loc2_ = _loc1_._6742;
            if(_loc1_ && !(_loc1_ as _947)._1823._2028 && _loc2_._6197(_loc1_._1823._14270))
            {
               _loc1_._6200();
            }
            _loc3_++;
         }
      }
      
      public function _14416(param1:Array, param2:uint) : void
      {
         var _loc3_:_947 = null;
         var _loc4_:_821 = null;
         var _loc5_:_52 = null;
         var _loc8_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = _2490._2249;
         while(_loc6_ < _loc7_)
         {
            _loc3_ = _2490.getElementAt(_loc6_) as _947;
            _loc4_ = _loc3_._6742;
            _loc8_ = 0;
            while(_loc8_ < param1.length)
            {
               _loc5_ = param1[_loc8_];
               if(_loc3_ && _loc3_._1823 == _loc5_ && _loc4_._6197(param2))
               {
                  _loc5_._14270 = param2;
                  _loc3_._6200();
               }
               _loc8_++;
            }
            _loc6_++;
         }
      }
      
      public function updataBoneSize() : void
      {
         var _loc1_:_947 = null;
         var _loc2_:int = 0;
         var _loc3_:int = _2490._2249;
         while(_loc2_ < _loc3_)
         {
            _loc1_ = _2490.getElementAt(_loc2_) as _947;
            if(_loc1_)
            {
               _loc1_._1751();
               _loc1_._6732();
            }
            _loc2_++;
         }
      }
      
      public function _12961() : void
      {
         var _loc1_:_947 = null;
         var _loc2_:int = 0;
         var _loc3_:int = _2490._2249;
         while(_loc2_ < _loc3_)
         {
            _loc1_ = _2490.getElementAt(_loc2_) as _947;
            if(_loc1_)
            {
               _loc1_._6200();
            }
            _loc2_++;
         }
      }
      
      public function _5013() : void
      {
         var _loc1_:_947 = null;
         var _loc2_:int = 0;
         var _loc3_:int = _2490._2249;
         while(_loc2_ < _loc3_)
         {
            _loc1_ = _2490.getElementAt(_loc2_) as _947;
            if(_loc1_)
            {
               _loc1_._6734();
            }
            _loc2_++;
         }
      }
      
      public function get _6756() : _947
      {
         return this._6090;
      }
      
      public function get _6757() : _1037
      {
         return dataProvider as _1037;
      }
      
      public function get _5024() : Boolean
      {
         return this._6760;
      }
      
      public function set _5024(param1:Boolean) : void
      {
         this._6760 = param1;
         if(this._6760)
         {
            if(!this._6092)
            {
               if(this._2214 && this._2214._1844 && this._2214._1844._2871 && Boolean(this._2214._1844._2871._2865))
               {
                  this._2214._1844._2871._2865._1990._2016(false);
                  this._3194();
               }
            }
         }
      }
      
      protected function get _2214() : _638
      {
         return Context.getInstance()._1568.appModel as _638;
      }
   }
}

