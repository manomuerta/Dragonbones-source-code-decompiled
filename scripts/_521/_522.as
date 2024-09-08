package _521
{
   import _51._50;
   import _51._52;
   import _51._70;
   import _51._77;
   import _51._79;
   import _6._7;
   import flash.utils.Dictionary;
   
   public class _522 extends _7
   {
      public var _2944:Dictionary;
      
      public var _2273:Dictionary;
      
      public var _3776:Dictionary;
      
      public var _10737:Dictionary;
      
      public var _14495:Dictionary;
      
      public function _522()
      {
         this._2944 = new Dictionary();
         this._2273 = new Dictionary();
         this._3776 = new Dictionary();
         this._10737 = new Dictionary();
         this._14495 = new Dictionary();
         super();
      }
      
      public function _3401(param1:_52) : void
      {
         if(!this._2944[param1])
         {
            this._2944[param1] = {"transform":true};
         }
         else
         {
            this._2944[param1].transform = true;
         }
      }
      
      public function _14427(param1:_77) : void
      {
         if(!this._14495[param1])
         {
            this._14495[param1] = {
               "weight":true,
               "bend":false
            };
         }
         else
         {
            this._14495[param1].weight = true;
         }
      }
      
      public function _14430(param1:_77) : void
      {
         if(!this._14495[param1])
         {
            this._14495[param1] = {
               "weight":false,
               "bend":true
            };
         }
         else
         {
            this._14495[param1].bend = true;
         }
      }
      
      public function _3408(param1:_79) : void
      {
         if(!this._2273[param1])
         {
            this._2273[param1] = {
               "display":true,
               "color":false,
               "animation":false
            };
         }
         else
         {
            this._2273[param1].display = true;
         }
      }
      
      public function _3397(param1:_79) : void
      {
         if(!this._2273[param1])
         {
            this._2273[param1] = {
               "display":false,
               "color":true,
               "animation":false
            };
         }
         else
         {
            this._2273[param1].color = true;
         }
      }
      
      public function _3404(param1:_79) : void
      {
         if(!this._2273[param1])
         {
            this._2273[param1] = {
               "display":false,
               "color":false,
               "animation":true
            };
         }
         else
         {
            this._2273[param1].animation = true;
         }
      }
      
      public function _3141(param1:_70) : void
      {
         if(!this._3776[param1])
         {
            this._3776[param1] = {"ffd":true};
         }
         else
         {
            this._3776[param1].ffd = true;
         }
      }
      
      public function _10710(param1:_50) : void
      {
         if(!this._10737[param1])
         {
            this._10737[param1] = {"zOrder":true};
         }
         else
         {
            this._10737[param1].zOrder = true;
         }
      }
      
      public function _3775(param1:_52) : Boolean
      {
         return !!this._2944[param1] ? Boolean(this._2944[param1].transform) : false;
      }
      
      public function _3774(param1:_79) : Boolean
      {
         return !!this._2273[param1] ? Boolean(this._2273[param1].display) || Boolean(this._2273[param1].color) || Boolean(this._2273[param1].animation) : false;
      }
      
      public function _14017(param1:_79) : Boolean
      {
         return !!this._2273[param1] ? Boolean(this._2273[param1].animation) : false;
      }
      
      public function _3773(param1:_70) : Boolean
      {
         return !!this._3776[param1] ? Boolean(this._3776[param1].ffd) : false;
      }
      
      public function _10736(param1:_50) : Boolean
      {
         return !!this._10737[param1] ? Boolean(this._10737[param1].zOrder) : false;
      }
      
      public function _14494(param1:_77) : Boolean
      {
         return !!this._14495[param1] ? Boolean(this._14495[param1].bend) || Boolean(this._14495[param1].weight) : false;
      }
      
      public function _3395(param1:_52) : void
      {
         param1._2002 = null;
         param1._13657 = false;
         param1._13658 = false;
         param1._13659 = false;
         this._2944[param1] = null;
         delete this._2944[param1];
      }
      
      public function _3394(param1:_79) : void
      {
         param1._2145 = _79.UNDEFINE;
         param1._2147 = null;
         param1._13689 = false;
         param1._13688 = false;
         param1._2161 = null;
         this._2273[param1] = null;
         delete this._2273[param1];
      }
      
      public function _14428(param1:_77) : void
      {
         param1._2134 = 0;
         if(this._14495[param1])
         {
            this._14495[param1].bend = false;
         }
      }
      
      public function _14426(param1:_77) : void
      {
         param1._2133 = -1;
         if(this._14495[param1])
         {
            this._14495[param1].weight = false;
         }
      }
      
      public function _14431(param1:_77) : void
      {
         param1._2134 = 0;
         param1._2133 = -1;
         this._14495[param1] = null;
         delete this._14495[param1];
      }
      
      public function _3134(param1:_70) : void
      {
         param1._2094 = null;
         this._3776[param1] = null;
         delete this._3776[param1];
      }
      
      public function _10707(param1:_50 = null) : void
      {
         var _loc2_:* = undefined;
         if(param1 == null)
         {
            for(_loc2_ in this._10737)
            {
               this._10707(_loc2_);
            }
         }
         else
         {
            param1._10662 = null;
            this._10737[param1] = null;
            delete this._10737[param1];
         }
      }
      
      public function _3151() : void
      {
         var _loc1_:* = undefined;
         var _loc2_:* = undefined;
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         var _loc5_:* = undefined;
         for(_loc1_ in this._2944)
         {
            this._3395(_loc1_);
         }
         for(_loc2_ in this._2273)
         {
            this._3394(_loc2_);
         }
         for(_loc3_ in this._3776)
         {
            this._3134(_loc3_);
         }
         for(_loc4_ in this._10737)
         {
            this._10707(_loc4_);
         }
         for(_loc5_ in this._14495)
         {
            this._14431(_loc5_);
         }
      }
   }
}

