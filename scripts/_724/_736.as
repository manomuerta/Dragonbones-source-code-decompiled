package _724
{
   import _741._14089;
   import _741._14090;
   import _741._743;
   import _741._745;
   import _741._746;
   import _741._747;
   import _741._749;
   
   public class _736 implements _730
   {
      public function _736()
      {
         super();
      }
      
      public function _5893(param1:Vector.<_746>, param2:Vector.<_725>) : Boolean
      {
         var _loc3_:Boolean = false;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(param1 == null || param2 == null)
         {
            return false;
         }
         _loc4_ = 0;
         _loc5_ = int(param2.length);
         while(_loc4_ < _loc5_)
         {
            if(param2[_loc4_] is _731)
            {
               if(param2[_loc4_].missing)
               {
                  param2.splice(_loc4_,1);
                  _loc4_--;
                  _loc5_--;
               }
            }
            _loc4_++;
         }
         _loc4_ = 0;
         _loc5_ = int(param1.length);
         while(_loc4_ < _loc5_)
         {
            if(param1[_loc4_].group == null && !param1[_loc4_].removed)
            {
               if(param1[_loc4_] is _749)
               {
                  param2.push(new _731(param1[_loc4_]));
               }
               else if(param1[_loc4_] is _14089)
               {
                  param2.push(new _14084(param1[_loc4_]));
               }
               else if(param1[_loc4_] is _747)
               {
                  param2.push(new _731(param1[_loc4_]));
               }
               else if(param1[_loc4_] is _745)
               {
                  param2.push(new _728(param1[_loc4_] as _745));
               }
               else if(param1[_loc4_] is _743)
               {
                  param2.push(new _727(param1[_loc4_] as _743));
               }
               else if(param1[_loc4_] is _14090)
               {
                  param2.push(new _14086(param1[_loc4_] as _14090));
               }
               _loc3_ = true;
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      public function _5894(param1:Vector.<_725>) : Boolean
      {
         var _loc2_:Boolean = false;
         if(param1 == null)
         {
            return false;
         }
         var _loc3_:int = 0;
         var _loc4_:int = int(param1.length);
         while(_loc3_ < _loc4_)
         {
            if(param1[_loc3_] is _731 || param1[_loc3_] is _727 || param1[_loc3_] is _14086)
            {
               if(param1[_loc3_].missing)
               {
                  _loc2_ = true;
                  param1.splice(_loc3_,1);
                  _loc3_--;
                  _loc4_--;
               }
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function get priority() : int
      {
         return _734.PRIORITY_IMAGE;
      }
   }
}

