package _40
{
   import _51._52;
   import _51._79;
   
   public class _14033
   {
      public static const PLAY:int = 0;
      
      public static const Frame:int = 10;
      
      public static const Sound:int = 11;
      
      public var type:int = 0;
      
      public var name:String = "";
      
      public var bone:_52 = null;
      
      public var slot:_79 = null;
      
      public var ints:Array;
      
      public var floats:Array;
      
      public var strings:Array;
      
      public function _14033()
      {
         this.ints = [];
         this.floats = [];
         this.strings = [];
         super();
      }
      
      public function copyFrom(param1:_14033) : void
      {
         this.name = param1.name;
         this.bone = param1.bone;
         this.slot = param1.slot;
         this.ints = param1.ints.concat();
         this.floats = param1.floats.concat();
         this.strings = param1.strings.concat();
      }
      
      public function clone() : _14033
      {
         var _loc1_:_14033 = new _14033();
         _loc1_.copyFrom(this);
         return _loc1_;
      }
   }
}

