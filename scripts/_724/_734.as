package _724
{
   import _741._746;
   import _741._750;
   import _741._751;
   
   public class _734
   {
      public static var _5905:Vector.<_730>;
      
      public static const GROUP_TEXTURE:String = "TEXTURE";
      
      public static const GROUP_IMAGE:String = "IMAGE";
      
      public static const GROUP_FOLDER:String = "FOLDER";
      
      public static const GROUP_DBSWF:String = "DBSWF";
      
      public static const PRIORITY_TEXTURE:int = 10;
      
      public static const PRIORITY_IMAGE:int = 1;
      
      public function _734()
      {
         super();
      }
      
      private static function _5904() : void
      {
         if(_5905 == null)
         {
            _5905 = new Vector.<_730>();
            _5905.push(new _739());
            _5905.push(new _736());
            _5905.sort(_5903);
         }
      }
      
      private static function _5903(param1:_730, param2:_730) : int
      {
         return param1.priority > param2.priority ? -1 : 1;
      }
      
      public static function _5893(param1:Vector.<_746>, param2:Vector.<_725>) : Boolean
      {
         var _loc3_:Boolean = false;
         if(_5905 == null)
         {
            _5904();
         }
         var _loc4_:int = 0;
         var _loc5_:int = int(_5905.length);
         while(_loc4_ < _loc5_)
         {
            _loc3_ = _5905[_loc4_]._5893(param1,param2) || _loc3_;
            _loc4_++;
         }
         return _loc3_;
      }
      
      public static function _5894(param1:Vector.<_725>) : Boolean
      {
         var _loc2_:Boolean = false;
         if(_5905 == null)
         {
            _5904();
         }
         var _loc3_:int = 0;
         var _loc4_:int = int(_5905.length);
         while(_loc3_ < _loc4_)
         {
            _loc2_ = _5905[_loc3_]._5894(param1) || _loc2_;
            _loc3_++;
         }
         return _loc2_;
      }
      
      public static function _5845(param1:String, param2:String) : _733
      {
         var _loc4_:_733 = null;
         var _loc3_:_751 = _750._5901(param1) as _751;
         if(_loc3_)
         {
            _loc4_ = new _733(_loc3_,param2);
         }
         return _loc4_;
      }
   }
}

