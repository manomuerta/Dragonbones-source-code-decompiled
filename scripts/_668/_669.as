package _668
{
   import _1038._1042;
   import _51._50;
   import _676._687;
   import _676._700;
   import _93._95;
   import _97._10600;
   import flash.utils.Dictionary;
   
   public class _669 extends _95
   {
      private static var _5801:Dictionary = new Dictionary(false);
      
      private var _3251:_50;
      
      public var _10659:Array;
      
      public var _10800:Array;
      
      public var _10799:Object;
      
      public function _669()
      {
         super();
      }
      
      public function get _1886() : _50
      {
         return this._3251;
      }
      
      public function set _1886(param1:_50) : void
      {
         if(this._3251 == param1)
         {
            return;
         }
         this._3251 = param1;
         if(this._3251)
         {
            if(!this._3997)
            {
               _5801[this._3251] = new _1042();
            }
            this._3997.source = _687._1572(this._3251._1780);
         }
      }
      
      public function get _3997() : _1042
      {
         return _5801[this._3251];
      }
      
      public function get _2911() : _687
      {
         return this._3997.source as _687;
      }
      
      public function _10744(param1:Array, param2:Array) : void
      {
         var _loc3_:Object = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Array = null;
         var _loc7_:Array = null;
         this._10659 = param1;
         this._10800 = param2;
         this._10799 = null;
         if(this._10659 && this._10800 && param1.length > 0 && param2.length > 0)
         {
            _loc3_ = {};
            _loc4_ = 0;
            this._10799 = {};
            _loc4_ = 0;
            _loc5_ = int(this._10800.length);
            while(_loc4_ < _loc5_)
            {
               _loc3_[this._10800[_loc4_]] = _loc4_;
               _loc4_++;
            }
            _loc6_ = [];
            _loc4_ = 0;
            _loc5_ = int(this._10659.length);
            while(_loc4_ < _loc5_)
            {
               _loc6_.push(_loc3_[this._10659[_loc4_]]);
               _loc4_++;
            }
            _loc7_ = _10600._10669(_loc6_);
            _loc4_ = 0;
            _loc5_ = int(_loc7_.length);
            while(_loc4_ < _loc5_)
            {
               this._10799[this._10800[_loc7_[_loc4_]]] = _loc7_[_loc4_ + 1] == 0 ? 0 : (_loc7_[_loc4_ + 1] > 0 ? -1 : 1);
               _loc4_ += 2;
            }
         }
      }
      
      public function _1987(param1:_700) : int
      {
         if(this._10799)
         {
            if(this._10799[param1._1837.name] != null)
            {
               return this._10799[param1._1837.name];
            }
            return 0;
         }
         return 0;
      }
   }
}

