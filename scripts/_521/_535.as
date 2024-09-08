package _521
{
   import _51._52;
   import _51._70;
   import _51._79;
   import _6._7;
   import _639._638;
   import _708._715;
   import _755._759;
   
   public class _535 extends _7
   {
      public static var instance:_535;
      
      private var _3879:_759;
      
      public function _535()
      {
         super();
         instance = this;
      }
      
      public function _3371(param1:Object, param2:Boolean = true) : Boolean
      {
         var _loc3_:_52 = null;
         var _loc4_:_79 = null;
         if(!param1)
         {
            return false;
         }
         if(!this._3879)
         {
            return true;
         }
         if(this._3879._11294)
         {
            return false;
         }
         if(param1 is _52)
         {
            _loc3_ = param1 as _52;
            return (param2 ? true : this._3881) && this._3879._3865(_loc3_.rootArmatureData.id,_loc3_.id);
         }
         if(param1 is _70)
         {
            param1 = (param1 as _70)._1760;
         }
         if(param1 is _79)
         {
            _loc4_ = param1 as _79;
            if((Boolean(_loc4_)) && _loc4_.parentBoneData == null)
            {
               return false;
            }
            return (param2 ? true : this._3880) && this._3879._3866(_loc4_.parentBoneData.rootArmatureData.id,_loc4_.id);
         }
         return true;
      }
      
      public function _3878(param1:Object, param2:Boolean) : void
      {
         if(param1 is _52)
         {
            this._3879._3342((param1 as _52).rootArmatureData.id,(param1 as _52).id,param2);
         }
         else if(param1 is _79)
         {
            this._3879._3342((param1 as _79).parentBoneData.rootArmatureData.id,(param1 as _52).id,param2);
         }
      }
      
      public function get _3881() : Boolean
      {
         return !!this._3879 ? this._3879.bone : true;
      }
      
      public function get _3880() : Boolean
      {
         if(this._2873 == _715.NULL)
         {
            return false;
         }
         if(this._2873 == _715.GENERAL)
         {
            return true;
         }
         return !!this._3879 ? (this._3879._11294 ? false : this._3879.image) : true;
      }
      
      public function set visibleFilter(param1:_759) : void
      {
         if(this._3879 == param1)
         {
            return;
         }
         this._3879 = param1;
      }
      
      private function get _2873() : _715
      {
         return (_1568.appModel as _638)._2220._2873;
      }
      
      public function get _11294() : Boolean
      {
         if(this._3879)
         {
            return this._3879._11294;
         }
         return false;
      }
   }
}

