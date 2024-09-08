package _35
{
   import flash.utils.Dictionary;
   
   public class HashObject
   {
      private static var _1843:Object;
      
      public static var _1842:Object;
      
      private static var _1849:Dictionary = new Dictionary();
      
      protected var _id:int = 0;
      
      public function HashObject(param1:int = 0, param2:Object = null)
      {
         var _loc3_:Object = null;
         super();
         if(param2)
         {
            _loc3_ = _1843;
            _1844 = param2;
         }
         if(param1 > 0)
         {
            this._1847(param1);
         }
         else if(param1 == 0)
         {
            this._1847(++_1842[0]);
         }
         else
         {
            this._id = param1;
         }
         if(param2)
         {
            _1844 = _loc3_;
         }
      }
      
      public static function get _1844() : Object
      {
         return _1843;
      }
      
      public static function set _1844(param1:Object) : void
      {
         if(_1843 == param1)
         {
            return;
         }
         _1843 = param1;
         if(!_1849[_1843])
         {
            _1849[_1843] = [0];
         }
         _1842 = _1849[_1843];
      }
      
      public static function _1845(param1:Object) : void
      {
         _1849[param1] = null;
         delete _1849[param1];
      }
      
      public static function _1663(param1:int) : Object
      {
         return _1842[param1];
      }
      
      public static function _1846(param1:Object, param2:int) : Object
      {
         return _1849[param1][param2];
      }
      
      protected function _1847(param1:int) : void
      {
         if(this._id == param1)
         {
            return;
         }
         this._id = param1;
         if(_1842[param1])
         {
            param1 = _1842[0] + 1;
            this._id = param1;
            while(_1842[param1] != null)
            {
               param1++;
               this._id = param1;
            }
         }
         _1842[param1] = this;
         _1842[0] = _1842[0] >= this._id ? _1842[0] : this._id;
      }
      
      public function get id() : int
      {
         return this._id;
      }
   }
}

