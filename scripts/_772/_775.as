package _772
{
   public class _775 implements _774
   {
      public static const SHORTCUT:int = 1;
      
      public static const WELCOME:int = 2;
      
      public static const MENU:int = 3;
      
      public static const TOOLBAR:int = 4;
      
      public static const TYPE_DB:int = 1;
      
      public static const TYPE_COMIC:int = 2;
      
      public static const SYMBOL_ARMATURE:uint = 1;
      
      public static const SYMBOL_BASIC:uint = 2;
      
      public static const SYMBOL_STAGE:uint = 4;
      
      public static const SYMBOL_COMIC:uint = 8;
      
      public static const SYMBOL_SHEET:uint = 16;
      
      public var name:int = 41;
      
      public var op:int;
      
      public var type:int;
      
      public var value1:uint;
      
      public var result:String;
      
      public function _775()
      {
         super();
      }
      
      public function _5965() : Object
      {
         var _loc1_:Object = {};
         _loc1_.Name = this.name;
         _loc1_.op = this.op;
         _loc1_.type = this.type;
         _loc1_.contain = this.value1;
         _loc1_.result = this.result;
         return _loc1_;
      }
   }
}

