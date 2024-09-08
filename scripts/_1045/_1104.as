package _1045
{
   import avmplus.getQualifiedClassName;
   import avmplus.getQualifiedSuperclassName;
   import flash.utils.getDefinitionByName;
   
   public class _1104
   {
      protected var _8562:Object;
      
      public function _1104()
      {
         this._8562 = {};
         super();
         this._8563();
      }
      
      protected function _8563() : void
      {
      }
      
      public function _8343(param1:_1085) : Object
      {
         var _loc3_:Class = null;
         var _loc5_:Object = null;
         var _loc6_:String = null;
         var _loc2_:Object = this._8562;
         var _loc4_:String = param1.hostComponentKey;
         if(_loc4_)
         {
            _loc3_ = _loc2_[_loc4_];
         }
         else
         {
            _loc5_ = param1;
            while(_loc5_)
            {
               _loc4_ = getQualifiedClassName(_loc5_);
               _loc3_ = _loc2_[_loc4_];
               if(_loc3_)
               {
                  break;
               }
               _loc6_ = getQualifiedSuperclassName(_loc5_);
               if(!_loc6_)
               {
                  break;
               }
               _loc5_ = getDefinitionByName(_loc6_);
            }
         }
         if(!_loc3_)
         {
            return null;
         }
         return new _loc3_();
      }
   }
}

