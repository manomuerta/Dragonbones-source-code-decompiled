package _755
{
   import _51._50;
   import _51._52;
   import _51._79;
   
   public class _759
   {
      public var bone:Boolean = true;
      
      public var image:Boolean = true;
      
      public var _11294:Boolean;
      
      public var _5938:Object;
      
      public function _759()
      {
         this._5938 = {};
         super();
      }
      
      public static function _1630(param1:Object) : _759
      {
         var _loc3_:int = 0;
         var _loc4_:Object = null;
         var _loc5_:_754 = null;
         var _loc2_:_759 = new _759();
         if(param1)
         {
            _loc2_.bone = param1.bone != null ? Boolean(param1.bone) : true;
            _loc2_.image = param1.image != null ? Boolean(param1.image) : true;
            for each(_loc4_ in param1.armatures)
            {
               (_loc5_ = new _754(_loc4_.id)).markedBoneList = _loc4_.bones;
               _loc5_.markedSlotList = _loc4_.slots;
               _loc2_._5938[_loc4_.id] = _loc5_;
            }
         }
         return _loc2_;
      }
      
      public static function _1629(param1:_759) : Object
      {
         var _loc3_:_754 = null;
         var _loc2_:Object = {
            "bone":param1.bone,
            "image":param1.image,
            "armatures":[]
         };
         for each(_loc3_ in param1._5938)
         {
            _loc2_.armatures.push({
               "id":_loc3_._5922,
               "bones":_loc3_.markedBoneList,
               "slots":_loc3_.markedSlotList
            });
         }
         return _loc2_;
      }
      
      public function _5936(param1:int) : _754
      {
         return this._5938[param1];
      }
      
      public function _3865(param1:int, param2:int) : Boolean
      {
         var _loc3_:_754 = this._5938[param1] as _754;
         return !!_loc3_ ? _loc3_.markedBoneList.indexOf(param2) == -1 : true;
      }
      
      public function _3866(param1:int, param2:int) : Boolean
      {
         var _loc3_:_754 = this._5938[param1] as _754;
         return !!_loc3_ ? _loc3_.markedSlotList.indexOf(param2) == -1 : true;
      }
      
      public function _3342(param1:int, param2:int, param3:Boolean) : void
      {
         this._5940(param1,param2,param3,"markedBoneList");
      }
      
      public function _3343(param1:int, param2:int, param3:Boolean) : void
      {
         this._5940(param1,param2,param3,"markedSlotList");
      }
      
      public function _3337(param1:_50, param2:Boolean) : void
      {
         var _loc4_:_52 = null;
         var _loc5_:_79 = null;
         var _loc3_:_754 = this._5938[param1.id] as _754;
         if(!_loc3_)
         {
            _loc3_ = new _754(param1.id);
            this._5938[param1.id] = _loc3_;
         }
         if(param2)
         {
            _loc3_.markedBoneList = [];
            _loc3_.markedSlotList = [];
         }
         else
         {
            for each(_loc4_ in param1._1779)
            {
               _loc3_.markedBoneList.push(_loc4_.id);
            }
            for each(_loc5_ in param1._1780)
            {
               _loc3_.markedSlotList.push(_loc5_.id);
            }
         }
      }
      
      private function _5940(param1:int, param2:int, param3:Boolean, param4:String) : void
      {
         var _loc5_:_754 = this._5938[param1] as _754;
         if(!_loc5_)
         {
            _loc5_ = new _754(param1);
            this._5938[param1] = _loc5_;
         }
         if(param3)
         {
            this._5937(param2,_loc5_[param4] as Array);
         }
         else
         {
            this._5939(param2,_loc5_[param4] as Array);
         }
      }
      
      private function _5939(param1:int, param2:Array) : void
      {
         if(param2.indexOf(param1) == -1)
         {
            param2.push(param1);
         }
      }
      
      private function _5937(param1:int, param2:Array) : void
      {
         var _loc3_:int = int(param2.indexOf(param1));
         if(param2.indexOf(param1) != -1)
         {
            param2.splice(_loc3_,1);
         }
      }
   }
}

