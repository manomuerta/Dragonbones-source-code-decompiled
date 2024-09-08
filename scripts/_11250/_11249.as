package _11250
{
   import _11220._11219;
   import _51._70;
   import _51._79;
   import _658._661;
   import _93._95;
   import flash.events.Event;
   
   public class _11249 extends _95
   {
      private var _3670:_70;
      
      private var _11435:_11219;
      
      private var _4213:_79;
      
      private var _5711:Boolean;
      
      private var _5708:_661;
      
      private var _3822:Vector.<_661>;
      
      private var _5709:Vector.<_661>;
      
      private var _11159:Vector.<_661>;
      
      private var _5710:Vector.<_661>;
      
      private var _1857:Number = 1;
      
      private var _11384:_661;
      
      public var _4266:Vector.<_661>;
      
      public var _12695:Vector.<_661>;
      
      public var _11405:Boolean;
      
      public var _11400:_661;
      
      public function _11249(param1:_70)
      {
         super();
         this._3670 = param1;
         this._4213 = this._3670._1760;
         this._11435 = this._3670._11278;
         this._5710 = new Vector.<_661>(2);
         this._5709 = new Vector.<_661>(2);
         this._11159 = new Vector.<_661>();
         this._12695 = new Vector.<_661>();
         this._4266 = new Vector.<_661>();
      }
      
      public function _11426(param1:_79) : void
      {
         this._4213 = param1;
      }
      
      public function get vo() : _70
      {
         return this._3670;
      }
      
      public function _9680() : uint
      {
         return this._11435.color;
      }
      
      public function get vertices() : Vector.<_661>
      {
         return this._11435.vertices;
      }
      
      public function set invalid(param1:Boolean) : void
      {
         this._5711 = param1;
      }
      
      public function isSelected(param1:_661) : Boolean
      {
         if(Boolean(this._3822) && Boolean(param1))
         {
            return this._3822.indexOf(param1) != -1;
         }
         return false;
      }
      
      public function _5155() : Boolean
      {
         if(Boolean(this._3822) && Boolean(this._5708))
         {
            return this._3822.indexOf(this._5708) != -1;
         }
         return false;
      }
      
      public function get _4209() : _661
      {
         return this._5708;
      }
      
      public function set _4209(param1:_661) : void
      {
         if(this._5708 != param1)
         {
            this._5708 = param1;
            this._2466();
         }
      }
      
      public function get _3823() : Vector.<_661>
      {
         return this._3822;
      }
      
      public function set _3823(param1:Vector.<_661>) : void
      {
         this._3822 = param1;
         this._11148();
         this._2466();
      }
      
      public function _4231(param1:_661, param2:_661) : void
      {
         if(this._5709[0] != param1 || this._5709[1] != param2)
         {
            this._5709[0] = param1;
            this._5709[1] = param2;
            this._2466();
         }
      }
      
      public function get _5712() : Vector.<_661>
      {
         return this._5710;
      }
      
      public function get _5713() : Vector.<_661>
      {
         return this._5709;
      }
      
      public function _2466() : void
      {
         this._5711 = true;
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      public function _4208(param1:_661, param2:_661) : void
      {
         if(this._5710[0] != param1)
         {
            this._5710[0] = param1;
            this._5710[1] = param2;
            this._2466();
         }
      }
      
      public function get scale() : Number
      {
         return this._1857;
      }
      
      public function set scale(param1:Number) : void
      {
         if(this._1857 != param1)
         {
            this._1857 = param1;
            this._5711 = false;
            this._2466();
         }
      }
      
      public function get _1837() : _79
      {
         return this._4213;
      }
      
      public function get _11160() : Vector.<_661>
      {
         return this._11159;
      }
      
      public function get _11397() : _11219
      {
         return this._11435;
      }
      
      public function set _11385(param1:_661) : void
      {
         this._11384 = param1;
         this._2466();
      }
      
      public function get _11385() : _661
      {
         return this._11384;
      }
      
      public function _11148() : void
      {
         this._11159.length = 0;
         if(this._3822 == null)
         {
            return;
         }
      }
      
      public function clear() : void
      {
         this._11159.length = 0;
         this._11385 = null;
         this._4266.length = 0;
         this._12695.length = 0;
         this._5709[0] = null;
         this._5709[1] = null;
         this._5710[0] = null;
         this._5710[1] = null;
         this._11159.length = 0;
         this._5708 = null;
      }
      
      public function _12646(param1:_661, param2:Vector.<_661>) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         _loc3_ = 0;
         _loc4_ = int(param2.length);
         while(_loc3_ < _loc4_)
         {
            this._4266.push(param2[_loc3_]);
            _loc3_++;
         }
         this._12695.push(param1);
      }
      
      public function _12643() : void
      {
         this._4266.length = 0;
         this._12695.length = 0;
      }
   }
}

