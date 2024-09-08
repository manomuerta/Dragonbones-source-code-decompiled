package _51
{
   import _73._74;
   
   public class _71
   {
      public var name:String;
      
      public var version:String;
      
      public var frameRate:Number;
      
      public var _2126:Vector.<_50>;
      
      public function _71()
      {
         super();
      }
      
      public static function _1572(param1:String, param2:String, param3:Number, param4:Vector.<_50>) : _71
      {
         var _loc5_:_71;
         (_loc5_ = new _71()).name = param1;
         _loc5_.version = param2;
         _loc5_.frameRate = param3;
         _loc5_._2126 = param4;
         return _loc5_;
      }
      
      public function _2128(param1:_50) : void
      {
         this._2126.push(param1);
      }
      
      public function _2125(param1:_50) : void
      {
         var _loc2_:int = int(this._2126.indexOf(param1));
         if(_loc2_ != -1)
         {
            this._2126.splice(_loc2_,1);
         }
      }
      
      public function _2124(param1:String) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = int(this._2126.length);
         while(_loc2_ < _loc3_)
         {
            if(this._2126[_loc2_].name == param1)
            {
               this._2126.splice(_loc2_,1);
               break;
            }
            _loc2_++;
         }
      }
      
      public function _2107(param1:String) : _50
      {
         var _loc2_:int = 0;
         var _loc3_:int = int(this._2126.length);
         while(_loc2_ < _loc3_)
         {
            if(this._2126[_loc2_].name == param1)
            {
               return this._2126[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
      
      public function _2129(param1:String) : Boolean
      {
         return this._2107(param1) != null;
      }
      
      public function _2127(param1:_50, param2:String) : Boolean
      {
         var _loc5_:_79 = null;
         var _loc6_:_70 = null;
         var _loc7_:_50 = null;
         if(param1.name == param2)
         {
            return true;
         }
         var _loc3_:int = 0;
         var _loc4_:int = int(param1._1780.length);
         while(_loc3_ < _loc4_)
         {
            _loc5_ = param1._1780[_loc3_];
            for each(_loc6_ in _loc5_._1765)
            {
               if(_loc6_.type == _74.ARMATURE)
               {
                  if(_loc6_.name == param2)
                  {
                     return true;
                  }
                  _loc7_ = this._2107(_loc6_.name);
                  if(_loc7_)
                  {
                     if(this._2127(_loc7_,param2))
                     {
                        return true;
                     }
                  }
               }
            }
            _loc3_++;
         }
         return false;
      }
   }
}

